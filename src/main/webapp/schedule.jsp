<%@ page contentType="text/html;text/css;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
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
                                        <p>${elem.getLocalTime()}</p>
                                        <small class="form-text text-muted">${elem.getDuration()} мин.</small>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!scheduleTuesday.isEmpty()}">
                            <tr>
                                <td>Вторник</td>
                                <td>
                                    <c:forEach var="elem" items="${scheduleTuesday}">
                                        <p>${elem.getLocalTime()}</p>
                                        <small class="form-text text-muted">${elem.getDuration()} мин.</small>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!scheduleWednesday.isEmpty()}">
                            <tr>
                                <td>Среда</td>
                                <td>
                                    <c:forEach var="elem" items="${scheduleWednesday}">
                                        <p>${elem.getLocalTime()}</p>
                                        <small class="form-text text-muted">${elem.getDuration()} мин.</small>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!scheduleThursday.isEmpty()}">
                            <tr>
                                <td>Четверг</td>
                                <td>
                                    <c:forEach var="elem" items="${scheduleThursday}">
                                        <p>${elem.getLocalTime()}</p>
                                        <small class="form-text text-muted">${elem.getDuration()} мин.</small>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!scheduleFriday.isEmpty()}">
                            <tr>
                                <td>Пятница</td>
                                <td>
                                    <c:forEach var="elem" items="${scheduleFriday}">
                                        <p>${elem.getLocalTime()}</p>
                                        <small class="form-text text-muted">${elem.getDuration()} мин.</small>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!scheduleSaturday.isEmpty()}">
                            <tr>
                                <td>Суббота</td>
                                <td>
                                    <c:forEach var="elem" items="${scheduleSaturday}">
                                        <p>${elem.getLocalTime()}</p>
                                        <small class="form-text text-muted">${elem.getDuration()} мин.</small>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!scheduleSunday.isEmpty()}">
                            <tr>
                                <td>Воскресенье</td>
                                <td>
                                    <c:forEach var="elem" items="${scheduleSunday}">
                                        <p>${elem.getLocalTime()}</p>
                                        <small class="form-text text-muted">${elem.getDuration()} мин.</small>
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