<%@tag description="Template tag for consultapp" pageEncoding="UTF-8" %>
<%@attribute name="description" fragment="true" %>

<div class="row">
    <div class="col-3">
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link active" href="${pageContext.request.contextPath}/home">Главная</a>
            <a class="nav-link" href="#">Пользователи</a>
<%--            <a class="nav-link" href="#">Записаться на консультации</a>--%>
            <a class="nav-link" href="${pageContext.request.contextPath}/settings-view">Настройки</a>
        </div>
    </div>
    <div class="col-9">
        <jsp:invoke fragment="description"/>
    </div>
</div>
<a href="${pageContext.request.contextPath}/exit"><button class="btn btn-primary exit-button">Выйти</button></a>
<script src="${pageContext.request.contextPath}/js/script-nav.js"></script>