import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@WebServlet("/settings")
public class Settings extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<DataBase.Settings.Record> settings =
                new ArrayList<>(DataBase.INSTANCE.settings.getAll());
        settings.sort(Comparator.comparing(e -> e.getName()));

        req.setAttribute("settings", settings);
        req.getRequestDispatcher("settings-view.jsp").forward(req, resp);
    }
}
