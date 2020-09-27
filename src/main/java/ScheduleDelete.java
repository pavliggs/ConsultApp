import helpclasses.Consults;
import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet("/schedule-delete")
public class ScheduleDelete extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> names = Collections.list(req.getParameterNames());

        HttpSession session = req.getSession();
        String login = (String) session.getAttribute("login");
        int dayOfWeek = Integer.parseInt(names.get(0));

        if (names.size() != 2) {
            req.setAttribute("error-description", "Неправильное число параметров!");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            return;
        }

        if (DataBase.INSTANCE.schedule.remove(new DataBase.Schedule.Key(login, dayOfWeek,
                Long.parseLong(names.get(1)))) == null) {
            req.setAttribute("error-description", "Не удалось удалить элемент! Верояно, " +
                    "он уже не существует.");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            DataBase.INSTANCE.settings.readAll();
            return;
        }

        // удаляем консультации для данного расписания
        Consults.delete(login, dayOfWeek);

        resp.sendRedirect("schedule");
    }
}