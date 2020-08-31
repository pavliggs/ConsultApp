package filters;

import ru.progwards.java2.lib.DataBase;

import javax.servlet.*;
import java.io.IOException;

public class LoginPasswordFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        String login = req.getParameter("login1");
        DataBase.Users.User user = DataBase.INSTANCE.users.findKey(login);

        if (user == null) {
            req.setAttribute("error-description", "Пользователя с таким логином не существует! Вам необходимо " +
                    "пройти регистрацию.");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            return;
        }

        String password = req.getParameter("password1");
        if (!user.getPassword().equals(password)) {
            req.setAttribute("error-description", "Неправильный пароль! Попробуйте ввести пароль заново.");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            return;
        }

        filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
    }
}
