<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="style">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/success-reg.css">
    </jsp:attribute>
    <jsp:attribute name="title">
        <title>Успешная регистрация!</title>
    </jsp:attribute>
    <jsp:body>
        <div class="container">
            <h1>Поздравляю, ${pageContext.request.getParameter("login")}! Вы успешно зарегистрировались!</h1>
            <a href="${pageContext.request.contextPath}/login"><button class="btn btn-primary">Войти</button></a>
        </div>
    </jsp:body>
</t:template>
