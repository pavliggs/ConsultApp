<%@tag description="Template tag for consultapp" pageEncoding="UTF-8" %>
<%@attribute name="title" fragment="true" %>
<%@attribute name="style" fragment="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <jsp:invoke fragment="style"/>
    <jsp:invoke fragment="title"/>
</head>
<body>
<header>
    <div class="header">
        <div class="icon-progwards">
            <img src="../../images/progwards.png" alt="progwards_icon">
        </div>
    </div>
</header>
<jsp:doBody/>
<script src="${pageContext.request.contextPath}/js/jquery.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/popper.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js" crossorigin="anonymous"></script>
</body>
</html>