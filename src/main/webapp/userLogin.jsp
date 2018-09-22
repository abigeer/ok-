<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>User Login Page</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
	<!-- <link rel="stylesheet" type="text/css" href="styles.css"> -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.js"></script>
	<!-- <script type="text/javascript">
		$(doucment).ready(function(){
			$("#login").click(function(){
				val account = $("#account").val();
				val password = $("password").val();
				//判断
				if(account.length() == 0){
					alert("请输入账号");
					$("#account").tips({msg:"请输入账号！"});
					return;
				}
				if(password.length() == 0){
					$("#password").tips({msg:"请输入密码！"});
					return;
				}
				$.ajax({
					url: "/user/doUserLogin",		//提交到controller的路径
					type: "post",
					data:{"account":account, "password":password},	//data为stirng类型必须是key/value
					dataType: "json",		//服务端返回的数据类型
					//请求成功后的回调函数，其中的参数data为controller返回的map,
					//也就是说,@ResponseBody将返回的map转化为JSON格式的数据，
					//然后通过data这个参数取JSON数据中的值
					success: function(data){
						if(data.message== "success"){
							//登陆进首页
							window.location.href = "/user/toHouseSource";
						}else if(data.message == "uae"){
							//用户不存在
							$("#account").tips({msg:"用户不存在！"});
						}else if(data.message == "ice"){
							//密码错误
							$("#password").tips({msg:"密码错误！"});
						}else{
							alert("登陆失败请重试");
						}
					},
				});
			});
		});
	</script> -->
	<!-- <script>
		$("document").ready(function(){
			$("#login").click(function(){
				alert("123");
			});
		});
	</script> -->
	<script type="text/javascript">
		$("document").ready(function(){
			$("#login").click(function(){
				var account = $("#account").val();
				var password = $("#password").val();
				if(account.length == 0){
					$("#accountMsg").text("请输入账号!");
					return
				}
				if(password == 0){
					$("#passwordMsg").text("请输入密码!");
					return
				}
				$.ajax({
					type:"post",
					dataType:"html",
					url:'/houseok/user/doUserLogin',
					async:true,
					data:{"account":account, "password":password},
					success:function(data){
						if(data == "uae"){
							$("#accountMsg").text("用户不存在！");
						}else if(data == "ice"){
							$("#passwordMsg").text("账号或密码错误！");
						}else if(data == "success"){
							window.location.href="/houseok/user/toHouseSource";
						}else{
							alert("登陆失败");
						}
					}
				});
			});
		});
	</script>
</head>
<body>
	<p>anwo</p>
	<form>
		<fieldset>
			<legend>填写登陆信息</legend>
			账号:<input id="account" type="text" name="account" ><p id="accountMsg" style="color:red"></p><br>
			密码:<input id="password" type = "password" name="password" ><p id="passwordMsg" style="color:red"></p><br>
			<input id="login" type="button"  value="登陆">
		</fieldset>
	</form>
	<!-- <form action="">
			账号:<input id="account" type="text" name="account" ><br>
			密码:<input id="password" type = "password" name="password" ><br>
			<input id="login" type="button"  value="登陆">
	</form> -->
	
</body>
</html>