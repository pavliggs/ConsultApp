import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user-auth")
public class UserAuth extends HttpServlet {
    @Override
    public void init() throws ServletException {
        System.out.println("init()");
        super.init();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String login = req.getParameter("login1");
        DataBase.Users.User user = DataBase.INSTANCE.users.findKey(login);

        // в таблице настроек всегда должна находится следующая настройка
        // если нет такой настройки, то добавляем её
        DataBase.Settings.Record duration = DataBase.INSTANCE.settings.findKey("Продолжительность консультации");
        if (duration == null)
            DataBase.INSTANCE.settings.
                    put(new DataBase.Settings.Record("Продолжительность консультации", "15"));

        if (user == null) {
            req.setAttribute("error-description", "Пользователя с логином " + login + " не существует! " +
                    "Вам необходимо пройти регистрацию.");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            return;
        }

        String password = req.getParameter("password1");
        if (!user.getPassword().equals(password)) {
            req.setAttribute("error-description", "Неправильный пароль! Попробуйте ввести пароль заново.");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            return;
        }

        session.setAttribute("login", login);
        session.setAttribute("user", user);
        // сессия работает пока не удалена
        session.setMaxInactiveInterval(-1);
        resp.sendRedirect("/home");
    }
}
