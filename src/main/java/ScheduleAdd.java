import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/schedule-add")
public class ScheduleAdd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DataBase.Settings.Record duration = DataBase.INSTANCE.settings.findKey("Продолжительность консультации");
        req.setAttribute("duration", duration.getValue());
        req.getRequestDispatcher("schedule-add.jsp").forward(req, resp);
    }
}
