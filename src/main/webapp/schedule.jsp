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
            </jsp:attribute>
        </t:template-nav>
    </jsp:body>
</t:template>