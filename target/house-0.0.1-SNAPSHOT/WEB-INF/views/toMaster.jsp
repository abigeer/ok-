<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>成为房主</title>
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.js"></script>
    <!-- <script src="js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" href="js/jquery-easyui/themes/default/easyui.css" type="text/css"></link>
    <link rel="stylesheet" href="js/jquery-easyui/themes/icon.css" type="text/css"></link>
 -->
    
    <style type="text/css">
		body
		{
			font: normal 14px/1.4 "Helvetica Neue","HelveticaNeue",Helvetica,Arial,sans-serif;
		}
		div
		{
			display:block;
		}
		a
		{
			text-decoration:none;
			opacity: 1;
			color: #fff;
		 }
		input,button{ outline:none; }
		::-moz-focus-inner{border:0px;}   /*去除按钮点击时出现的虚线边框*/
        .login_bg
        {
			position: fixed;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			background-size: cover;
        }
		.login_header {
			position:absolute;
			top:0;
			left:0;
			right:0;
			}
		.container {
			position:relative;
			top:50%;
			margin: 0 auto;
			width: 260px;
			
			}
		#logo
		{
			display: block;
			text-align: center;
			font-weight: bold;
			font-size: 50px;
			color: white;
			height: 100%;
		}
		#subheading 
		{
		  position: relative;
		  width: 517px;
		  left: 50%;
		  margin: 10px 0 16px -258px;
		  font-size: 15px;
		  font-weight: normal;
		  color: #fff;
		  text-align: center;
		}
		.signup_forms
		{
			width:260px;	
		}
		.signup_forms_container
		{
			overflow: hidden;
			background: #fff;
			border-radius:3px;	
		}
		.form_user,.form_password,form_username
		{
			width:260px;
			height:45px;
			margin:0px;
        	padding:0px;
			border:0px;	
		}
		.form_password,.form_username,.form_confirm_password{border-top: 1px solid #e3e3e3;}
		.signup_forms input
		{
			padding: 11px 10px 11px 13px;
			width: 100%;
			margin:0px;
        	background: 0;
			font: 16px/1.4 "Helvetica Neue","HelveticaNeue",Helvetica,Arial,sans-serif;
			border:0px;	
		}
		#signup_forms_submit{
		  margin-top:8px;		
		  width:260px;
		  height:45px;
		  background:#529ECC;
		  border:0px;
		  border-radius:3px;
		  cursor:pointer;              <!--CSS属性设置鼠标为手型-->
		 }
		 #signup_forms_submit span{
			 color: #fff;
			 font: "Helvetica Neue",Arial,Helvetica,sans-serif;
			 font-size: 16px;}
		.footer
		 {
			position: fixed;
			top: auto;
			right: 0;
			bottom: 0;
			left: 0;
		 }
		 .footer_signup_link
		 {
			 position: absolute;
			 width:141px;
			 height:78px;
			 bottom: 0;
			 padding: 0 20px;
			 margin: 0 0 13px 0;
			 line-height: 25px;
			 text-align: center;
			 opacity: 1;
			 color: #fff;
		 }
		 .signup_link
		 {
			  display: block;
			  height: 45px;
			  padding: 0 10px;
			  margin: 0 0 8px 0;
			  font-size: 16px;
			  font-weight: bold;
			  line-height: 45px;
			  border: 0;
			  border-radius: 2px;
			  color: #fff;
              background: rgba(255,255,255,0.33);
		}
		.link
		{
			font-size: 14px;
			padding-right: 5px;
			margin-right: 12px;
			color: #fff;
		}
		.design_show
		{
			position: fixed;
			bottom: 0;
			right: 0;
			padding: 0 12px;
			margin: 0 0 13px 0;
			line-height: 25px;
		}
		.designer_info
		{
			position: relative;
			color: #FFFFFF;
		}
		#face
		{
			margin: 0 0 0 10px;
			border-radius:20px;
			padding: 0;
			vertical-align: middle;
			height: 24px;
			width: 24px;
		}
    </style>
    <script type="text/javascript">
	    $("document").ready(function(){
			$("#signup_forms_submit").click(function(){
				var telephoneNum = $("#signup_telephoneNum").val();
				var email = $("#signup_email").val();
				var identityNum = $("#signup_IDcard").val();
				var province = $("#signup_province").val();
				var city = $("#signup_city").val();
				var district = $("#signup_district").val();
				if(telephoneNum.length == 0){
					alert("手机号必填！");
					return
				}
				if(email.length == 0){
					alert("邮箱号必填！");
					return
				}
				if(identityNum.length == 0){
					alert("身份证号必填！");
					return
				}
				if(province.length == 0){
					alert("省份必填！");
					return
				} 
				if(city.length == 0){
					alert("城市必填！");
					return
				}
				$.ajax({
					type:"post",
					dataType:"html",
					url:'/houseok/center/uptomaster',
					async:true,
					data:{"telephoneNum":telephoneNum, "email":email,
						"identityNum":identityNum, "province":province, "city":city, "district":district},
					success:function(data){
						if(data=="success"){
							parent.location.href = "/houseok/center/toUserCenter";
						}else if(data == "fail"){
							alert("操作失败！");
						}
					}
				});
			});
		});
    </script>
</head>
<body>
    <div id="login_bg" class ="login_bg"> <%-- style="background-image:url(${pageContext.request.contextPath}/static/images/userCenter.jpg);"> --%></div>
    <div class="login_header">
    	<span></span>
    </div>
    
    <div class="container">
    	<div class="form_header">
        	<h1 style="color:cornflowerwhite" id="logo">成为房主</h1>
			<h2 style="color:navajowhite"; font-size:50px; id="subheading">ok租房 自由出行 K租欢迎您</h2>
        </div>
        	<div class="signup_forms" class="signup_forms">
            	<div id="signup_forms_container" class="signup_forms_container">
                    	<form class="signup_form_form" id="sign_form" method="post" >
                        	<div class="signup_account" id="signup_account">
                            	
                                <div class="form_telephoneNum">
           							<input type="text" name="telephoneNum" placeholder="电话号码" id="signup_telephoneNum">
        						</div>
        						<div class="form_email">
           							<input type="text"  name="email" placeholder="邮箱" id="signup_email">
        						</div>
							    <div class="form_identityNum">	
									<input type="text" name="identityNum" placeholder="身份证号" id="signup_IDcard">
								</div>
								<div class="form_province">	
									<input type="text" name="province" placeholder="省" id="signup_province">
								</div>
								<div class="form_city">	
									<input type="text" name="city" placeholder="市" id="signup_city">
								</div>
								<div class="form_district">	
									<input type="text" name="district" placeholder="行政区" id="signup_district">
								</div>
								
		        </div>
            </div>
                				<button type="button" id="signup_forms_submit" ><span style="font-size:16px;">提交<strong></strong></span></button>
           	   				 </div>
                        </form> 
               
    </div>
    
    <div class="footer">
    	<!-- <div class="footer_signup_link">
        	<a class="signup_link" href="#">返回 </a>
        </div> -->
        <div class="design_show">
        	<div class="designer_info">
            	<a href="#">关于我们 <strong>K租</strong></a>
                <a href="#" target="_blank" class="face"><img id="face" src="${pageContext.request.contextPath }/static/images/face.jpg" alt="designed by RayZhang"/></a>
            </div>
        </div>
    </div>
</body>
</html>
            