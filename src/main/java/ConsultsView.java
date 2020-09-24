import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/consults-view")
public class ConsultsView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String mentor;
        /* проверка нужна, т.к. при возвращении со страницы "consult-add" теряется параметр "mentor", который приходит
        * со страницы "consult.jsp"
        * поэтому, если параметр пришел, о запишем в сессию, если параметр потерялся - возьмем из сессии
        * */
        if (req.getParameter("mentor") != null) {
            mentor = req.getParameter("mentor");
            session.setAttribute("mentor", mentor);
        } else
            mentor = (String) session.getAttribute("mentor");

        // список консультаций ментора, на которому произвели переход
        List<DataBase.Consultations.Consultation> consultationList =
                DataBase.INSTANCE.consultations.getAll().stream().
                        filter(e -> e.getMentor().equals(mentor)).
                        sorted(Comparator.comparing(e -> e.getStart())).collect(Collectors.toList());

//        System.out.println(req.getParameter("mentor"));
//        System.out.println(consultationList);

        List<InfoConsult> mondayConsults = getListInfoConsult(dayListConsultations(consultationList, 1));
        List<InfoConsult> tuesdayConsults = getListInfoConsult(dayListConsultations(consultationList, 2));
        List<InfoConsult> wednesdayConsults = getListInfoConsult(dayListConsultations(consultationList, 3));
        List<InfoConsult> thursdayConsults = getListInfoConsult(dayListConsultations(consultationList, 4));
        List<InfoConsult> fridayConsults = getListInfoConsult(dayListConsultations(consultationList, 5));
        List<InfoConsult> saturdayConsults = getListInfoConsult(dayListConsultations(consultationList, 6));
        List<InfoConsult> sundayConsults = getListInfoConsult(dayListConsultations(consultationList, 7));

        // передаем информацию о консультациях по всем дням недели
        req.setAttribute("mondayConsults", mondayConsults);
        req.setAttribute("tuesdayConsults", tuesdayConsults);
        req.setAttribute("wednesdayConsults", wednesdayConsults);
        req.setAttribute("thursdayConsults", thursdayConsults);
        req.setAttribute("fridayConsults", fridayConsults);
        req.setAttribute("saturdayConsults", saturdayConsults);
        req.setAttribute("sundayConsults", sundayConsults);

        req.getRequestDispatcher("consults-view.jsp").forward(req, resp);
    }

    // список консультаций по дням
    private List<DataBase.Consultations.Consultation> dayListConsultations(List<DataBase.Consultations.Consultation>
                                                                                   list, int day) {
        return list.stream().filter(e -> dayOfWeek(e.getStart()) == day).collect(Collectors.toList());
    }

    // получаем список из объектов InfoConsult, в которых находится информация понятная пользователю
    private List<InfoConsult> getListInfoConsult(List<DataBase.Consultations.Consultation> list) {
        List<InfoConsult> consultList = new ArrayList<>();
        list.forEach(e -> consultList.add(new InfoConsult(getDate(e.getStart()) ,e.getStart(), getTime(e.getStart()),
                e.getDuration(), getDurationInMinutes(e.getDuration()),
                getTime(e.getStart() + e.getDuration()), existStudent(e.getStudent()))));
        return consultList;
    }

    private ZonedDateTime getZonedDT(long millisecond) {
        return ZonedDateTime.ofInstant(Instant.ofEpochMilli(millisecond), ZoneId.of("Europe/Moscow"));
    }

    // получить номер дня недели
    private int dayOfWeek(long millisecond) {
        return getZonedDT(millisecond).getDayOfWeek().getValue();
    }

    // получить дату в формате: "18 июня"
    private String getDate(long millisecond) {
        return getZonedDT(millisecond).format(DateTimeFormatter.ofPattern("dd MMMM"));
    }

    private LocalTime getTime(long millisecond) {
        LocalDateTime ldt = LocalDateTime.ofInstant(Instant.ofEpochMilli(millisecond), ZoneId.of("Europe/Moscow"));
        return ldt.toLocalTime();
    }

    private int getDurationInMinutes(long duration) {
        return (int)duration / 1000 / 60;
    }

    private boolean existStudent(String login) {
        if (!login.equals(""))
            return true;
        return false;
    }

    public static class InfoConsult {
        private String dateConsult;
        private long start;
        private LocalTime startUser;
        private long duration;
        private int durationUser;
        private LocalTime endUser;
        private boolean existStudent;

        public InfoConsult(String dateConsult, long start, LocalTime startUser, long duration,
                           int durationUser, LocalTime endUser, boolean existStudent) {
            this.dateConsult = dateConsult;
            this.start = start;
            this.startUser = startUser;
            this.duration = duration;
            this.durationUser = durationUser;
            this.endUser = endUser;
            this.existStudent = existStudent;
        }

        public String getDateConsult() {
            return dateConsult;
        }

        public long getStart() {
            return start;
        }

        public LocalTime getStartUser() {
            return startUser;
        }

        public long getDuration() {
            return duration;
        }

        public int getDurationUser() {
            return durationUser;
        }

        public LocalTime getEndUser() {
            return endUser;
        }

        public boolean isExistStudent() {
            return existStudent;
        }
    }
}
