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
                <table class="table table-striped">
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
<%--                <table class="table table-striped">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th scope="col">День недели</th>--%>
<%--                        <th scope="col">Консультации</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                        <c:if test="${!scheduleMonday.isEmpty()}">--%>
<%--                            <c:if test="${1 >= currentDayOfWeek}">--%>
<%--                                <c:set var="value1" scope="page" value="${1 - currentDayOfWeek}"/>--%>
<%--                                <tr>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${value1 == 0}">--%>
<%--                                            <td>Понедельник, ${currentDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                    <td>--%>
<%--                                    <c:forEach var="elem" items="${scheduleMonday}">--%>
<%--                                        <div class="schedule">--%>
<%--                                                &lt;%&ndash;выводим параметры понятные для пользователя&ndash;%&gt;--%>
<%--                                            <p>${elem.getStartUser()}</p>--%>
<%--                                            <span>${elem.getDurationUser()} мин.</span>--%>
<%--                                                &lt;%&ndash;блок редактирования консультации&ndash;%&gt;--%>
<%--                                            <form method="post" action="schedule-edit">--%>
<%--                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                                &lt;%&ndash;блок удаления консультации&ndash;%&gt;--%>
<%--                                            <form method="post" action="schedule-delete">--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>--%>
<%--                                                <input class="btn-del" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${!scheduleTuesday.isEmpty()}">--%>
<%--                            <c:if test="${2 >= currentDayOfWeek}">--%>
<%--                                <c:set var="value2" scope="page" value="${2 - currentDayOfWeek}"/>--%>
<%--                                <tr>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${value2 == 0}">--%>
<%--                                            <td>Вторник, ${currentDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value2 == 1}">--%>
<%--                                            <td>Вторник, ${plusOneDayDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                    <td>--%>
<%--                                    <c:forEach var="elem" items="${scheduleTuesday}">--%>
<%--                                        <div class="schedule">--%>
<%--                                            <p>${elem.getStartUser()}</p>--%>
<%--                                            <span>${elem.getDurationUser()} мин.</span>--%>
<%--                                            <form method="post" action="schedule-edit">--%>
<%--                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                            <form method="post" action="schedule-delete">--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>--%>
<%--                                                <input class="btn-del" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${!scheduleWednesday.isEmpty()}">--%>
<%--                            <c:if test="${3 >= currentDayOfWeek}">--%>
<%--                                <c:set var="value3" scope="page" value="${3 - currentDayOfWeek}"/>--%>
<%--                                <tr>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${value3 == 0}">--%>
<%--                                            <td>Среда, ${currentDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value3 == 1}">--%>
<%--                                            <td>Среда, ${plusOneDayDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value3 == 2}">--%>
<%--                                            <td>Среда, ${plusTwoDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                    <td>--%>
<%--                                    <c:forEach var="elem" items="${scheduleWednesday}">--%>
<%--                                        <div class="schedule">--%>
<%--                                            <p>${elem.getStartUser()}</p>--%>
<%--                                            <span>${elem.getDurationUser()} мин.</span>--%>
<%--                                            <form method="post" action="schedule-edit">--%>
<%--                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                            <form method="post" action="schedule-delete">--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>--%>
<%--                                                <input class="btn-del" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${!scheduleThursday.isEmpty()}">--%>
<%--                            <c:if test="${4 >= currentDayOfWeek}">--%>
<%--                                <c:set var="value4" scope="page" value="${4 - currentDayOfWeek}"/>--%>
<%--                                <tr>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${value4 == 0}">--%>
<%--                                            <td>Четверг, ${currentDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value4 == 1}">--%>
<%--                                            <td>Четверг, ${plusOneDayDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value4 == 2}">--%>
<%--                                            <td>Четверг, ${plusTwoDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value4 == 3}">--%>
<%--                                            <td>Четверг, ${plusThreeDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                    <td>--%>
<%--                                    <c:forEach var="elem" items="${scheduleThursday}">--%>
<%--                                        <div class="schedule">--%>
<%--                                            <p>${elem.getStartUser()}</p>--%>
<%--                                            <span>${elem.getDurationUser()} мин.</span>--%>
<%--                                            <form method="post" action="schedule-edit">--%>
<%--                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                            <form method="post" action="schedule-delete">--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>--%>
<%--                                                <input class="btn-del" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${!scheduleFriday.isEmpty()}">--%>
<%--                            <c:if test="${5 >= currentDayOfWeek}">--%>
<%--                                <c:set var="value5" scope="page" value="${5 - currentDayOfWeek}"/>--%>
<%--                                <tr>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${value5 == 0}">--%>
<%--                                            <td>Пятница, ${currentDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value5 == 1}">--%>
<%--                                            <td>Пятница, ${plusOneDayDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value5 == 2}">--%>
<%--                                            <td>Пятница, ${plusTwoDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value5 == 3}">--%>
<%--                                            <td>Пятница, ${plusThreeDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value5 == 4}">--%>
<%--                                            <td>Пятница, ${plusFourDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                    <td>--%>
<%--                                    <c:forEach var="elem" items="${scheduleFriday}">--%>
<%--                                        <div class="schedule">--%>
<%--                                            <p>${elem.getStartUser()}</p>--%>
<%--                                            <span>${elem.getDurationUser()} мин.</span>--%>
<%--                                            <form method="post" action="schedule-edit">--%>
<%--                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                            <form method="post" action="schedule-delete">--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>--%>
<%--                                                <input class="btn-del" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${!scheduleSaturday.isEmpty()}">--%>
<%--                            <c:if test="${6 >= currentDayOfWeek}">--%>
<%--                                <c:set var="value6" scope="page" value="${6 - currentDayOfWeek}"/>--%>
<%--                                <tr>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${value6 == 0}">--%>
<%--                                            <td>Суббота, ${currentDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value6 == 1}">--%>
<%--                                            <td>Суббота, ${plusOneDayDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value6 == 2}">--%>
<%--                                            <td>Суббота, ${plusTwoDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value6 == 3}">--%>
<%--                                            <td>Суббота, ${plusThreeDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value6 == 4}">--%>
<%--                                            <td>Суббота, ${plusFourDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value6 == 5}">--%>
<%--                                            <td>Суббота, ${plusFiveDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                    <td>--%>
<%--                                    <c:forEach var="elem" items="${scheduleSaturday}">--%>
<%--                                        <div class="schedule">--%>
<%--                                            <p>${elem.getStartUser()}</p>--%>
<%--                                            <span>${elem.getDurationUser()} мин.</span>--%>
<%--                                            <form method="post" action="schedule-edit">--%>
<%--                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                            <form method="post" action="schedule-delete">--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>--%>
<%--                                                <input class="btn-del" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${!scheduleSunday.isEmpty()}">--%>
<%--                            <c:if test="${7 >= currentDayOfWeek}">--%>
<%--                                <c:set var="value7" scope="page" value="${7 - currentDayOfWeek}"/>--%>
<%--                                <tr>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${value7 == 0}">--%>
<%--                                            <td>Воскресенье, ${currentDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value7 == 1}">--%>
<%--                                            <td>Воскресенье, ${plusOneDayDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value7 == 2}">--%>
<%--                                            <td>Воскресенье, ${plusTwoDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value7 == 3}">--%>
<%--                                            <td>Воскресенье, ${plusThreeDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value7 == 4}">--%>
<%--                                            <td>Воскресенье, ${plusFourDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value7 == 5}">--%>
<%--                                            <td>Воскресенье, ${plusFiveDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value7 == 6}">--%>
<%--                                            <td>Воскресенье, ${plusSixDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                    <td>--%>
<%--                                    <c:forEach var="elem" items="${scheduleSunday}">--%>
<%--                                        <div class="schedule">--%>
<%--                                            <p>${elem.getStartUser()}</p>--%>
<%--                                            <span>${elem.getDurationUser()} мин.</span>--%>
<%--                                            <form method="post" action="schedule-edit">--%>
<%--                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                            <form method="post" action="schedule-delete">--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>--%>
<%--                                                <input class="btn-del" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>

<%--&lt;%&ndash;                        дни из следующей недели будут показываться только если такие же дни на текущей неделе уже прошли&ndash;%&gt;--%>
<%--                        <c:if test="${!scheduleMonday.isEmpty()}">--%>
<%--                            <c:if test="${!(1 >= currentDayOfWeek)}">--%>
<%--                                <c:set var="value8" scope="page" value="${8 - currentDayOfWeek}"/>--%>
<%--                                <tr>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${value8 == 1}">--%>
<%--                                            <td>Понедельник, ${plusOneDayDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value8 == 2}">--%>
<%--                                            <td>Понедельник, ${plusTwoDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value8 == 3}">--%>
<%--                                            <td>Понедельник, ${plusThreeDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value8 == 4}">--%>
<%--                                            <td>Понедельник, ${plusFourDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value8 == 5}">--%>
<%--                                            <td>Понедельник, ${plusFiveDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value8 == 6}">--%>
<%--                                            <td>Понедельник, ${plusSixDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                    <td>--%>
<%--                                    <c:forEach var="elem" items="${scheduleMonday}">--%>
<%--                                        <div class="schedule">--%>
<%--                                                &lt;%&ndash;выводим параметры понятные для пользователя&ndash;%&gt;--%>
<%--                                            <p>${elem.getStartUser()}</p>--%>
<%--                                            <span>${elem.getDurationUser()} мин.</span>--%>
<%--                                                &lt;%&ndash;блок редактирования консультации&ndash;%&gt;--%>
<%--                                            <form method="post" action="schedule-edit">--%>
<%--                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                                &lt;%&ndash;блок удаления консультации&ndash;%&gt;--%>
<%--                                            <form method="post" action="schedule-delete">--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>--%>
<%--                                                <input class="btn-del" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${!scheduleTuesday.isEmpty()}">--%>
<%--                            <c:if test="${!(2 >= currentDayOfWeek)}">--%>
<%--                                <c:set var="value9" scope="page" value="${9 - currentDayOfWeek}"/>--%>
<%--                                <tr>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${value9 == 2}">--%>
<%--                                            <td>Вторник, ${plusTwoDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value9 == 3}">--%>
<%--                                            <td>Вторник, ${plusThreeDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value9 == 4}">--%>
<%--                                            <td>Вторник, ${plusFourDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value9 == 5}">--%>
<%--                                            <td>Вторник, ${plusFiveDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value9 == 6}">--%>
<%--                                            <td>Вторник, ${plusSixDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                    <td>--%>
<%--                                    <c:forEach var="elem" items="${scheduleTuesday}">--%>
<%--                                        <div class="schedule">--%>
<%--                                            <p>${elem.getStartUser()}</p>--%>
<%--                                            <span>${elem.getDurationUser()} мин.</span>--%>
<%--                                            <form method="post" action="schedule-edit">--%>
<%--                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                            <form method="post" action="schedule-delete">--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>--%>
<%--                                                <input class="btn-del" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${!scheduleWednesday.isEmpty()}">--%>
<%--                            <c:if test="${!(3 >= currentDayOfWeek)}">--%>
<%--                                <c:set var="value10" scope="page" value="${10 - currentDayOfWeek}"/>--%>
<%--                                <tr>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${value10 == 3}">--%>
<%--                                            <td>Среда, ${plusThreeDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value10 == 4}">--%>
<%--                                            <td>Среда, ${plusFourDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value10 == 5}">--%>
<%--                                            <td>Среда, ${plusFiveDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value10 == 6}">--%>
<%--                                            <td>Среда, ${plusSixDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                    <td>--%>
<%--                                    <c:forEach var="elem" items="${scheduleWednesday}">--%>
<%--                                        <div class="schedule">--%>
<%--                                            <p>${elem.getStartUser()}</p>--%>
<%--                                            <span>${elem.getDurationUser()} мин.</span>--%>
<%--                                            <form method="post" action="schedule-edit">--%>
<%--                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                            <form method="post" action="schedule-delete">--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>--%>
<%--                                                <input class="btn-del" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${!scheduleThursday.isEmpty()}">--%>
<%--                            <c:if test="${!(4 >= currentDayOfWeek)}">--%>
<%--                                <c:set var="value11" scope="page" value="${11 - currentDayOfWeek}"/>--%>
<%--                                <tr>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${value11 == 4}">--%>
<%--                                            <td>Четверг, ${plusFourDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value11 == 5}">--%>
<%--                                            <td>Четверг, ${plusFiveDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value11 == 6}">--%>
<%--                                            <td>Четверг, ${plusSixDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                    <td>--%>
<%--                                    <c:forEach var="elem" items="${scheduleThursday}">--%>
<%--                                        <div class="schedule">--%>
<%--                                            <p>${elem.getStartUser()}</p>--%>
<%--                                            <span>${elem.getDurationUser()} мин.</span>--%>
<%--                                            <form method="post" action="schedule-edit">--%>
<%--                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                            <form method="post" action="schedule-delete">--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>--%>
<%--                                                <input class="btn-del" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${!scheduleFriday.isEmpty()}">--%>
<%--                            <c:if test="${!(5 >= currentDayOfWeek)}">--%>
<%--                                <c:set var="value12" scope="page" value="${12 - currentDayOfWeek}"/>--%>
<%--                                <tr>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${value12 == 5}">--%>
<%--                                            <td>Пятница, ${plusFiveDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${value12 == 6}">--%>
<%--                                            <td>Пятница, ${plusSixDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                    <td>--%>
<%--                                    <c:forEach var="elem" items="${scheduleFriday}">--%>
<%--                                        <div class="schedule">--%>
<%--                                            <p>${elem.getStartUser()}</p>--%>
<%--                                            <span>${elem.getDurationUser()} мин.</span>--%>
<%--                                            <form method="post" action="schedule-edit">--%>
<%--                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                            <form method="post" action="schedule-delete">--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>--%>
<%--                                                <input class="btn-del" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${!scheduleSaturday.isEmpty()}">--%>
<%--                            <c:if test="${!(6 >= currentDayOfWeek)}">--%>
<%--                                <c:set var="value13" scope="page" value="${13 - currentDayOfWeek}"/>--%>
<%--                                <tr>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${value13 == 6}">--%>
<%--                                            <td>Суббота, ${plusSixDaysDate}</td>--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                    <td>--%>
<%--                                    <c:forEach var="elem" items="${scheduleSaturday}">--%>
<%--                                        <div class="schedule">--%>
<%--                                            <p>${elem.getStartUser()}</p>--%>
<%--                                            <span>${elem.getDurationUser()} мин.</span>--%>
<%--                                            <form method="post" action="schedule-edit">--%>
<%--                                                <input class="btn-edit" type="number" name="day-of-week" value="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-edit" type="time" name="start" value="${elem.getStartUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="number" name="duration" value="${elem.getDurationUser()}" hidden>--%>
<%--                                                <input class="btn-edit" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                            <form method="post" action="schedule-delete">--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getDayOfWeek()}" hidden>--%>
<%--                                                <input class="btn-del" type="text" name="${elem.getStart()}" hidden>--%>
<%--                                                <input class="btn-del" type="submit" value="">--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>

<%--                    &lt;%&ndash;воскресенье может быть только на текущей неделе!!!&ndash;%&gt;--%>
<%--                    </tbody>--%>
<%--                </table>--%>
            </jsp:attribute>
        </t:template-nav>
    </jsp:body>
</t:template>