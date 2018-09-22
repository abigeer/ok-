<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>K租注册</title>
    <base href="<%=basePath%>" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-form.js"></script>
    <!-- <script src="js/jquery.easyui.min.js"></script> -->
    <!-- <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script> -->
    <!-- <link rel="stylesheet" href="js/jquery-easyui/themes/default/easyui.css" type="text/css"></link>
    <link rel="stylesheet" href="js/jquery-easyui/themes/icon.css" type="text/css"></link> -->

    <link rel="shortcut icon" href="${pageContext.request.contextPath }/static/ico/favicon.ico">
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
    	$(function(){
    		$("#signup_forms_submit").click(function(){
    			//对表表单进行验证！
    			$("form").ajaxSubmit({
    				success:function(data){
    					if(data=="ok"){
    						alert("发布成功！");
    					}else{
    					alert("发布失败！");
    					}
    				},
    				error:function(){
    					alert("发布失败!");
    				}
    			});
    		});
    	});
	   
	</script>
</head>
<body>
    <div id="login_bg" class ="login_bg" ></div>
    <div class="login_header">
    	<span></span>
    </div>
    
    <div class="container">
    	<div class="form_header">
        	<h1 id="logo">发布房源</h1>
			<h2 id="subheading">ok租房 自由出行 K租欢迎您</h2>
        </div>
        	<div class="signup_forms" class="signup_forms">
            	<div id="signup_forms_container" class="signup_forms_container">
                    	<form id="houseform" action="${pageContext.request.contextPath }/master/addhouse" method="post" enctype="multipart/form-data" >
                        	<div class="signup_account" id="signup_account">
                                <div class="form_username">
           							<input type="text" name="positionProvince" placeholder="房源省份" id="signup_username">
        						</div>
                                <div class="form_password">
           							<input type="text" name="positionCity" placeholder="房源所在市" id="signup_password">
        						</div>
        						<div class="form_confirm_password">
           							<input type="text" name="positionDistrict"  placeholder="房源所在区" id="signup_confirm_password">
        						</div>
								<div class="form_user">	
									<input type="text" name="positionStreet" placeholder="房源所在街道" id="signup_IDcard">
								</div>
								<div class="form_user">	
									<input type="text" name="houseType" placeholder="房屋类型" id="signup_phone">
								</div>
								<div class="form_user">	
									<input type="text" name="area" placeholder="房源面积" id="signup_email">
								</div>
								<div class="form_user">	
									<input type="text" name="price" placeholder="月租" id="signup_email">
								</div>
								<div class="form_user">	
									<textarea name="address"  id="signup_phone" rows="5" cols="30">详细地址：</textarea>
								</div>
								<div class="form_user">	
									<textarea name="houseDescription"  id="signup_phone" rows="5" cols="30">房源描述：</textarea>
								</div>
								<div class="form_user">
									<input type="file" name="file1" id="file1" accept="image/*" multiple="multiple" onchange="imgChange('file3','img3');" />
									<%-- <div id="preview">
										<img id="img1" src="${pageContext.request.contextPath }/static/images/upload-bj.png"width="230"height="180" />
									</div> --%>
								</div>
								<div class="form_username">
									<input type="file" name="file2" id="file2" accept="image/*" multiple="multiple" onchange="imgChange('file3','img3');" />
									<%-- <div id="preview">
										<img id="img2" src="${pageContext.request.contextPath }/static/images/upload-bj.png"width="230"height="180" />
									</div> --%>
								</div>
								<div class="form_username">
									<input type="file" name="file3" id="file3" accept="image/*" multiple="multiple" onchange="imgChange('file3','img3');" />
									<%-- <div id="preview">
										<img id="img3" src="${pageContext.request.contextPath }/static/images/upload-bj.png"width="230"height="180" />
									</div> --%>
								</div>
                            </div>
                             </div>
                				<button type="button" id="signup_forms_submit" ><span style="font-size:16px;"><strong>提交</strong></span></button>
           	   				 </div>
                        </form> 
    </div>
    
    
</body>
</html>