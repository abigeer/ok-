<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en-US">

    <head>

        <title>K租</title>

        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width" />

        <script src="${pageContext.request.contextPath }/static/js/pace.js"></script>

        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/flexslider.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/jquery.selectBox.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/jquery-ui.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/green.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/responsive.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/pace-minimal.css">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Ubuntu:400,700,500' rel='stylesheet' type='text/css'>

        <link rel="shortcut icon" href="${pageContext.request.contextPath }/static/ico/favicon.ico">

        <!--[if lt IE 9]>
            <script src="js/html5shiv.js"></script>
        <![endif]-->
    </head>

    <body>

    <!-- TOP -->
    <div class="top-bar">
    </div>
    <!-- TOP -->

        <!-- HEADER -->
         <div class="top-bar">
                   
               </div>
               <!-- TOP -->
       
               <!-- HEADER -->
               <header class="clearfix">
       
                   <div class="logo">
                       <a href="#"><img src="${pageContext.request.contextPath }/static/images/logo.png" alt="HATA">K租</a>
                   </div>
       
                   <nav class="navbar collapse" id="mobile-menu">
                       <ul class="nav navbar-nav">
                           <li class="active"><a href="${pageContext.request.contextPath }/house/index?pageNum=1">主页</a></li>
                           
                           <li class="dropdown">
                               <li class="active"><a href="#" >找房</a>
                               <ul class="dropdown-menu"></ul>
                           </li>
                           <li class="dropdown">
                               <a class="dropdown-toggle" data-toggle="dropdown">我们</a>
                               <ul class="dropdown-menu">
                                   <li><a href="#">队伍</a></li>
       							   <li><a href="#">  关于我们</a></li>
                               </ul>
                           </li>
                           <shiro:guest>
	                           <li class="active"><a href="login.html">登陆/注册</a></li>
                           </shiro:guest>
                       </ul>
                   </nav>
									<div class="user">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">
											<img src="${pageContext.request.contextPath }/static/images/avatar1.png" alt="User Photo">
											<span class="drop-arow"></span>
										</a>
										<shiro:authenticated>
											<ul class="dropdown-menu user-drop">
												<li><a href="${pageContext.request.contextPath}/center/toUserCenter"><i class="fa fa-user"></i>个人中心</a></li>
												<li><a href="${pageContext.request.contextPath}/user/logout"><i class="fa fa-user"></i>退出登陆</a></li>
											</ul>
										</shiro:authenticated>
									</div>
        </header>
        <!-- HEADER -->

        <div class="page-wrap properties-page property-single">

            <!-- BREADCRUMBS-->
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="breadcrumbs">
                            <a href="index.html">主页</a>
                            <span class="sep">/</span>
                            <span class="current">房屋详细信息</span>
                        </div>
                        <h2 class="page-title">详细信息</h2>
                    </div>
                </div>
            </div>
            <!-- BREADCRUMBS -->

            <div class="container">

                <!-- PROPERTY FILTERS -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="property-filter">
                            <a href="#">全景</a>
                            <a href="#">客厅</a>
                            <a href="#">卧室</a>
                            <a href="#">浴室</a>
                            <a href="#">健身房</a>
                        </div>
                    </div>
                </div>
                <!-- PROPERTY FILTERS -->

                <div class="row">

                    <!-- PROPERTY SLIDER -->
                    <div class="col-md-7 property-slider">
                    <!-- 房屋详情图片 -->
                        <figure>
                            <img src="${pageContext.request.contextPath}/${house.descriptionImg.split(',')[0]}" alt="Image" class="img-responsive">
                            <span class="label sale">热</span>
                        </figure>
                        <div class="thumbnails">
                        	<c:forEach var="houseImg" items="${house.imgArray }" varStatus="status">
                            	<a href="#"><img src="${pageContext.request.contextPath }/${houseImg }" alt="Thumbnils" class="img-responsive"></a>
                        	</c:forEach>
                        </div>
                    </div>
                    <!-- PROPERTY SLIDER -->

                    <!-- PROPERTY DATA -->
                    <div class="col-md-5 property-data">
                        <div class="prop-features prop-before">
                            <span class="location">地点：${house.positionProvince } · ${house.positionCity } · ${house.positionDistrict } · ${house.positionStreet }</span>
                            <span class="area">面积：${house.area }m2</span>
                        </div>
                        <div class="prop-price">
                            <strong class="price">￥价格：${house.price }</strong>
                            <a href="#" class="btn btn-danger">联系客服</a>
                        </div>
                        <div class="prop-features">
                            <span class="bed">${house.houseType}</span>
                            <span class="garage">1 花园</span>
                            <span class="bath">1 浴室</span>
                            <span class="kitchen">1 厨房</span>
                            <span class="gym">1 健身房</span>
                        </div>
                        <ul>
                            <li>花园</li>
                            <li>空调</li>
                            <li>wifi</li>
                            <li>保安系统</li>
                            <li>停车场</li>
                            <li>健身房</li>
                            <li>社区中心</li>
                            <li>详细地址：${house.address }</li>
                            <li>房屋描述：${house.houseDescription }</li>
                            <li>发布时间：${house.creatTime }</li>
                        </ul>
                        <div class="prop-price">
                        	<!-- 跳转至填写订单页面 -->
                            <a href="${pageContext.request.contextPath }/order/creatorder?id=${house.id}" class="btn btn-danger">立即下单</a>
                        </div>
                    </div>
                    <!-- PROPERTY DATA -->
						
                </div>

            </div>

            <!-- GALLERY -->
            
            <!-- GALLERY -->

            <div class="container">
                <div class="row">

                    <!-- INFRASTRUCTURE -->
                   
                    <!-- INFRASTRUCTURE -->

                    <!-- NEARBY PLACES -->
                    

            <!-- BANNER -->
            <div class="full-width personal-agent">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-4">
                            <figure>
                                <img src="${pageContext.request.contextPath }/static/images/agent-pic.png" alt="Pic" class="img-responsive">
                            </figure>
                        </div>
                        <div class="col-md-8 col-sm-8">
                            <article>
                                <span>琦琦</span>
                                <h2>您的个人助理</h2>
                                <p>租房找琦琦<br>琦琦将竭诚为您服务</p>
                                <a href="team-single.html"><button type="button" class="btn btn-danger">联系我</button></a>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
            <!-- BANNER -->
            <h1 size="6">更多相似好房</h1>
            <!-- ITEMS GRID -->
            <div class="container">
                <div class="row">

                    <div class="col-md-4 col-sm-6">
                        <div class="item">
                            <div class="item-header clearfix">
                                <h3>Los Angles Apartment</h3>
                                <span class="favorite"><i class="fa fa-heart"></i>9</span>
                            </div>
                            <figure>
                                <img src="${pageContext.request.contextPath }/static/images/items/7.png" alt="" class="img-responsive">
                                <span class="label sale">Sell</span>
                                <div class="overlay">
                                    <a href="#" class="btn btn-detail">Detail</a>
                                </div>
                            </figure>
                            <div class="item-detail">
                                <div class="left">
                                    <span class="place"><i class="fa fa-map-marker"></i>Galtur (Austria)</span>
                                    
                                </div>
                                <div class="right">
                                    <span class="area">134 m2</span>
                                    <span class="price">￥ 3000</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6">
                        <div class="item">
                            <div class="item-header clearfix">
                                <h3>Los Angles Apartment</h3>
                                <span class="favorite"><i class="fa fa-heart"></i>9</span>
                            </div>
                            <figure>
                                <img src="${pageContext.request.contextPath }/static/images/items/8.png" alt="" class="img-responsive">
                                <span class="label rent">Rent</span>
                                <div class="overlay">
                                    <a href="#" class="btn btn-detail">Detail</a>
                                </div>
                            </figure>
                            <div class="item-detail">
                                <div class="left">
                                    <span class="place"><i class="fa fa-map-marker"></i>Galtur (Austria)</span>
                                    
                                </div>
                                <div class="right">
                                    <span class="area">134 m2</span>
                                    <span class="price">￥ 3000</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6">
                        <div class="item">
                            <div class="item-header clearfix">
                                <h3>Los Angles Apartment</h3>
                                <span class="favorite"><i class="fa fa-heart"></i>9</span>
                            </div>
                            <figure>
                                <img src="${pageContext.request.contextPath }/static/images/items/9.png" alt="" class="img-responsive">
                                <span class="label rent">Rent</span>
                                <div class="overlay">
                                    <a href="#" class="btn btn-detail">Detail</a>
                                </div>
                            </figure>
                            <div class="item-detail">
                                <div class="left">
                                    <span class="place"><i class="fa fa-map-marker"></i>Galtur (Austria)</span>
                                    
                                </div>
                                <div class="right">
                                    <span class="area">134 m2</span>
                                    <span class="price">￥ 3000</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6">
                        <div class="item">
                            <div class="item-header clearfix">
                                <h3>Los Angles Apartment</h3>
                                <span class="favorite"><i class="fa fa-heart"></i>9</span>
                            </div>
                            <figure>
                                <img src="${pageContext.request.contextPath }/static/images/items/10.png" alt="" class="img-responsive">
                                <span class="label hot">Hot</span>
                                <div class="overlay">
                                    <a href="#" class="btn btn-detail">Detail</a>
                                </div>
                            </figure>
                            <div class="item-detail">
                                <div class="left">
                                    <span class="place"><i class="fa fa-map-marker"></i>Galtur (Austria)</span>
                                   
                                </div>
                                <div class="right">
                                    <span class="area">134 m2</span>
                                    <span class="price">￥ 3000</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6">
                        <div class="item">
                            <div class="item-header clearfix">
                                <h3>Los Angles Apartment</h3>
                                <span class="favorite"><i class="fa fa-heart"></i>9</span>
                            </div>
                            <figure>
                                <img src="${pageContext.request.contextPath }/static/images/items/11.png" alt="" class="img-responsive">
                                <span class="label rent">Rent</span>
                                <div class="overlay">
                                    <a href="#" class="btn btn-detail">Detail</a>
                                </div>
                            </figure>
                            <div class="item-detail">
                                <div class="left">
                                    <span class="place"><i class="fa fa-map-marker"></i>Galtur (Austria)</span>
                                    
                                </div>
                                <div class="right">
                                    <span class="area">134 m2</span>
                                    <span class="price">￥ 3000</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6">
                        <div class="item">
                            <div class="item-header clearfix">
                                <h3>Los Angles Apartment</h3>
                                <span class="favorite"><i class="fa fa-heart"></i>9</span>
                            </div>
                            <figure>
                                <img src="${pageContext.request.contextPath }/static/images/items/12.png" alt="" class="img-responsive">
                                <span class="label sale">Sell</span>
                                <div class="overlay">
                                    <a href="#" class="btn btn-detail">Detail</a>
                                </div>
                            </figure>
                            <div class="item-detail">
                                <div class="left">
                                    <span class="place"><i class="fa fa-map-marker"></i>Galtur (Austria)</span>
                                   
                                </div>
                                <div class="right">
                                    <span class="area">134 m2</span>
                                    <span class="price">￥ 3000</span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- ITEMS GRID -->

        </div>

        <!-- CALL2ACTION -->
        
        <!-- CALL2ACTION -->

        <!-- FOOTER -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-5 copy-right">
                        <p><img src="${pageContext.request.contextPath }/static/images/footer-logo.png" alt="Logo" class="img-responsive"> &copy; 2018 OK租房 - ok租房 自由出行</p>
                    </div>
                    <div class="col-md-7">
                        <ul>
                            <li><a href="index.html">主页</a></li>
                            <li><a href="properties-grid.html">找房</a></li>
                            <li><a href="services.html">服务</a></li>
                            <li><a href="team.html">我们团队</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
        <!-- FOOTER -->

        <script src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.js"></script>
        <script src="${pageContext.request.contextPath }/static/js/jquery-ui.js"></script>
        <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath }/static/js/masonry.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath }/static/js/jquery.flexslider-min.js"></script>
        <script src="${pageContext.request.contextPath }/static/js/jquery.selectBox.min.js"></script>
        <script src="${pageContext.request.contextPath }/static/js/icheck.js"></script>
        <script src="${pageContext.request.contextPath }/static/js/counter.animation.js"></script>
        <script src="${pageContext.request.contextPath }/static/js/jquery.appear.js"></script>
        <script src="${pageContext.request.contextPath }/static/js/custom.js"></script>
        <script src="${pageContext.request.contextPath }/static/js/jquery.cycle2.js"></script>

    </body>
</html>
