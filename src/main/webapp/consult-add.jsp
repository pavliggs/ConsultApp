<%@ page contentType="text/html;text/css;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="title">
        <title>Запись на консультацию</title>
    </jsp:attribute>
    <jsp:body>
        <t:template-nav>
            <jsp:attribute name="description">
                <p class="h5">Запись на консультацию</p>
                <form method="post" action="consults-save">
                    <input type="text" name="mentor" value="${param.get("mentor")}" hidden>
                    <div class="form-group">
                        <label>
                            Дата и время начала
                            <input type="text" name="start" value="${param.get("start")}" hidden>
                            <p>${param.get("date-consult")}, ${param.get("start-consult")}</p>
                        </label>
                    </div>
                    <div class="form-group">
                        <label>
                            Продолжительность, мин.
                            <input type="text" name="duration" value="${param.get("duration")}" hidden>
                            <p>${param.get("duration-consult")}</p>
                        </label>
                    </div>
                    <div class="form-group">
                        <p>Комментарий</p>
                        <textarea rows="10" cols="50" name="comment"></textarea>
                    </div>
                    <input type="submit" class="btn btn-primary" value="Записаться">
                </form>
            </jsp:attribute>
        </t:template-nav>
    </jsp:body>
</t:template>