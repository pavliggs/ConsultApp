import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/schedule")
public class Schedule extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String login = (String) session.getAttribute("login");

        // список расписаний конкретного ментора отсортированный по дням недели
        List<DataBase.Schedule.Value> scheduleList =
                DataBase.INSTANCE.schedule.getAll().stream().filter(e -> e.getMentor().equals(login)).
                        sorted(Comparator.comparing(e -> e.getDayOfWeek())).
                        collect(Collectors.toList());

        req.setAttribute("scheduleList", getInfoScheduleList(scheduleList));

//        // списки консультаций для конкретного дня недели
//        List<DataBase.Schedule.Value> scheduleMonday = getDaySortedList(scheduleList, 1);
//        List<DataBase.Schedule.Value> scheduleTuesday = getDaySortedList(scheduleList, 2);
//        List<DataBase.Schedule.Value> scheduleWednesday = getDaySortedList(scheduleList, 3);
//        List<DataBase.Schedule.Value> scheduleThursday = getDaySortedList(scheduleList, 4);
//        List<DataBase.Schedule.Value> scheduleFriday = getDaySortedList(scheduleList, 5);
//        List<DataBase.Schedule.Value> scheduleSaturday = getDaySortedList(scheduleList, 6);
//        List<DataBase.Schedule.Value> scheduleSunday = getDaySortedList(scheduleList, 7);
//
//        ZonedDateTime zdt = ZonedDateTime.now(ZoneId.of("Europe/Moscow"));
//        int currentDayOfWeek = zdt.getDayOfWeek().getValue();
//
//        String currentDate = zdt.format(DateTimeFormatter.ofPattern("dd MMMM"));
//        String plusOneDayDate = zdt.plusDays(1).format(DateTimeFormatter.ofPattern("dd MMMM"));
//        String plusTwoDaysDate = zdt.plusDays(2).format(DateTimeFormatter.ofPattern("dd MMMM"));
//        String plusThreeDaysDate = zdt.plusDays(3).format(DateTimeFormatter.ofPattern("dd MMMM"));
//        String plusFourDaysDate = zdt.plusDays(4).format(DateTimeFormatter.ofPattern("dd MMMM"));
//        String plusFiveDaysDate = zdt.plusDays(5).format(DateTimeFormatter.ofPattern("dd MMMM"));
//        String plusSixDaysDate = zdt.plusDays(6).format(DateTimeFormatter.ofPattern("dd MMMM"));
//
//        // передаём номер текущего дня недели, текущую дату и даты дней на неделю вперёд
//        req.setAttribute("currentDayOfWeek", currentDayOfWeek);
//        req.setAttribute("currentDate", currentDate);
//        req.setAttribute("plusOneDayDate", plusOneDayDate);
//        req.setAttribute("plusTwoDaysDate", plusTwoDaysDate);
//        req.setAttribute("plusThreeDaysDate", plusThreeDaysDate);
//        req.setAttribute("plusFourDaysDate", plusFourDaysDate);
//        req.setAttribute("plusFiveDaysDate", plusFiveDaysDate);
//        req.setAttribute("plusSixDaysDate", plusSixDaysDate);
//
//        // передаем через запрос списки по дням недели
//        req.setAttribute("scheduleMonday", getInfoScheduleList(scheduleMonday));
//        req.setAttribute("scheduleTuesday", getInfoScheduleList(scheduleTuesday));
//        req.setAttribute("scheduleWednesday", getInfoScheduleList(scheduleWednesday));
//        req.setAttribute("scheduleThursday", getInfoScheduleList(scheduleThursday));
//        req.setAttribute("scheduleFriday", getInfoScheduleList(scheduleFriday));
//        req.setAttribute("scheduleSaturday", getInfoScheduleList(scheduleSaturday));
//        req.setAttribute("scheduleSunday", getInfoScheduleList(scheduleSunday));

        req.getRequestDispatcher("schedule.jsp").forward(req, resp);
    }

    // метод помогает получить список консультаций конкретного дня отсортированный по времени начала
//    private List<DataBase.Schedule.Value> getDaySortedList(List<DataBase.Schedule.Value> scheduleList,
//                                                           int dayOfWeek) {
//        return scheduleList.stream().filter(e -> e.getDayOfWeek() == dayOfWeek).
//                sorted(Comparator.comparing(e -> e.getStart())).
//                collect(Collectors.toList());
//    }

    // получить список объектов InfoSchedule, который выводит информацию о расписании, понятную пользователю
    private List<InfoSchedule> getInfoScheduleList(List<DataBase.Schedule.Value> list) {
        List<InfoSchedule> infoScheduleList = new ArrayList<>();

        // создаем список из объектов InfoSchedule
        list.forEach(e -> infoScheduleList.add(new InfoSchedule(e.getDayOfWeek(), dayOfWeek(e.getDayOfWeek()),
                    e.getStart(), getTime(e.getStart()), getTime(e.getStart() + e.getDuration()),
                    e.getDuration(), getDurationInMinutes(e.getDuration()))));

        return infoScheduleList;
    }

    private String dayOfWeek(int dayOfWeek) {
        switch (dayOfWeek) {
            case 1: return "Понедельник";
            case 2: return "Вторник";
            case 3: return "Среда";
            case 4: return "Четверг";
            case 5: return "Пятница";
            case 6: return "Суббота";
            case 7: return "Воскресенье";
        }
        return null;
    }

    private LocalTime getTime(long millisecond) {
        return LocalTime.ofSecondOfDay(millisecond / 1000);
    }

    private int getDurationInMinutes(long duration) {
        return (int)duration / 1000 / 60;
    }

    /*
    * внутренний класс, который помогает информацию из базы данных представлять в понятном для пользователя виде
    * например: duration 900 000, а для пользователя будет durationUser 15 (т.е. 15 минут)
    *  */
    public static class InfoSchedule {
        private int dayOfWeek;
        private String dayOfWeekUser;
        private long start;
        private LocalTime startUser;
        private LocalTime endUser;
        private long duration;
        private int durationUser;

        public InfoSchedule(int dayOfWeek, String dayOfWeekUser, long start, LocalTime startUser, LocalTime endUser,
                            long duration, int durationUser) {
            this.dayOfWeek = dayOfWeek;
            this.dayOfWeekUser = dayOfWeekUser;
            this.start = start;
            this.startUser = startUser;
            this.endUser = endUser;
            this.duration = duration;
            this.durationUser = durationUser;
        }

        public int getDayOfWeek() {
            return dayOfWeek;
        }

        public String getDayOfWeekUser() {
            return dayOfWeekUser;
        }

        public long getStart() {
            return start;
        }

        public LocalTime getStartUser() {
            return startUser;
        }

        public LocalTime getEndUser() {
            return endUser;
        }

        public long getDuration() {
            return duration;
        }

        public int getDurationUser() {
            return durationUser;
        }
    }
}