import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/successful-registration")
public class SuccessRegistration extends HttpServlet {
//    private static final Logger LOGGER = Logger.getLogger(SuccessRegistration.class.getName());

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//        final String path = "C:\\Users\\Эльдорадо\\IdeaProjects\\ConsultNew\\src\\main\\resources";
//        final Part filePart = req.getPart("file");
//        final String fileName = getFileName(filePart);
//
//        OutputStream out = null;
//        InputStream fileContent = null;
//        final PrintWriter writer = resp.getWriter();
//
//        try {
//            out = new FileOutputStream(new File(path + File.separator + fileName));
//            fileContent = filePart.getInputStream();
//
//            int read = 0;
//            final byte[] bytes = new byte[1024];
//
//            while ((read = fileContent.read(bytes)) != -1) {
//                out.write(bytes, 0, read);
//            }
//            writer.println("New file " + fileName + " created at " + path);
//            LOGGER.log(Level.INFO, "File {0} being uploaded to {1}", new Object[]{fileName, path});
//        } catch (FileNotFoundException ex) {
//            writer.println("Error");
//            LOGGER.log(Level.SEVERE, "Problem during", new Object[]{ex.getMessage()});
//        } finally {
//            if (out != null)
//                out.close();
//            if (fileContent != null)
//                fileContent.close();
//            if (writer != null)
//                writer.close();
//        }

        boolean isMentor = (req.getParameter("isMentor") != null);
        DataBase.Users.User user = new DataBase.Users.User(req.getParameter("login"), req.getParameter("password"),
                false, req.getParameter("name"), isMentor, req.getParameter("email"),
                req.getParameter("linkAccoun"), "c:/image/file.jpeg");
        DataBase.INSTANCE.users.put(user);
        req.getRequestDispatcher("success-registration.jsp").forward(req, resp);
    }

//    private String getFileName(final Part part) {
//        final String partHeader = part.getHeader("content-disposition");
//        LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
//        for (String content : part.getHeader("content-disposition").split(";")) {
//            if (content.trim().startsWith("filename")) {
//                String result = content.substring(content.indexOf('=')+1).trim().replace("\\", "");
//                System.out.println(result);
//                return result;
//            }
//        }
//        return null;
//    }
}
