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
                <a href="${pageContext.request.contextPath}/schedule-add"><button class="btn btn-primary">Добавить консультацию</button></a>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">День недели</th>
                        <th scope="col">Консультации</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:if test="${!scheduleMonday.isEmpty()}">
                            <tr>
                                <td>Понедельник</td>
                                <td>
                                    <c:forEach var="elem" items="${scheduleMonday}">
                                        <div class="schedule">
                                            <p>${elem.getStartUser()}</p>
                                            <span>${elem.getDurationUser()} мин.</span>
                                            <form method="post" action="schedule-edit">
                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>
                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>
                                                <input class="btn-edit" type="submit" value="">
                                            </form>
                                            <form method="post" action="schedule-delete">
                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>
                                                <input class="btn-del" type="submit" value="">
                                            </form>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!scheduleTuesday.isEmpty()}">
                            <tr>
                                <td>Вторник</td>
                                <td>
                                    <c:forEach var="elem" items="${scheduleTuesday}">
                                        <div class="schedule">
                                            <p>${elem.getStartUser()}</p>
                                            <span>${elem.getDurationUser()} мин.</span>
                                            <form method="post" action="schedule-edit">
                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>
                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>
                                                <input class="btn-edit" type="submit" value="">
                                            </form>
                                            <form method="post" action="schedule-delete">
                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>
                                                <input class="btn-del" type="submit" value="">
                                            </form>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!scheduleWednesday.isEmpty()}">
                            <tr>
                                <td>Среда</td>
                                <td>
                                    <c:forEach var="elem" items="${scheduleWednesday}">
                                        <div class="schedule">
                                            <p>${elem.getStartUser()}</p>
                                            <span>${elem.getDurationUser()} мин.</span>
                                            <form method="post" action="schedule-edit">
                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>
                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>
                                                <input class="btn-edit" type="submit" value="">
                                            </form>
                                            <form method="post" action="schedule-delete">
                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>
                                                <input class="btn-del" type="submit" value="">
                                            </form>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!scheduleThursday.isEmpty()}">
                            <tr>
                                <td>Четверг</td>
                                <td>
                                    <c:forEach var="elem" items="${scheduleThursday}">
                                        <div class="schedule">
                                            <p>${elem.getStartUser()}</p>
                                            <span>${elem.getDurationUser()} мин.</span>
                                            <form method="post" action="schedule-edit">
                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>
                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>
                                                <input class="btn-edit" type="submit" value="">
                                            </form>
                                            <form method="post" action="schedule-delete">
                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>
                                                <input class="btn-del" type="submit" value="">
                                            </form>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!scheduleFriday.isEmpty()}">
                            <tr>
                                <td>Пятница</td>
                                <td>
                                    <c:forEach var="elem" items="${scheduleFriday}">
                                        <div class="schedule">
                                            <p>${elem.getStartUser()}</p>
                                            <span>${elem.getDurationUser()} мин.</span>
                                            <form method="post" action="schedule-edit">
                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>
                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>
                                                <input class="btn-edit" type="submit" value="">
                                            </form>
                                            <form method="post" action="schedule-delete">
                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>
                                                <input class="btn-del" type="submit" value="">
                                            </form>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!scheduleSaturday.isEmpty()}">
                            <tr>
                                <td>Суббота</td>
                                <td>
                                    <c:forEach var="elem" items="${scheduleSaturday}">
                                        <div class="schedule">
                                            <p>${elem.getStartUser()}</p>
                                            <span>${elem.getDurationUser()} мин.</span>
                                            <form method="post" action="schedule-edit">
                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>
                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>
                                                <input class="btn-edit" type="submit" value="">
                                            </form>
                                            <form method="post" action="schedule-delete">
                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>
                                                <input class="btn-del" type="submit" value="">
                                            </form>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!scheduleSunday.isEmpty()}">
                            <tr>
                                <td>Воскресенье</td>
                                <td>
                                    <c:forEach var="elem" items="${scheduleSunday}">
                                        <div class="schedule">
                                            <p>${elem.getStartUser()}</p>
                                            <span>${elem.getDurationUser()} мин.</span>
                                            <form method="post" action="schedule-edit">
                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>
                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>
                                                <input class="btn-edit" type="submit" value="">
                                            </form>
                                            <form method="post" action="schedule-delete">
                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>
                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>
                                                <input class="btn-del" type="submit" value="">
                                            </form>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </jsp:attribute>
        </t:template-nav>
    </jsp:body>
</t:template>