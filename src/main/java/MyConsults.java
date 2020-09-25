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

@WebServlet("/my-consults")
public class MyConsults extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // список консультаций текущего студента
        List<DataBase.Consultations.Consultation> consultations =
                DataBase.INSTANCE.consultations.getAll().stream().
                        filter(e -> e.getStudent().equals(session.getAttribute("login"))).
                        sorted(Comparator.comparing(e -> e.getStart())).collect(Collectors.toList());

        req.setAttribute("infoConsults", getListInfoConsult(consultations));

        req.getRequestDispatcher("my-consults.jsp").forward(req, resp);
    }

    private List<ConsultsView.InfoConsult> getListInfoConsult(List<DataBase.Consultations.Consultation> list) {
        List<ConsultsView.InfoConsult> consultList = new ArrayList<>();
        list.forEach(e -> consultList.add(new ConsultsView.InfoConsult(e.getMentor(), getNameMentor(e.getMentor()), getDate(e.getStart()),
                e.getStart(), getTime(e.getStart()), e.getDuration(), getDurationInMinutes(e.getDuration()),
                getTime(e.getStart() + e.getDuration()), true)));
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

    private String getNameMentor(String login) {
        DataBase.Users.User user = DataBase.INSTANCE.users.findKey(login);
        return user.getName();
    }

    private int getDurationInMinutes(long duration) {
        return (int)duration / 1000 / 60;
    }
}
