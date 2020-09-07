import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalTime;

@WebServlet("/schedule-save")
public class ScheduleSave extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        int dayOfWeek = Integer.parseInt(req.getParameter("day-of-week"));
        long timeStart = getTimeStart(req.getParameter("start"));

        if (!DataBase.INSTANCE.schedule.put(new DataBase.Schedule.Value(req.getParameter("login"), dayOfWeek,
                timeStart, toInt(req.getParameter("duration"))))) {
            req.setAttribute("error-description", session.getAttribute("login") +
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

    private long getTimeStart(String time) {
        String[] hourAndMinute = hourAndMinute(time);
        LocalTime lt = LocalTime.of(toInt(hourAndMinute[0]), toInt(hourAndMinute[1]));
        return lt.toSecondOfDay()*1000;
    }
}
