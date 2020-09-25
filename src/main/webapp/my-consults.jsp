<%@ page contentType="text/html;text/css;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="style">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/consults-del.css">
    </jsp:attribute>
    <jsp:attribute name="title">
        <title>Мои консультации</title>
    </jsp:attribute>
    <jsp:body>
        <t:template-nav>
            <jsp:attribute name="description">
                <p class="h5">Консультации</p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <td scope="col">Дата, время начала</td>
                            <td scope="col">Продолжительность, мин</td>
                            <td scope="col">Наставник</td>
                            <td scope="col"></td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="elem" items="${infoConsults}">
                            <tr>
                                <td>${elem.getDateConsult()}, ${elem.getStartUser()}</td>
                                <td>${elem.getDurationUser()}</td>
                                <td>${elem.getNameMentor()}</td>
                                <td>
                                    <form action="consults-delete" method="post">
                                        <input type="text" name="mentor" value="${elem.getMentor()}" hidden>
                                        <input type="text" name="start" value="${elem.getStart()}" hidden>
                                        <input type="text" name="duration" value="${elem.getDuration()}" hidden>
                                        <input class="btn btn-outline-primary" type="submit" value="Отменить запись"/>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </jsp:attribute>
        </t:template-nav>
    </jsp:body>
</t:template>