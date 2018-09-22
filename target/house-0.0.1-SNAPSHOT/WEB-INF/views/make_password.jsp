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
<title>修改密码</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.js"></script>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath }/static/css/uccss/my_info.css" rel="stylesheet">

<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    	$("document").ready(function(){
    		$("#comfirmPassword").click(function(){
    			var oldPassword = $("#oldpassword").val();
    			var newPassword = $("#newpassword").val();
    			var reNewPassword = $("#renewpassword").val();
    			if(oldPassword.length == 0){
    				alert("请输入旧密码!");
    				return
    			}
    			if(newPassword.length==0){
    				alert("请输入新密码！");
    				return
    			}
    			if(reNewPassword.length==0){
    				alert("请输入确认新密码！");
    				return
    			}
    			if(reNewPassword != newPassword){
    				alert("两次新密码不一致！");
    				return
    			}
    			$.ajax({
    				type:"post",
					dataType:"html",
					url:'/houseok/center/dochangepassword',
					async:true,
					data:{"oldpassword":oldPassword, "newpassword":newPassword, "renewpassword":reNewPassword},
					success:function(data){
						if(data == "success"){
							alert("密码修改成功！");
							parent.location.href = "/houseok/user/toRelogin";
						}else if(data=="fail"){
							alert("密码修改失败！");
						}else if(data=="passwordError"){
							alert("旧密码错误！");
						}else{
							alert("修改失败！");
						}
					}
    			});
    		});
    	});
    </script>
</head>
<body>
<!-- 开始 -->
<div class="my_info_title">修改密码<span>
  <button type="button" class="but">注册时间</button>
  <p>2018年<br></p>
  </span></div>
<div class="my_info_title_3">
  <ul>
    <li id="listClick_1" onClick="listClick(1)">基本资料</li>
    <li id="listClick_3" onClick="listClick(3)">身份认证</li>
    <li id="listClick_4" onClick="listClick(4)" style="border-bottom: 1px solid #C40521; color: #C40521;">修改密码</li>
  </ul>
</div>
<div class="my_info_content">
  <div class="my_info_content_care">友情提示：您的个人信息只用于房源认证使用，感谢您的信任！</div>
  <table class="my_info_content_care_table">
    <tbody>
      <tr>
        <td width="300" align="right" class="color555">旧密码：</td>
        <td class="color555"><input class="my_info_content_care_table_text" name="oldpassword" id = "oldpassword" type="text">
          <span class="colorCA1E37 margin_left10 font_size12">请输入旧密码</span></td>
      </tr>
      <tr>
        <td align="right" class="color555">新密码：</td>
        <td class="color555"><input class="my_info_content_care_table_text" name="newpassword" id="newpassword" type="text">
          <span class="colorCA1E37 margin_left10 font_size12">请输入新密码</span></td>
      </tr>
      <tr>
        <td align="right" class="color555">确认新密码：</td>
        <td class="color555"><input class="my_info_content_care_table_text" name="renewpassword" id="renewpassword" type="text">
          <span class="colorCA1E37 margin_left10 font_size12">请再次输入</span></td>
      </tr>
      <!-- <tr>
        <td align="right" class="color555">验证码：</td>
        <td class="color555"><input class="my_info_content_care_table_text" name="" type="text">
            <span class="color959595 margin_left10 font_size12">请输入验证码</span></td>
      </tr> -->
      <tr>
        <td align="center" class="color555" colspan="2"><input class="my_info_content_care_table_submit" id="comfirmPassword" name="" type="button" value="确认修改"></td>
      </tr>
    </tbody>
  </table>
</div>

<!-- 结束 --> 
<script src="${pageContext.request.contextPath }/static/js/my_info.js"></script>
</body>
</html>