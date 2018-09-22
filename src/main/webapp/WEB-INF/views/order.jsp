<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Fare Payment Widget Responsive Widget Template :: W3layouts</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fare Payment Widget Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->

<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.js"></script>
<!-- css files -->
<link href="${pageContext.request.contextPath }/static/css/order/style.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/order/creditly.css" type="text/css" media="all" /> <!-- credit-card-CSS -->
<!-- //css files -->

<!-- online-fonts -->
<link href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i&amp;subset=latin-ext" rel="stylesheet">
<!--//online-fonts -->
<script type="text/javascript">
	$("document").ready(function(){
		$("#submit_order").click(function(){
			alert("hello");
			var realname = $("#realname").val();
			var identityNum = $("#identityNum").val();
			var telephoneNum = $("#telephoneNum").val();
			var outTime = $("ouTtime").val();
			if(realname.length==0){
				alert("真实姓名必填");
				return
			}
			if(identityNum.length==0){
				alert("身份证号必填");
				return
			}
			if(telephoneNum.length==0){
				alert("电话号必填");
				return
			}
			$.ajax({
				type:"post",
				dataType:"html",
				url:"/houseok/order/neworder",
				async:true,
				data:{"customerName":realname,"identityNum":identityNum,"telephoneNum":telephoneNum,"customerName":realname},
				success:function(data){
					if(data=="success"){
						alert("订单提交成功");
						window.location.href="/houseok/house/index?pageNum=1";
					}
				}
			});
		});
	});
</script>
</head>
<body>
<div class="header">
	<h1>下 单</h1>
</div>

<div class="w3-main">
	<!-- Main -->
	<div class="about-bottom">
		<div class="w3l_about_bottom_left" style="background-image: ${pageContext.request.contextPath }/${house.descriptionImg.split(',')[0] };">
			
			<div class="book-form b2">
				<div class="agile-form">
				<h3 class="cat-w3l">月租：</h3>
				<h3 class="cat2-w3l">${house.price }</h3>
				<div class="clear"></div>
			    <form action="#" method="post">
					<div class="form-date-w3-agileits2 w3l1">
						<input type="text" name="name" placeholder="Have a discount code?" required="">
					</div>
					
				</form>
				<div class="price-agile">
					<ul>
						<li>总 计:</li>
						<li class="small-w3">Vat: 20%</li>
					</ul>
				</div>
				<div class="price-agile2">
					<ul>
						<li>￥${house.price }</li>
						<li class="small-w3">￥0.0</li>
					</ul>
				</div>
				<div class="clear"> </div>
				<div class="price-agile-w3">
					<h5>折扣</h5>
					<ul>
						<li>UP TO</li>
						<li>0% Offer</li>
						<li class="small-w3">Contact and Get Your Special Discount</li>
					</ul>
				</div>
				
			</div>
			</div>
		</div>
		<div class="w3l_about_bottom_right two">
			<div class="book-form">
				<h2 class="tittle">填 写 订 单</h2>
			    <form action="#" method="post" class="creditly-card-form agileinfo_form">
				<section class="creditly-wrapper wthree, w3_agileits_wrapper">
					<div class="form-date-w3-agileits">
						<label> 真实姓名 </label>
						<input type="text" name="realname" id="realname" placeholder="真实姓名" required="">
					</div>
					<div class="form-date-w3-agileits">
						<label> 身份证号 </label>
						<input type="email" name="identityNum" id="identityNum" placeholder="邮箱" required="">
					</div>
					<div class="form-date-w3-agileits">
						<label class="control-label">电话</label>
						<input class="number credit-card-number form-control" type="text" name="telephoneNum" id="telephoneNum" 
							inputmode="numeric" autocomplete="cc-number" autocompletetype="cc-number" x-autocompletetype="cc-number"
							placeholder="电话">

					</div>
					<div class="form-date-w3-agileits">
						<label>退房时间</label>
						<input class="expiration-month-and-year form-control" type="text" name="outTime" id="outTime" placeholder="YYYY-MM-DD">		
					</div>
					
					<div class="make wow shake">
						  <input type="button" id="submit_order" name="submit" value="立即下单">
					</div>
					</section>

				</form>
			</div>

		</div>
		
		<div class="clear"> </div>
	</div>
</div>
<!-- //Main -->

<!-- footer -->
<div class="footer-w3l">
	<p>&copy; 2018 K 租. All rights reserved | Design by <a href="">K 租</a></p>
</div>
</body>
</html>