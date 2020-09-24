import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/consults")
public class Consults extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // список всех наставников
        List<DataBase.Users.User> mentorList = DataBase.INSTANCE.users.getAll().stream().filter(e -> e.isMentor()).
                sorted(Comparator.comparing(e -> e.getName())).collect(Collectors.toList());

        if (mentorList.isEmpty()) {
            req.setAttribute("error-description", "К сожалению пока что ни один ментор не зарегистрирован!");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            return;
        }

        req.setAttribute("mentors", mentorList);

        req.getRequestDispatcher("consults.jsp").forward(req, resp);
    }
}
