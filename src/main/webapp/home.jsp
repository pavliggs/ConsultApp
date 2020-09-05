<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="title">
        <title>Home</title>
    </jsp:attribute>
    <jsp:body>
        <t:template-nav>
            <jsp:attribute name="description">
                <h1>Добро пожаловать в личный кабинет, ${sessionScope.get("login")}!</h1>
                <%--конструкция подобна switch-case--%>
                <c:choose>
                    <c:when test="${user.isMentor()}">
                        <p>
                            Здесь вы можете составить своё расписание для того, чтобы студенты курса могли записаться
                            к вам на консультации.
                        </p>
                    </c:when>
                    <c:otherwise>
                        <p>
                            Здесь вы можете записаться на консультации к одному из наставников в удобное
                            вам время.
                        </p>
                    </c:otherwise>
                </c:choose>
            </jsp:attribute>
        </t:template-nav>
    </jsp:body>
</t:template>
