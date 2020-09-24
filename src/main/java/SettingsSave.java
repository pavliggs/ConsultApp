import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/settings-save")
public class SettingsSave extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String value = req.getParameter("value");

        try {
            if (name.equals("Продолжительность консультации") &&
                    (Integer.parseInt(value) < 5 || Integer.parseInt(value) > 60)) {
                req.setAttribute("error-description", "Продолжительность консультации" +
                        " не может быть меньше 5 минут и больше 60 минут");
                req.getRequestDispatcher("error.jsp").forward(req, resp);
                return;
            }
        } catch (NumberFormatException ex) {
            req.setAttribute("error-description", "Значение настройки должно быть в числовом " +
                    "формате в интервале от 5 до 60");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            return;
        }

        if ("true".equals(req.getParameter("edit")))
            DataBase.INSTANCE.settings.remove(name);

        if (!DataBase.INSTANCE.settings.put(new DataBase.Settings.Record(name, value))) {
            req.setAttribute("error-description", "Не удалось добавить настройку! Вероятно, " +
                    "она уже существует.");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            return;
        }

        resp.sendRedirect("settings-view");
    }
}
