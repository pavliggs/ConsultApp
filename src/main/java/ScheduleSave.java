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
import java.time.temporal.ChronoField;
import java.util.List;

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

        // настройка продолжительности консультации
        DataBase.Settings.Record durationConsultUser = DataBase.INSTANCE.settings.findKey("Продолжительность консультации");
        long durationConsult = minuteToMillisecond(durationConsultUser.getValue());

        // текущая дата и время
        ZonedDateTime zdtNow = ZonedDateTime.now(ZoneId.of("Europe/Moscow"));
        // локальное время начала расписания у ментора
        LocalTime lt = LocalTime.ofSecondOfDay(timeStart/1000);
        // дата и время, где дата - текущая, а время совпадает со временем начала расписания
        ZonedDateTime zdt = ZonedDateTime.of(zdtNow.getYear(), zdtNow.getMonthValue(), zdtNow.getDayOfMonth(),
                lt.getHour(), lt.getMinute(), 0, 0, ZoneId.of("Europe/Moscow"));
        int currentDayOfWeek = zdtNow.getDayOfWeek().getValue();

        int plus = 0;
        if (currentDayOfWeek > dayOfWeek) {
            plus = 7 - (currentDayOfWeek - dayOfWeek);
        } else if (currentDayOfWeek < dayOfWeek) {
            plus = dayOfWeek - currentDayOfWeek;
        }

        // дата и время начала ближайшей консультации для студентов в соответствии с созданным расписанием
        long startConsult = 0;

        /* если день создания расписания совпадает с днем проведения этого расписания и расписание создано
        * за 3 часа до времени проведения первой консультации или более 3 часов, то занятия состоятся в этот день
        * если же расписание создано меннее чем за 3 часа до его проведения, то ближайшие занятия будут проводиться
        * через неделю */
        if (plus == 0 && (zdt.toEpochSecond()*1000 - zdtNow.toEpochSecond()*1000) >= 10_800_000) {
            startConsult = zdt.toEpochSecond() * 1000;
        } else if (plus == 0 && (zdt.toEpochSecond()*1000 - zdtNow.toEpochSecond()*1000) < 10_800_000) {
            startConsult = zdt.plusDays(7).toEpochSecond() * 1000;
        } else {
            startConsult = zdt.plusDays(plus).toEpochSecond() * 1000;
        }

        // на основании созданного расписания создаем консультации для студентов
        while (durationSchedule > 0) {
            /* пример: если общее время расписания на день (durationSchedule) составляет 40 минут,
            * а время консультации составляет 15 минут, то в это расписание будет состоять из двух консультаций
            * по 15 минут и одной консультации по 10 минут */
            if (durationSchedule < durationConsult)
                DataBase.INSTANCE.consultations.put(new DataBase.Consultations.Consultation(login, startConsult, durationSchedule, "", ""));
            else
                DataBase.INSTANCE.consultations.put(new DataBase.Consultations.Consultation(login, startConsult, durationConsult, "", ""));
            startConsult = startConsult + durationConsult;
            durationSchedule = durationSchedule - durationConsult;
        }

        /*
        * заходим в это условие только со страницы редактирования расписания
        * предварительно удаляем запись у ментора, которая была до изменения
        *  */
        if ("true".equals(req.getParameter("edit"))) {
            long timeStartOld = getTimeStart(req.getParameter("start-old"));
            DataBase.INSTANCE.schedule.remove(new DataBase.Schedule.Key(login, dayOfWeek,
                    timeStartOld));
        }

        // добавляем измененную запись
        if (!DataBase.INSTANCE.schedule.put(value)) {
            req.setAttribute("error-description", login +
                    ", ваше расписание уже содержит данную консультацию");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            return;
        }

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
