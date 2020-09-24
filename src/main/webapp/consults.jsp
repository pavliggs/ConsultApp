<%@ page contentType="text/html;text/css;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="style">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/consults.css">
    </jsp:attribute>
    <jsp:attribute name="title">
        <title>Менторы</title>
    </jsp:attribute>
    <jsp:body>
        <t:template-nav>
            <jsp:attribute name="description">
                <p class="h5">Наставники</p>
                <p>Здесь вы можете записаться на консультацию к одному из наставников</p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <td scope="col"></td>
                            <td scope="col">Наставник</td>
                            <td scope="col"></td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="elem" items="${mentors}">
                            <tr>
                                <td>
                                    <div class="wrapper exmpl">
                                        <img src="${pageContext.request.contextPath}/resources/${elem.getImage()}" alt="avatar">
                                    </div>
                                </td>
                                <td>${elem.getName()}</td>
                                <td>
                                    <form method="get" action="consults-view">
                                        <input type="text" name="mentor" value="${elem.getLogin()}" hidden>
                                        <input type="submit" value="Просмотр консультаций">
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
