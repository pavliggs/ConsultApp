<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<t:template>
    <jsp:attribute name="style">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registration.css">
    </jsp:attribute>
    <jsp:attribute name="title">
        <title>Регистрация</title>
    </jsp:attribute>
    <jsp:body>
<%--        <c:set var="login" scope="application" value="${pageContext.request.getParameter('login2')}"/>--%>
<%--        <c:set var="login" scope="application" value="${pageContext.request.getParameter('password2')}"/>--%>
        <div class="container">
            <form method="post" action="successful-registration" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="login">Логин</label>
                    <input type="text" class="form-control" id="login" name="login" value="${pageContext.request.getParameter('login2')}">
                </div>
                <div class="form-group">
                    <label for="password">Пароль</label>
                    <input type="password" id="password" class="form-control" name="password" value="${pageContext.request.getParameter('password2')}">
                </div>
                <div class="form-group">
                    <label for="name">Введите имя и фамилию</label>
                    <input class="form-control" type="text" id="name" name="name" required>
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="isMentor">
                    <label class="form-check-label" for="exampleCheck1">Ментор</label>
                </div>
                <div class="form-group">
                    <label for="email">Введите email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="progwardsAccountLink">Введите ссылку на профиль в учебной платформе Progwards</label>
                    <input class="form-control" type="text" id="progwardsAccountLink" name="linkAccount" required>
                </div>
                <div class="form-group">
                    <label for="image">Загрузите аватар</label>
                    <input type="file" class="form-control-file" id="image" name="file">
                </div>
                <button type="submit" class="btn btn-primary">Зарегистрировать</button>
            </form>
        </div>
    </jsp:body>
</t:template>

