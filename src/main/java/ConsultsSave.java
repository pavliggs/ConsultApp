import ru.progwards.java2.lib.DataBase;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.Properties;

@WebServlet("/consults-save")
public class ConsultsSave extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String login = (String) session.getAttribute("login");
        String loginMentor = req.getParameter("mentor");
        long start = Long.parseLong(req.getParameter("start"));
        long duration = Long.parseLong(req.getParameter("duration"));

        // удаляем консультацию по ключу
        DataBase.INSTANCE.consultations.remove(new DataBase.Consultations.Key(req.getParameter("mentor"),
                Long.parseLong(req.getParameter("start"))));

        DataBase.Consultations.Consultation consultation =
                new DataBase.Consultations.Consultation(loginMentor, start,
                        duration, login, req.getParameter("comment"));

        DataBase.INSTANCE.consultations.put(consultation);

        DataBase.Users.User user = DataBase.INSTANCE.users.findKey(login);
        DataBase.Users.User mentor = DataBase.INSTANCE.users.findKey(loginMentor);

        toEmail(user.getEmail(), mentor.getName(), getDate(start), getTime(start), getDurationInMinutes(duration));

        resp.sendRedirect("consults-view");
    }


    // метод отправляет письмо о консультации на почту пользователя
    private void toEmail(String mailTo, String mentorName, String date, LocalTime timeStart, int duration) {
        final Properties properties = new Properties();

        try {
            properties.put("mail.transport.protocol", "smtps");
            properties.put("mail.smtps.auth", true);
            properties.put("mail.smtps.host", "smtp.gmail.com");
            properties.put("mail.smtps.user", "pavel.khovaylo@gmail.com");

            Session mailSession = Session.getDefaultInstance(properties);
            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress("pavel.khovaylo@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(mailTo));
            message.setSubject("Информация о консультации");
            message.setText("Уведомляем Вас о записи на консультацию: наставник - " + mentorName + ", дата - " + date +
                    ", время - " + timeStart + ", продолжительность - " + duration + " мин.");

            Transport tr = mailSession.getTransport();
            tr.connect("pavel.khovaylo@gmail.com", "trge8i2kpe");
            tr.sendMessage(message, message.getAllRecipients());
            tr.close();
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
    }

    private ZonedDateTime getZonedDT(long millisecond) {
        return ZonedDateTime.ofInstant(Instant.ofEpochMilli(millisecond), ZoneId.of("Europe/Moscow"));
    }

    private String getDate(long millisecond) {
        return getZonedDT(millisecond).format(DateTimeFormatter.ofPattern("dd MMMM"));
    }

    private LocalTime getTime(long millisecond) {
        LocalDateTime ldt = LocalDateTime.ofInstant(Instant.ofEpochMilli(millisecond), ZoneId.of("Europe/Moscow"));
        return ldt.toLocalTime();
    }

    private int getDurationInMinutes(long duration) {
        return (int)duration / 1000 / 60;
    }
}
