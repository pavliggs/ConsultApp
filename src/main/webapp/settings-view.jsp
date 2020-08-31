<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="style">
        <link href="./css/consult-app.css" rel="stylesheet" id="consult-app-css">
    </jsp:attribute>
    <jsp:attribute name="title">
        <title>Настройки</title>
    </jsp:attribute>
    <jsp:body>
        <t:template-nav>
            <jsp:attribute name="description">
                <p class="h5">
                    Настройки
                </p>
                <div class="float-right text-center">
                    <a href="settings-add.jsp"><img class="w-50" src="images/add-settings.png" alt="Добавить"></a>
                </div>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Название</th>
                            <th scope="col">Значение</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="elem" items="${settings}">
                            <tr>
                                <td>${elem.getName()}</td>
                                <td>${elem.getValue()}</td>
                                <td>
                                    <form action="settings-delete" method="post">
                                        <input class="btn-del" type="submit" name="${elem.getName()}" value=""/>
                                    </form>
                                    <form action="settings-edit.jsp" method="post">
                                        <input class="btn-edit" type="text" name="name" value="${elem.getName()}" hidden />
                                        <input class="btn-edit" type="text" name="value" value="${elem.getValue()}" hidden />
                                        <input class="btn-edit" type="submit" value=""/>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
            </jsp:attribute>
        </t:template-nav>
    </jsp:body>
</t:template>