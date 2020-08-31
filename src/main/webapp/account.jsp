<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="title">
        <title>Личный кабинет</title>
    </jsp:attribute>
    <jsp:body>
        <t:template-nav>
            <jsp:attribute name="description">
                <h1>Добро пожаловать!!!</h1>
            </jsp:attribute>
        </t:template-nav>
<%--        <ul class="nav flex-column">--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link active" href="${pageContext.request.contextPath}/settings-view">Настройки</a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" href="#">Пользователи</a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" href="#">Link</a>--%>
<%--            </li>--%>
<%--        </ul>--%>
    </jsp:body>
</t:template>