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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>K租用户中心</title>

<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.js"></script>
<!-- CSS公共部分 开始 -->
<link href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" rel="stylesheet">

<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="${pageContext.request.contextPath }/static/css/uccss/style.css" rel="stylesheet">
<!-- CSS公共部分 结束 -->

<link href="${pageContext.request.contextPath }/static/css/uccss/crowdfunding.css" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/static/ico/favicon.ico">
</head>
<body background="${pageContext.request.contextPath }/static/images/userCenter_bg.jpg" container-fluid cfh_top background-repeat norepate style="background-size:100%;  ;">
  
</div>
<header class="clearfix">

            <div class="logo">
                <a href="#"><img src="${pageContext.request.contextPath }/static/images/logo.png" alt="HATA"><h1>K租</h1></a>
            </div></header>

<!-- top + banner 结束 --> 
<!-- 核心 开始 --> 
<div class="container border1 nopadding margin10">
  <div id="vertical_navigation" class="col-lg-3 background000000 nopadding">
    <div class="dead_pic"><img src="${pageContext.request.contextPath }${user.avatar}"><br>
      <span class="username" name="account">${user.account }</span></div>
    

    <div class="menu">
      <div class="menu_title"> 我的信息 </div>
      <div class="menu_list">
        <ul class="list-unstyled">
          <li id="listClick1" class="menu_list_on" onClick="listClick(1)"><img src="${pageContext.request.contextPath }/static/images/user_center/left_icon_1.png"> 基本信息</li>
          <li id="listClick2" class="" onClick="listClick(2)"> <img src="${pageContext.request.contextPath }/static/images/user_center/left_icon_2.png"> 修改头像</li>
          <li id="listClick3" class="" onClick="listClick(3)"> <img src="${pageContext.request.contextPath }/static/images/user_center//left_icon_2.png"> 身份认证</li>
          <li id="listClick4" class="" onClick="listClick(4)"> <img src="${pageContext.request.contextPath }/static/images/user_center/left_icon_3.png"> 修改密码</li>
        </ul>
      </div>
    </div>
    <div class="menu">
      <div class="menu_title">订单</div>
      <div class="menu_list">
        <ul class="list-unstyled">
          <li> <a href="${pageContext.request.contextPath }/center/myOrder"><img src="${pageContext.request.contextPath }/static/images/user_center/left_icon_6.png"> 我的订单</a></li>
          <!-- 有房主身份才显示 -->
          <shiro:hasRole name="master">
          	<li id="listClick7" class="" onClick="listClick(7)"> <img src="${pageContext.request.contextPath }/static/images/user_center/left_icon_6.png"> 我收到的订单</li>
          </shiro:hasRole>
        </ul>
      </div>
    </div>
    <div class="menu">
      <div class="menu_title">房主</div>
      <div class="menu_list">
        <ul class="list-unstyled">
        	<!-- 已经是房主就不显示“成为房主” -->
        	<shiro:hasRole name="customer">
          		<li id="listClick8" class="" onClick="listClick(8)"> <img src="${pageContext.request.contextPath }/static/images/user_center/left_icon_8.png"> 成为房主</li>
        	</shiro:hasRole>
        		<!-- 成为房主才显示 -->
	          <shiro:hasRole name="master">
	          	<li id="listClick9" class="" onClick="listClick(9)"> <img src="${pageContext.request.contextPath }/static/images/user_center/left_icon_9.png"> 我发布的房源</li>
	          </shiro:hasRole>
          <!-- 成为房主才显示 -->
          <shiro:hasRole name="master">
          	<%-- <li><a href="publish.html"> <img src="${pageContext.request.contextPath }/static/images/user_center/left_icon_9.png"> 发布房源</li> --%>
          	<li id="listClick10" class="" onClick="listClick(10)"> <img src="${pageContext.request.contextPath }/static/images/user_center/left_icon_9.png"> 发布房源</li>
          </shiro:hasRole>
          
        </ul>
      </div>
    </div>
    
    
  </div>
  <div class="col-lg-9">
  	<iframe name="left" id="crowdfunding_iframe" allowtransparency="true" src="${pageContext.request.contextPath }/center/myInfo" frameborder="false" scrolling="no" style="border:none;" width="100%" height="1045" allowtransparency="true"></iframe>
  </div>
</div>
<!-- 核心 结束 -->  

<!-- 版权 开始 -->
<  
        <footer>
        		<div class="container">
        				<div class="row">
        						<div class="col-md-5 copy-right">
        								<p> &copy; 2018 OK租房 - ok租房 自由出行</p>
        						</div>
        						<div class="col-md-7">
        								
        										<a href="${pageContext.request.contextPath }/house/index?pageNum=1">主页</a></li>
        										<a href="properties-grid.html">找房</a></li>
        										<a href="services.html">服务</a></li>
        										<a href="team.html">我们团队</a></li>
        						</div>
        				</div>
        		</div>
        </footer>
<!-- 版权 结束 --> 
<!-- 结束 --> 
<!-- JS公共部分 开始 --> 
<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath }/static/js/basics.js"></script>
 
<!-- JS公共部分 结束 --> 
<script src="${pageContext.request.contextPath }/static/js/crowdfunding.js"></script>
</body>
</html>