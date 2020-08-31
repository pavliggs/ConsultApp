<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="title">
        <title>Home</title>
    </jsp:attribute>
    <jsp:body>
        <t:template-nav>
            <jsp:attribute name="description">
                <p>${pageContext.request.getParameter("login1")}</p>
                <p>${pageContext.request.getParameter("password1")}</p>
            </jsp:attribute>
        </t:template-nav>
    </jsp:body>
</t:template>
