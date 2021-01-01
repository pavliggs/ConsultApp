<%@ page contentType="text/html;text/css;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="style">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/schedule.css" type="text/css">
    </jsp:attribute>
    <jsp:attribute name="title">
        <title>Расписание</title>
    </jsp:attribute>
    <jsp:body>
        <t:template-nav>
            <jsp:attribute name="description">
                <p class="h5">Расписание</p>
                <p>Здесь вы можете добавить расписание своих консультаций</p>
                <a href="${pageContext.request.contextPath}/schedule-add"><button class="btn btn-primary">Добавить расписание</button></a>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">День недели</th>
                            <th scope="col">Информация</th>
                            <th scope="col">Редактировать/Удалить</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="elem" items="${scheduleList}">
                            <tr>
                                <td>${elem.getDayOfWeekUser()}</td>
                                <td>
                                    <div>
                                        <p>${elem.getStartUser()} - ${elem.getEndUser()}</p>
                                        <p>Продолжительность: ${elem.getDurationUser()} мин.</p>
                                    </div>
                                </td>
                                <td>
                                    <div class="row justify-content-center">
                                        <div class="table-edit">
                                            <form method="post" action="schedule-edit">
                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>
                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>
                                                <input class="btn-edit" type="submit" value="">
                                            </form>
                                        </div>
                                        <div class="table-del">
                                            <form method="post" action="schedule-delete">
                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>
                                                <input class="btn-del" type="submit" value="">
                                            </form>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </jsp:attribute>
        </t:template-nav>
    </jsp:body>
</t:template>