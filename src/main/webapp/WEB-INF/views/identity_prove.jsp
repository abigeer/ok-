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
<title>身份认证</title>

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
<div class="my_info_title">身份认证<span>
  <button type="button" class="but">签到</button>
  <p>07月29日<br>
    漏签1天</p>
  </span></div>
<div class="my_info_title_3">
  <ul>
    <li id="listClick_1" onClick="listClick(1)">基本资料</li>
    <li id="listClick_3" onClick="listClick(3)" style="border-bottom: 1px solid #C40521; color: #C40521;">身份认证</li>
    <li id="listClick_4" onClick="listClick(4)">修改密码</li>
  </ul>
</div>
<div class="my_info_content">
  <div class="my_info_content_care">您还未申请身份认证！<br></div>
  <table class="my_info_content_care_table">
    <tbody>
      <tr>
        <td width="300" align="right" class="color555">上传身份证正面照：</td>
        <td class="color555"><input class="my_info_content_care_table_file" name="" type="file"></td>
      </tr>
      <tr>
        <td align="right" class="color555">&nbsp;</td>
        <td class="color555"><img id="cardimg" width="215" height="110" src="${pageContext.request.contextPath }/static/images/user_center/default_idcard.jpg"></img></td>
      </tr>
      <tr>
        <td align="right" class="color555">上传身份证背面照：</td>
        <td class="color555"><input class="my_info_content_care_table_file" name="" type="file"></td>
      </tr>
      <tr>
        <td align="right" class="color555">&nbsp;</td>
        <td class="color555"><img id="cardimg" width="215" height="110" src="${pageContext.request.contextPath }/static/images/user_center/default_idcard.jpg"></img></td>
      </tr>
      <tr>
        <td align="right" class="color555">&nbsp;</td>
        <td class="color555"><span class="color959595 margin_left10 font_size12">温馨提示：请上传JPG/GIF/PNG格式图片，文件大小请控制在1M以内！</span></td>
      </tr>
      <tr>
        <td align="center" class="color555" colspan="2"><input class="my_info_content_care_table_submit" name="" type="submit" value="申请认证"></td>
      </tr>
    </tbody>
  </table>
</div>

<!-- 结束 --> 
<script src="${pageContext.request.contextPath }/static/js/my_info.js"></script>
</body>
</html>