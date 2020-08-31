<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="style">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    </jsp:attribute>
    <jsp:attribute name="title">
        <title>Авторизация</title>
    </jsp:attribute>
    <jsp:body>
        <div class="container">
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                    <form method="post" action="user-auth">
                        <div class="form-group">
                            <label for="exampleInputLogin">Логин</label>
                            <input type="text" class="form-control" name="login1" id="exampleInputLogin" required>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Пароль</label>
                            <input type="password" class="form-control" name="password1" id="exampleInputPassword1" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Войти</button>
                    </form>
                </div>
                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                    <form method="post" action="registration">
                        <div class="form-group">
                            <label for="login">Введите логин</label>
                            <input type="text" class="form-control" id="login" name="login2" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Введите пароль</label>
                            <input type="password" id="password" class="form-control" name="password2" required>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Повторите пароль</label>
                            <input type="password" class="form-control" name="repeated-password">
                        </div>
                        <button type="submit" class="btn btn-primary">Далее</button>
                    </form>
                </div>
            </div>
            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Уже зарегистрирован!</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Регистрация</a>
                </li>
            </ul>
        </div>
    </jsp:body>
</t:template>
