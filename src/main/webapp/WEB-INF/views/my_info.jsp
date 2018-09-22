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

<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.js"></script>

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath }/static/css/uccss/my_info.css" rel="stylesheet">

<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- 开始 -->
<div class="my_info_title"><h2>我的资料</h2></div>
<div class="my_info_title_3">
  <ul>
    <li id="listClick_1" onClick="listClick(1)" style="border-bottom: 1px solid #C40521; color: #C40521;">基本资料</li>
    <li id="listClick_3" onClick="listClick(3)">身份认证</li>
    <li id="listClick_4" onClick="listClick(4)">修改密码</li>
  </ul>
</div>
<div class="my_info_content">
  <div class="my_info_content_care"> 以下信息都为必填项，请您认真填写，OK租房有限公司众郑重承诺您的个人信息只做为资源整合和有限合伙企业设立时使用，感谢您对OK租房公司平台的信任和支持！ </div>
  <table class="my_info_content_care_table">
    <tbody>
      <tr>
        <td width="90" align="right" class="color555" name="account"">用户名：</td>
        <td class="color555"><span class="colorCA1E37 margin_left10 font_size12">${user.account }</span></td>
      </tr>
      
      <tr>
        <td align="right" class="color555">手机号：</td>
        <td class="color555"><input class="my_info_content_care_table_text" name="" type="text">
          <span class="color959595 margin_left10 font_size12">友好提示：网站前台不会显示您手机号</span></td>
      </tr>
      <tr>
        <td align="right" class="color555">性别：</td>
        <td class="color555"><label>
            <input type="radio" name="sex" id="" value="未知" checked>
            未知 </label>
          <label>
            <input type="radio" name="sex" id="" value="male">
            男士 </label>
          <label class="radio-inline">
            <input type="radio" name="sex" id="" value="female">
            女士 </label></td>
      </tr>
      <tr>
        <td align="right" class="color555">邮箱：</td>
        <td class="color555"><input class="my_info_content_care_table_text" name="email" type="text">
          <span class="color959595 margin_left10 font_size12">友好提示：请填写常用邮箱，您忘记密码时可用邮箱找回，有新项目动态时会发邮件给您</span></td>
      </tr>
      <tr>
        <td align="right" class="color555">身份证号：</td>
        <td class="color555"><input class="my_info_content_care_table_text" name="identityNum" type="text">
          <span class="colorCA1E37 margin_left10 font_size12">保存后不能修改，请确认无误后再保存</span></td>
      </tr>
      
      <tr>
        <td align="right" class="color555">所在城市：</td>
        <td class="color555"><div id="my_city">
            <select class="prov">
            </select>
            <select class="city" disabled="disabled">
            </select>
            <select class="dist" disabled="disabled">
            </select>
            <span class="color959595 margin_left10 font_size12">友好提示: 我们能为您提供更好的房屋短租服务！</span> </div></td>
      </tr>
      
      <tr>
        <td align="right" class="color555">&nbsp;</td>
        <td class="color555"><span class="color959595 margin_left10 font_size12">友好提示：网站前台页面不会显示您的地址，用于某经融公司众筹平台运营管理人员替您办理入股工商变更手续及快递接收</span></td>
      </tr>
      
      
      
      <tr>
        <td align="center" class="color555" colspan="2"><input class="my_info_content_care_table_submit" name="" type="submit" value="保    存"></td>
      </tr>
    </tbody>
  </table>
</div>

<!-- 结束 --> 
<script src="${pageContext.request.contextPath }/static/js/my_info.js"></script>
<script src="${pageContext.request.contextPath }/static/js/jquery.cityselect.js"></script> 
<script type="text/javascript">
// JavaScript Document
$(document).ready(function(){
	$("#my_city").citySelect({
		prov:"北京",
		nodata:"none"
	});
});
</script>
</body>
</html>