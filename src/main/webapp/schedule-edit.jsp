<%@ page contentType="text/html;text/css;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="title">
        <title>Редактирование консультации</title>
    </jsp:attribute>
    <jsp:body>
        <t:template-nav>
            <jsp:attribute name="description">
                <p class="h5">Консультация: редактирование</p>
                <div class="text-left">
                    <form method="post" action="schedule-save">
                        <div class="form-group">
                            <input type="number" id="day-of-week" name="day-of-week" value="${pageContext.request.getParameter("day-of-week")}" hidden>
                        </div>
                        <div class="form-group">
                            <label for="start">Время начала</label>
                            <input type="time" name="start-old" value="${pageContext.request.getParameter("start")}" hidden>
                            <input type="time" id="start" name="start" value="${pageContext.request.getParameter("start")}" required>
                        </div>
                        <div class="form-group">
                            <label for="duration">Продолжительность</label>
                            <input type="number" id="duration" name="duration" value="${pageContext.request.getParameter("duration")}" required>
                        </div>

                            <%-- Элемент для определения редактирования из ScheduleSave --%>
                        <input type="text" name="edit" value="true" hidden>

                        <input type="submit" class="btn btn-primary" value="Сохранить">
                    </form>
                </div>
            </jsp:attribute>
        </t:template-nav>
    </jsp:body>
</t:template>
