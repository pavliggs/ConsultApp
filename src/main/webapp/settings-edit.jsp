<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="title">
        <title>Редактирование настройки</title>
    </jsp:attribute>
    <jsp:body>
        <p class="h5">
            Настройки: редактирование
        </p>
        <div class="text-center">
            <form method="post" action="settings-save">
                <div class="form-group">
                    <label>
                        Название параметра
                        <input type="text" class="fadeIn second" name="name" value="${pageContext.request.getParameter("name")}" readonly>
                    </label>
                </div>
                <div class="form-group">
                    <label>
                        Значение параметра
                        <input type="text" class="fadeIn third" name="value" value="${pageContext.request.getParameter("value")}">
                    </label>
                </div>

                    <%-- Элемент для определения редактирования из SettingsSave --%>
                <input type="text" name="edit" value="true" hidden>

                <input type="submit" class="btn btn-primary" value="Сохранить">
            </form>
        </div>
    </jsp:body>
</t:template>
