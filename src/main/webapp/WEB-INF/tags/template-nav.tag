<%@tag description="Template tag for consultapp" pageEncoding="UTF-8" %>
<%@attribute name="description" fragment="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-3">
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link" href="${pageContext.request.contextPath}/home">Главная</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/users">Пользователи</a>
            <c:choose>
                <c:when test="${sessionScope.get('user').isMentor()}">
                    <a class="nav-link" href="${pageContext.request.contextPath}/schedule">Расписание</a>
                </c:when>
                <c:otherwise>
                    <a class="nav-link" href="${pageContext.request.contextPath}/consults">Консультации</a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/my-consults">Мои консультации</a>
                </c:otherwise>
            </c:choose>
            <a class="nav-link" href="${pageContext.request.contextPath}/settings-view">Настройки</a>
            <a href="${pageContext.request.contextPath}/exit"><button class="btn btn-primary exit-button">Выйти</button></a>
        </div>
    </div>
    <div class="col-9">
        <jsp:invoke fragment="description"/>
    </div>
</div>
<%--<script src="${pageContext.request.contextPath}/js/script-nav.js"></script>--%>