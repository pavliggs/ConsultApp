<%@ page contentType="text/html;text/css;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="style">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/users.css" type="text/css">
    </jsp:attribute>
    <jsp:attribute name="title">
        <title>Пользователи</title>
    </jsp:attribute>
    <jsp:body>
        <t:template-nav>
            <jsp:attribute name="description">
                <p class="h5">Пользователи</p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">Имя и Фамилия</th>
                            <th scope="col">Имя в Discord</th>
                            <th scope="col">Ученая степень</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="elem" items="${users}">
                            <tr>
                                <td>
                                    <div class="wrapper exmpl">
                                        <img src="${pageContext.request.contextPath}/resources/${elem.getImage()}" alt="avatar">
                                    </div>
                                </td>
                                <td>${elem.getName()}</td>
                                <td>${elem.getDiscordName()}</td>
                                <td class="status">
                                    <c:choose>
                                        <c:when test="${elem.isMentor()}">
                                            <div class="mentor">Наставник</div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="student">Студент</div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </jsp:attribute>
        </t:template-nav>
    </jsp:body>
</t:template>