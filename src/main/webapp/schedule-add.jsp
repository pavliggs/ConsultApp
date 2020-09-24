<%@ page contentType="text/html;text/css;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="title">
        <title>Добавление консультации</title>
    </jsp:attribute>
    <jsp:body>
        <t:template-nav>
            <jsp:attribute name="description">
                <form method="post" action="schedule-save">
                    <div class="form-group">
                        <label for="day-of-week">День недели</label>
                        <div>
                            <select name="day-of-week" id="day-of-week">
                                <option value="1">Понедельник</option>
                                <option value="2">Вторник</option>
                                <option value="3">Среда</option>
                                <option value="4">Четверг</option>
                                <option value="5">Пятница</option>
                                <option value="6">Суббота</option>
                                <option value="7">Воскресенье</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="start">Время начала</label>
                        <input class="form-control" type="time" id="start" name="start" required>
                    </div>
                    <div class="form-group">
                        <label for="duration">Продолжительность, мин</label>
                        <input type="text" class="form-control" id="duration" name="duration" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Создать расписание</button>
                </form>
            </jsp:attribute>
        </t:template-nav>
    </jsp:body>
</t:template>