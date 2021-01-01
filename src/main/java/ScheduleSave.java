import helpclasses.Consults;
import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.Instant;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;

@WebServlet("/schedule-save")
public class ScheduleSave extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String login = (String) session.getAttribute("login");

        int dayOfWeek = toInt(req.getParameter("day-of-week"));
        long timeStart = getTimeStart(req.getParameter("start"));
        long durationSchedule = minuteToMillisecond(req.getParameter("duration"));

        // на основании переданных параметров создаем расписание у ментора
        DataBase.Schedule.Value value = new DataBase.Schedule.Value(login, dayOfWeek,
                timeStart, durationSchedule);

        /*
        * заходим в это условие только со страницы редактирования расписания:
        * 1. предварительно удаляем расписание у ментора, которая было до изменения
        * 2. удаляем все консультации, созданные на основании этого расписания
        *  */
        if ("true".equals(req.getParameter("edit"))) {
            long timeStartOld = getTimeStart(req.getParameter("start-old"));
            DataBase.INSTANCE.schedule.remove(new DataBase.Schedule.Key(login, dayOfWeek,
                    timeStartOld));
            // удаление консультаций
            Consults.delete(login, dayOfWeek);
        }

        // добавляем измененную запись
        if (!DataBase.INSTANCE.schedule.put(value)) {
            req.setAttribute("error-description", login +
                    ", ваше расписание уже содержит данную консультацию");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            return;
        }

        // добавляем консультации на основании расписания
        Consults.addConsults(login, timeStart, durationSchedule, dayOfWeek);

        resp.sendRedirect("schedule");
    }

    private String[] hourAndMinute(String time) {
        return time.split(":");
    }

    private int toInt(String str) {
        return Integer.parseInt(str);
    }

    // метод переводит строку типа: "12:05" (это время старта консультации в часах и минутах) в милисекунды
    private long getTimeStart(String time) {
        String[] hourAndMinute = hourAndMinute(time);
        LocalTime lt = LocalTime.of(toInt(hourAndMinute[0]), toInt(hourAndMinute[1]));
        return lt.toSecondOfDay()*1000;
    }

    // метод переводит минуты в миллисекунды
    private long minuteToMillisecond(String minute) {
        return toInt(minute) * 60 * 1000;
    }
}
