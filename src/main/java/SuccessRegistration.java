import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

@MultipartConfig
@WebServlet("/successful-registration")
public class SuccessRegistration extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part part = req.getPart("file");
        String fileName = "no_avatar.jpg";
        // размер загружаемого файла в байтах
        int sizeInBytes = part.getInputStream().available();
        // если файл загружен (т.е. размер файла не равен 0)
        if (sizeInBytes != 0) {
            // если файл не является изображением, то выводим ошибку
            if (!isFileImage(part.getContentType())) {
                req.setAttribute("error-description", "Вам необходимо загрузить файл с расширением .jpg, .jpeg," +
                        " .png или .gif");
                req.getRequestDispatcher("error.jsp").forward(req, resp);
                return;
            }
            fileName = processRequest(req, resp, part);
        }

        boolean isMentor = (req.getParameter("is-mentor") != null);
        DataBase.Users.User user = new DataBase.Users.User(req.getParameter("login"), req.getParameter("password"),
                false, req.getParameter("name"), isMentor, req.getParameter("email"),
                req.getParameter("progwards-account"), req.getParameter("discord-name"), fileName);
        DataBase.INSTANCE.users.put(user);
        req.getRequestDispatcher("success-registration.jsp").forward(req, resp);
    }

    // метод имя файла
    protected String processRequest(HttpServletRequest req, HttpServletResponse resp, Part part) throws ServletException, IOException {
        final String FILE_DIRECTORY = "resources";
        // получаем имя файла
        String fileName = req.getParameter("login") + "." + fileExtension(part.getContentType());
        // создаем путь файла
        String pathFile = getServletContext().getRealPath(File.separator + FILE_DIRECTORY + File.separator + fileName);
        uploadFile(part, pathFile);
        return fileName;
    }

    // загружаем картинку в папку проекта
    private void uploadFile(Part part, String path) {
        try(InputStream is = part.getInputStream(); OutputStream out = new FileOutputStream(new File(path))) {
            int read = 0;
            final byte[] bytes = new byte[is.available()];
            while ((read = is.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            out.flush();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    // метод возвращает true, если файл является изображением
    private boolean isFileImage(String contextType) {
        contextType = contextType.split("/")[0];
        return contextType.equals("image");
    }

    // получаем расширение файла
    private String fileExtension(String contextType) {
        return contextType.split("/")[1];
    }
}