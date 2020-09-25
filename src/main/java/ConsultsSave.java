import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/consults-save")
public class ConsultsSave extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // удаляем консультацию по ключу
        DataBase.INSTANCE.consultations.remove(new DataBase.Consultations.Key(req.getParameter("mentor"),
                Long.parseLong(req.getParameter("start"))));

        DataBase.Consultations.Consultation consultation =
                new DataBase.Consultations.Consultation(req.getParameter("mentor"),
                        Long.parseLong(req.getParameter("start")),
                        Long.parseLong(req.getParameter("duration")),
                        (String) session.getAttribute("login"),
                        req.getParameter("comment"));

        DataBase.INSTANCE.consultations.put(consultation);

        resp.sendRedirect("consults-view");
    }
}
