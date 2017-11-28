<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>name</title>
</head>
<body>
<form action="/WxAuth/callBack" method="post">
	<input type="text" name="account">
	<input type="password" name="password">
	<input type="hidden" name="openid" value="${openid}">
	<input type="submit" value="登录并绑定">
</form>
</body>
</html>