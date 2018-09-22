<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>User Regist Page</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
	<form action="${pageContext.request.contextPath}/user/doUserRegist" method="POST">
		<fieldset>
			<legend>填写注册信息</legend>
			账号(必填):<input type="text" name="account" ><br>
			密码（必填）:<input type = "password" name="password"><br>
			在输入一边密码（必填）:<input type="password" name="repassword"><br>
			省份：(必填)<input type="text" name="province"><br>
			城市（必填）：<input type="text" name="city"><br>
			性别（必填）<br>
			<input type="radio" name="sex" value="male">男<br>
			<input type="radio" name="sex" value="female">女<br>
			身份证号:<input type="text" name="identityNum"><br>
			手机号:<input type="text" name="telephoneNum"><br>
			邮箱（必填）：<input type="text" name="email"><br>
			<input type="submit" value="注册">
		</fieldset>
	</form>
</body>
</html>