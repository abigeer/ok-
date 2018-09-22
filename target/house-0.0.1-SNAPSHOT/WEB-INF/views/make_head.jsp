<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="revised" content="Ningxia Seasons, 2015/8/13/" />
<!-- 定义页面的最新版本 -->
<meta name="description" content="网站简介" />
<!-- 网站简介 -->
<meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
<!-- 搜索关键字 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>上传头像</title>

<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-form.js"></script>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath }/static/css/uccss/make_head.css" rel="stylesheet">

<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    	$(function(){
    		$("#uploadHeader").click(function(){
    			//对表表单进行验证！
    			$("#headerForm").ajaxSubmit({
    				success:function(data){
    					if(data=="success"){
    						alert("修改成功！");
    						parent.location.href="/houseok/center/toUserCenter";
    					}else if(data=="noImg"){
    						alert("请选择上传图片");
    					}else{
    						alert("修改失败！");
    					}
    				},
    				error:function(){
    					alert("修改失败!");
    				}
    			});
    		});
    	});
	</script>
</head>
<body>
<!-- 开始 -->
<div class="make_head_title">修改头像</div>
<div class="make_head_content">
	<form id="headerForm" action="${pageContext.request.contextPath}/center/dochangeheader"  method="post" enctype="multipart/form-data" >
		<input type="file" name="file" id="upload_head" accept="image/*" multiple="multiple" >
		<button type="button" id="uploadHeader" ><span style="font-size:16px;"><strong>修改</strong></span></button>
	</form>
  	<div class="make_head_content_sm_pic"><img src="${pageContext.request.contextPath }${user.avatar}"><br>头像</div>
</div>

<!-- 结束 --> 
</body>
</html>