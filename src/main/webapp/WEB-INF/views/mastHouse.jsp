<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%><!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="https://s1.ljcdn.com/matrix_pc/dist/pc/src/common/css/common.css?_v=20180830210305ddd">
	<script>
		var g_conf = {};
	</script>
	<link rel="stylesheet" href="https://s1.ljcdn.com/matrix_pc/dist/pc/src/page/list/index.css?_v=20180830210305ddd">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/green.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css" type="text/css">
	<style>
		.browser__low {
			height: 100%;
			overflow: hidden;
		}

		.browser__low--wrapper,
		.browser__low--inner {
			display: none;
		}
        .make_head_title{
        	color: #555;
        	font-size: 26px;
        	line-height: 26px;
        	margin-top:10px;
        	width:100%;
        	height:66px;
        	}
		.browser__low .browser__low--wrapper {
			position: absolute;
			left: 0;
			right: 0;
			top: 0;
			bottom: 0;
			z-index: 199999;
			background: #000;
			opacity: 0.5;
			filter: alpha(opacity=50);
			display: block;
		}

		.browser__low .browser__low--inner {
			background: #fff;
			position: absolute;
			left: 50%;
			top: 50%;
			z-index: 19999999;
			width: 360px;
			height: 100px;
			margin-top: -90px;
			margin-left: -200px;
			padding: 40px 20px;
			display: block;
		}

		.browser__low .browser__low--inner p {
			font-size: 20px;
			padding-bottom: 40px;
		}

		.browser__low .browser__low--inner a {
			display: inline-block;
			color: #fff;
			background: #2ab78e;
			padding: 10px 6px;
		}
	</style>
</head>

<body >
	<div class="make_head_title"><h6>我发布的房源</h6></div>
			<div class="content w1150" id="content">
				<div class="content__article">
					
					<div class="content__list">
					<!-- 查询到房主房源不为空时 -->
					<c:if test="${masterHouses.list != null }">	<!--  -->
						<c:forEach var = "house" items = "${masterHouses.list }" varStatus="status">
							<!-- 迭代所有房源 -->
							<div class="content__list--item">
								<!-- <a class="link" target="_blank" data-id="16108" href="#"> -->
									<a class="content__list--item--aside" target="_blank" href="#">
										<img  src="${pageContext.request.contextPath }/${house.descriptionImg.split(',')[0] }" >
									</a>
									<div class="content__list--item--main">
										<p class="content__list--item--title twoline">
											<a target="_blank" href="/apartment/3488.html">${house.houseDescription }</a>	<!-- 类型 -->
										</p>
										<p class="content__list--item--des">
											<span class="room__left">${house.houseState=='1'?"待审核":house.houseState=='2'?"在售":"已售" }</span>
											<i>/</i>
											${house.area }㎡
											<i>/</i>
											${house.houseType }
										</p>
										<span class="content__list--item-price">
											<a href="${pageContext.request.contextPath }/center/deleteHouse?id=${house.id}&pageNum=${masterHouses.pageNum}">删除</a></span>
									</div>
								<!-- </a> -->
							</div>
						</c:forEach>
					</c:if>
					</div>
					<div class="content__pg" data-el="page_navigation" data-url="/zufang/pg{page}/" data-totalPage=100 data-curPage=1>
						
					</div>
				</div>
	
							<!-- 如果只有一页 -->
							<c:if test="${masterHouses.totalPage ==1 }">
								<span>1</span>
							</c:if>
							<!-- 大于一页 -->
							<c:if test="${masterHouses.totalPage > 1 }">
								<!-- 如果是第一页就没有上一页 -->
								<c:if test="${masterHouses.pageNum ==1 }">
									<c:forEach begin="${masterHouses.start }" end="${masterHouses.end }" step="1" var="i">
										<c:if test="${masterHouses.pageNum == i }">
											<span>${i}</span>
										</c:if>
										<c:if test="${masterHouses.pageNum != i }">
											<a href="${pageContext.request.contextPath}/house/index?pageNum=${i}">${i}</a>
										</c:if>
									</c:forEach>
									<a href="${pageContext.request.contextPath}/house/index?pageNum=${masterHouses.pageNum+1}" class="next">下一页<i class="fa fa-angle-right"></i></a> 
								</c:if>
								<!-- 如果当前页就不是最后一页也不是第一页就有上下页 -->
								<c:if test="${masterHouses.pageNum >1 && page.pageNum < page.totalPage}">
									<a href="${pageContext.request.contextPath}/house/index?pageNum=${masterHouses.pageNum-1}" class="prev"><i class="fa fa-angle-left"></i>上一页</a>
									<c:forEach begin="${masterHouses.start }" end="${masterHouses.end }" step="1" var="i">
										<c:if test="${masterHouses.pageNum == i }">
											<span>${i}</span>
										</c:if>
										<c:if test="${masterHouses.pageNum != i }">
											<a href="${pageContext.request.contextPath}/house/index?pageNum=${i}">${i}</a>
										</c:if>
									</c:forEach>
									<a href="${pageContext.request.contextPath}/house/index?pageNum=${masterHouses.pageNum+1}" class="next">下一页<i class="fa fa-angle-right"></i></a> 
								</c:if>
								<!-- 如果是最后一页只有上一页 -->
								<c:if test="${masterHouses.pageNum == masterHouses.totalPage}">
									<a href="${pageContext.request.contextPath}/house/index?pageNum=${masterHouses.pageNum-1}" class="prev"><i class="fa fa-angle-left"></i>上一页</a>
									<c:forEach begin="${masterHouses.start }" end="${masterHouses.end }" step="1" var="i">
										<c:if test="${masterHouses.pageNum == i }">
											<span>${i}</span>
										</c:if>
										<c:if test="${masterHouses.pageNum != i }">
											<a href="${pageContext.request.contextPath}/house/index?pageNum=${i}">${i}</a>
										</c:if>
									</c:forEach>
								</c:if>
							</c:if>
						
	</div>
</body>
<script type="text/javascript" src="https://s1.ljcdn.com/matrix_pc/dist/pc/src/common/js/common.js?_v=20180830210305ddd"></script>
</html>
