<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>YUKAI WEBSYSTEM ADMIN</title>

    <meta name="description" content="YUKAI WEBSYSTEM ADMIN DESCRIOTION"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/images/favicon.ico">
</head>

<body class="no-skin">
<shiro:notAuthenticated>
    <jsp:forward page="404.jsp"/>
</shiro:notAuthenticated>
<shiro:authenticated>
  This is    <h1>Chart Main</h1>
</shiro:authenticated>
</body>
</html>
