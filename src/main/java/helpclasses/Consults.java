package helpclasses;

import ru.progwards.java2.lib.DataBase;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.List;
import java.util.stream.Collectors;

public class Consults {

    // удаление консультаций
    public static void delete(String login, int dayOfWeek) {
        // удаляем все консультации из списка consultation
        getListConsults(login, dayOfWeek).forEach(e -> {
            try {
                DataBase.INSTANCE.consultations.remove(new DataBase.Consultations.Key(e.getMentor(), e.getStart()));
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
        });
    }

    // добавление косультаций при добавлении расписания у ментора
    public static void addConsults(String login, long timeStart, long durationSchedule, int dayOfWeek) throws IOException {
        // настройка продолжительности консультации
        DataBase.Settings.Record durationConsultUser =
                DataBase.INSTANCE.settings.findKey("Продолжительность консультации");
        long durationConsultMilli = minuteToMillisecond(durationConsultUser.getValue());

        int plus = getPlusDays(timeStart, dayOfWeek);
        ZonedDateTime zdt = getZDTConsult(timeStart);
        ZonedDateTime zdtNow = getZDTNow();

        // дата и время начала ближайшей консультации для студентов в соответствии с созданным расписанием
        long startConsult = getStartConsult(zdt, zdtNow, plus);

        // на основании созданного расписания создаем консультации для студентов
        while (durationSchedule > 0) {
            /* пример: если общее время расписания на день (durationSchedule) составляет 40 минут,
             * а время консультации составляет 15 минут, то в это расписание будет состоять из двух консультаций
             * по 15 минут и одной консультации по 10 минут */
            if (durationSchedule < durationConsultMilli)
                DataBase.INSTANCE.consultations.put(new DataBase.Consultations.Consultation(login, startConsult, durationSchedule, "", ""));
            else
                DataBase.INSTANCE.consultations.put(new DataBase.Consultations.Consultation(login, startConsult, durationConsultMilli, "", ""));
            startConsult = startConsult + durationConsultMilli;
            durationSchedule = durationSchedule - durationConsultMilli;
        }
    }

    /* получить количество дней, которое нужно прибавить к текущей дате добавления расписания,
    * чтобы получился ближайший день консультаций
    * */
    private static int getPlusDays(long timeStart, int dayOfWeek) {
        int currentDayOfWeek = getZDTConsult(timeStart).getDayOfWeek().getValue();

        int plus = 0;
        if (currentDayOfWeek > dayOfWeek) {
            plus = 7 - (currentDayOfWeek - dayOfWeek);
        } else if (currentDayOfWeek < dayOfWeek) {
            plus = dayOfWeek - currentDayOfWeek;
        }

        return plus;
    }

    // получить текущую дату и время, равное времени начала расписания
    private static ZonedDateTime getZDTConsult(long timeStart) {
        // текущая дата и время
        ZonedDateTime zdtNow = getZDTNow();
        // локальное время начала расписания у ментора
        LocalTime lt = LocalTime.ofSecondOfDay(timeStart/1000);
        // дата и время, где дата - текущая, а время совпадает со временем начала расписания
        return ZonedDateTime.of(zdtNow.getYear(), zdtNow.getMonthValue(), zdtNow.getDayOfMonth(),
                lt.getHour(), lt.getMinute(), 0, 0, getZoneID());
    }

    /* если день создания расписания совпадает с днем проведения этого расписания и расписание создано
     * за 3 часа до времени проведения первой консультации или более 3 часов, то занятия состоятся в этот день
     * если же расписание создано меннее чем за 3 часа до его проведения, то ближайшие занятия будут проводиться
     * через неделю */
    private static long getStartConsult(ZonedDateTime zdt, ZonedDateTime zdtNow, int plus) {
        if (plus == 0 && (zdt.toEpochSecond()*1000 - zdtNow.toEpochSecond()*1000) >= 10_800_000)
            return zdt.toEpochSecond() * 1000;
        else if (plus == 0 && (zdt.toEpochSecond()*1000 - zdtNow.toEpochSecond()*1000) < 10_800_000)
            return zdt.plusDays(7).toEpochSecond() * 1000;
        else
            return zdt.plusDays(plus).toEpochSecond() * 1000;
    }

    private static ZonedDateTime getZDTNow() {
        return ZonedDateTime.now(getZoneID());
    }

    private static ZoneId getZoneID() {
        return ZoneId.of("Europe/Moscow");
    }

    // получаем список консультаций данного ментора в день недели dayOfWeek
    private static List<DataBase.Consultations.Consultation> getListConsults(String login, int dayOfWeek) {
        return DataBase.INSTANCE.consultations.getAll().stream().
                filter(e -> e.getMentor().equals(login)).
                filter(e -> getDayOfWeek(e.getStart()) == dayOfWeek).
                collect(Collectors.toList());
    }

    private static ZonedDateTime getZonedDT(long millisecond) {
        return ZonedDateTime.ofInstant(Instant.ofEpochMilli(millisecond), getZoneID());
    }

    // получить номер дня недели
    private static int getDayOfWeek(long millisecond) {
        return getZonedDT(millisecond).getDayOfWeek().getValue();
    }

    private static int toInt(String str) {
        return Integer.parseInt(str);
    }

    // метод переводит минуты в миллисекунды
    private static long minuteToMillisecond(String minute) {
        return toInt(minute) * 60 * 1000;
    }
}