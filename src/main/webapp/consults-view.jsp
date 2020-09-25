<%@ page contentType="text/html;text/css;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="style">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/consults-view.css">
    </jsp:attribute>
    <jsp:attribute name="title">
        <title>Консультации у ментора</title>
    </jsp:attribute>
    <jsp:body>
        <t:template-nav>
            <jsp:attribute name="description">
                <p class="h5">Консультации</p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <td scope="col">День недели, дата</td>
                            <td scope="col">Консультации</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${!mondayConsults.isEmpty()}">
                            <tr>
                                <td>Понедельник, ${mondayConsults.get(0).getDateConsult()}</td>
                                <td>
                                    <c:forEach var="elem" items="${mondayConsults}">
                                        <div class="consult-form">
                                            <form method="post" action="consults-add">
                                                <input type="text" name="mentor" value="${elem.getMentor()}" hidden>
                                                <input type="number" name="start" value="${elem.getStart()}" hidden>
                                                <input type="number" name="duration" value="${elem.getDuration()}" hidden>
                                                <input type="text" name="date-consult" value="${elem.getDateConsult()}" hidden>
                                                <input type="text" name="start-consult" value="${elem.getStartUser()}" hidden>
                                                <input type="number" name="duration-consult" value="${elem.getDurationUser()}" hidden>
                                                <c:choose>
                                                    <c:when test="${elem.isExistStudent()}">
                                                        <input type="submit" class="btn btn-primary" value="${elem.getStartUser()} - ${elem.getEndUser()}" disabled>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="submit" class="btn btn-outline-primary" value="${elem.getStartUser()} - ${elem.getEndUser()}">
                                                    </c:otherwise>
                                                </c:choose>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!tuesdayConsults.isEmpty()}">
                            <tr>
                                <td>Вторник, ${tuesdayConsults.get(0).getDateConsult()}</td>
                                <td>
                                    <c:forEach var="elem" items="${tuesdayConsults}">
                                        <div class="consult-form">
                                            <form method="post" action="consults-add">
                                                <input type="text" name="mentor" value="${elem.getMentor()}" hidden>
                                                <input type="number" name="start" value="${elem.getStart()}" hidden>
                                                <input type="number" name="duration" value="${elem.getDuration()}" hidden>
                                                <input type="text" name="date-consult" value="${elem.getDateConsult()}" hidden>
                                                <input type="text" name="start-consult" value="${elem.getStartUser()}" hidden>
                                                <input type="number" name="duration-consult" value="${elem.getDurationUser()}" hidden>
                                                <c:choose>
                                                    <c:when test="${elem.isExistStudent()}">
                                                        <input type="submit" class="btn btn-primary" value="${elem.getStartUser()} - ${elem.getEndUser()}" disabled>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="submit" class="btn btn-outline-primary" value="${elem.getStartUser()} - ${elem.getEndUser()}">
                                                    </c:otherwise>
                                                </c:choose>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!wednesdayConsults.isEmpty()}">
                            <tr>
                                <td>Среда, ${wednesdayConsults.get(0).getDateConsult()}</td>
                                <td>
                                    <c:forEach var="elem" items="${wednesdayConsults}">
                                        <div class="consult-form">
                                            <form method="post" action="consults-add">
                                                <input type="text" name="mentor" value="${elem.getMentor()}" hidden>
                                                <input type="number" name="start" value="${elem.getStart()}" hidden>
                                                <input type="number" name="duration" value="${elem.getDuration()}" hidden>
                                                <input type="text" name="date-consult" value="${elem.getDateConsult()}" hidden>
                                                <input type="text" name="start-consult" value="${elem.getStartUser()}" hidden>
                                                <input type="number" name="duration-consult" value="${elem.getDurationUser()}" hidden>
                                                <c:choose>
                                                    <c:when test="${elem.isExistStudent()}">
                                                        <input type="submit" class="btn btn-primary" value="${elem.getStartUser()} - ${elem.getEndUser()}" disabled>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="submit" class="btn btn-outline-primary" value="${elem.getStartUser()} - ${elem.getEndUser()}">
                                                    </c:otherwise>
                                                </c:choose>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!thursdayConsults.isEmpty()}">
                            <tr>
                                <td>Четверг, ${thursdayConsults.get(0).getDateConsult()}</td>
                                <td>
                                    <c:forEach var="elem" items="${thursdayConsults}">
                                        <div class="consult-form">
                                            <form method="post" action="consults-add">
                                                <input type="text" name="mentor" value="${elem.getMentor()}" hidden>
                                                <input type="number" name="start" value="${elem.getStart()}" hidden>
                                                <input type="number" name="duration" value="${elem.getDuration()}" hidden>
                                                <input type="text" name="date-consult" value="${elem.getDateConsult()}" hidden>
                                                <input type="text" name="start-consult" value="${elem.getStartUser()}" hidden>
                                                <input type="number" name="duration-consult" value="${elem.getDurationUser()}" hidden>
                                                <c:choose>
                                                    <c:when test="${elem.isExistStudent()}">
                                                        <input type="submit" class="btn btn-primary" value="${elem.getStartUser()} - ${elem.getEndUser()}" disabled>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="submit" class="btn btn-outline-primary" value="${elem.getStartUser()} - ${elem.getEndUser()}">
                                                    </c:otherwise>
                                                </c:choose>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!fridayConsults.isEmpty()}">
                            <tr>
                                <td>Пятница, ${fridayConsults.get(0).getDateConsult()}</td>
                                <td>
                                    <c:forEach var="elem" items="${fridayConsults}">
                                        <div class="consult-form">
                                            <form method="post" action="consults-add">
                                                <input type="text" name="mentor" value="${elem.getMentor()}" hidden>
                                                <input type="number" name="start" value="${elem.getStart()}" hidden>
                                                <input type="number" name="duration" value="${elem.getDuration()}" hidden>
                                                <input type="text" name="date-consult" value="${elem.getDateConsult()}" hidden>
                                                <input type="text" name="start-consult" value="${elem.getStartUser()}" hidden>
                                                <input type="number" name="duration-consult" value="${elem.getDurationUser()}" hidden>
                                                <c:choose>
                                                    <c:when test="${elem.isExistStudent()}">
                                                        <input type="submit" class="btn btn-primary" value="${elem.getStartUser()} - ${elem.getEndUser()}" disabled>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="submit" class="btn btn-outline-primary" value="${elem.getStartUser()} - ${elem.getEndUser()}">
                                                    </c:otherwise>
                                                </c:choose>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!saturdayConsults.isEmpty()}">
                            <tr>
                                <td>Суббота, ${saturdayConsults.get(0).getDateConsult()}</td>
                                <td>
                                    <c:forEach var="elem" items="${saturdayConsults}">
                                        <div class="consult-form">
                                            <form method="post" action="consults-add">
                                                <input type="text" name="mentor" value="${elem.getMentor()}" hidden>
                                                <input type="number" name="start" value="${elem.getStart()}" hidden>
                                                <input type="number" name="duration" value="${elem.getDuration()}" hidden>
                                                <input type="text" name="date-consult" value="${elem.getDateConsult()}" hidden>
                                                <input type="text" name="start-consult" value="${elem.getStartUser()}" hidden>
                                                <input type="number" name="duration-consult" value="${elem.getDurationUser()}" hidden>
                                                <c:choose>
                                                    <c:when test="${elem.isExistStudent()}">
                                                        <input type="submit" class="btn btn-primary" value="${elem.getStartUser()} - ${elem.getEndUser()}" disabled>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="submit" class="btn btn-outline-primary" value="${elem.getStartUser()} - ${elem.getEndUser()}">
                                                    </c:otherwise>
                                                </c:choose>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!sundayConsults.isEmpty()}">
                            <tr>
                                <td>Воскресенье, ${sundayConsults.get(0).getDateConsult()}</td>
                                <td>
                                    <c:forEach var="elem" items="${sundayConsults}">
                                        <div class="consult-form">
                                            <form method="post" action="consults-add">
                                                <input type="text" name="mentor" value="${elem.getMentor()}" hidden>
                                                <input type="number" name="start" value="${elem.getStart()}" hidden>
                                                <input type="number" name="duration" value="${elem.getDuration()}" hidden>
                                                <input type="text" name="date-consult" value="${elem.getDateConsult()}" hidden>
                                                <input type="text" name="start-consult" value="${elem.getStartUser()}" hidden>
                                                <input type="number" name="duration-consult" value="${elem.getDurationUser()}" hidden>
                                                <c:choose>
                                                    <c:when test="${elem.isExistStudent()}">
                                                        <input type="submit" class="btn btn-primary" value="${elem.getStartUser()} - ${elem.getEndUser()}" disabled>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="submit" class="btn btn-outline-primary" value="${elem.getStartUser()} - ${elem.getEndUser()}">
                                                    </c:otherwise>
                                                </c:choose>
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