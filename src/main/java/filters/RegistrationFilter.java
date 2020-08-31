package filters;

import ru.progwards.java2.lib.DataBase;

import javax.servlet.*;
import java.io.IOException;

public class RegistrationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        String login = req.getParameter("login2");
        DataBase.Users.User user = DataBase.INSTANCE.users.findKey(login);

        if (user != null) {
            req.setAttribute("error-description", "Пользователь с таким логином уже существует! Вам необходимо " +
                    "ввести другой логин.");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            return;
        }

        String password = req.getParameter("password2");
        String repeatedPassword = req.getParameter("repeated-password");
        if (!password.equals(repeatedPassword)) {
            req.setAttribute("error-description", "Пароли не совпадают! Введите одинаковые пароли.");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            return;
        }

        filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
    }
}
