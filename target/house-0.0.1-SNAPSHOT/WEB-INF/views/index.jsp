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
        <!-- 进度条 -->
        <script src="${pageContext.request.contextPath }/static/js/pace.js"></script>  
        <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/flexslider.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/jquery.selectBox.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/jquery-ui.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/green.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/responsive.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/pace-minimal.css" type="text/css">
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
        <header class="clearfix">
            <div class="logo">
                <a href="#"><img src="${pageContext.request.contextPath }/static/img/index/logo.png" alt="HATA">K租</a>
            </div>
            <nav class="navbar collapse" id="mobile-menu">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="${pageContext.request.contextPath}/house/index?pageNum=1">主页</a></li>
                    <!-- <li class="dropdown">
                        <li class="active"><a href="properties-grid.html" >找房</a>
                        <ul class="dropdown-menu"></ul>
                    </li> -->
                    <li class="dropdown">
                        <a href="${pageContext.request.contextPath}/house/about" class="dropdown-toggle" data-toggle="dropdown">我们</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">队伍</a></li>
							<li><a href="${pageContext.request.contextPath}/house/about">  关于我们</a></li>
                        </ul>
                    </li>
                    <shiro:guest>
                    	<li class="active"><a href="${pageContext.request.contextPath}/user/userLogin">登陆/注册</a></li>
                    </shiro:guest>
                </ul>
            </nav>
						<div class="user">
							<p>${user.account }</p>
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<img src="${pageContext.request.contextPath }/${user.avatar}" alt="User Photo">
								<span class="drop-arow"></span>
							</a>
							<shiro:authenticated><!-- 游客不显示,认证后才显示 -->
								<ul class="dropdown-menu user-drop">
									<li><a href="${pageContext.request.contextPath}/center/toUserCenter"><i class="fa fa-user"></i>个人中心</a></li>
									<li><a href="${pageContext.request.contextPath}/user/logout"><i class="fa fa-user"></i>退出登陆</a></li>
								</ul>
							</shiro:authenticated>
						</div>

            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mobile-menu" aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

        </header>
        <!-- HEADER -->
                
        <!-- SLIDER -->
        <div class="flexslider" id="slider">
            <ul class="slides">
                <li>
                    <img src="${pageContext.request.contextPath }/static/img/index/slider.jpg" class="img-responsive" alt="Slider Image" />
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="detail">
                                    <div class="white">
                                        <h2>别墅<br>仙境</h2>
                                        <span class="slide-location">武汉***</span>
                                        <div class="bar"></div>
                                        <span class="slide-price">￥ 9999999**</span>
                                    </div>
                                    <div class="red">
                                        <span class="bath">3 浴室</span>
                                        <span class="bed">2 卧室</span>
                                        <span class="gym">1 健身房</span>
                                        <span class="pool">2 游泳池</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath }/static/img/index/slider.jpg" class="img-responsive" alt="Slider Image" />
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="detail">
                                    <div class="white">
                                        <h2>别墅<br>天籁</h2> 
                                        <span class="slide-location">武汉***</span>
                                        <div class="bar"></div>
                                        <span class="slide-price">￥99999**</span>
                                    </div>
                                    <div class="red">
                                        <span class="bath">4卧室</span>
                                        <span class="bed">4 浴室</span>
                                        <span class="gym">1 健身房</span>
                                        <span class="pool">2 游泳池</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <!-- SLIDER -->

        <!-- FILTER -->
        <div class="container">
            <div class="filter">

                <select class="location">
                    <option>位置</option>
                    <option>武汉</option>
                    <option>天宫</option>
                    <option>地府</option>
                </select>

                <select class="cata">
                    <option>房型</option>
                    <option>别墅</option>
                    <option>公寓</option>
                    <option>家庭套房</option>
					<option>四合院</option>
				    <option>蜗居</option>
                </select>

                <select class="type">
                    <option>户型</option>
                    <option>独卫</option>
                    <option>单间</option>
                    <option>整租</option>
                </select>

                
								

                <button type="button" class="btn"><i class="fa fa-search"></i>搜索</button>

                <div class="range">
                    <p>
                      <label for="price">价格</label>
                      <span>￥<input type="text" id="price" ></span>
                    </p>
                    <div id="price-range"></div>
                </div>
                <!-- <a href="properties-list.html" class="adv-srch">高级搜索</a> -->
            </div>
        </div>
        <!-- FILTER -->

        <!-- ITEMS GRID -->
        <div class="container">
            <div class="row">
            
            	<c:forEach var="house" items="${page.list }" varStatus="status">
            		<c:if test="${house.houseState!='1' }">
	            		<div class="col-md-4 col-sm-6">
		                    <div class="item">
		                        <div class="item-header clearfix">
		                            <h3><a href="#">${house.houseType }</a></h3>
		                            <span class="favorite"><i class="fa fa-heart"></i>9</span>
		                        </div>
		                        <figure>
		                            <img src="${pageContext.request.contextPath }/${house.descriptionImg.split(',')[0] }" alt="" class="img-responsive">
		                            <span class="label sale">热</span>
		                            <div class="overlay">
		                            	<!-- 前往房源详情页面 -->
		                                <a href="${pageContext.request.contextPath }/house/detail?id=${house.id}" class="btn btn-detail">详情</a>
		                            </div>
		                        </figure>
		                        <div class="item-detail">
		                            <div class="left">
		                                <span class="place"><i class="fa fa-map-marker"></i>${house.positionProvince } · ${house.positionCity}</span>                                
		                            </div>
		                            <div class="right">
		                                <span class="area">134 m2</span>
		                                <span class="price"> ￥${house.price}</span>
		                            </div>
		                        </div>
		                    </div>
		                </div>
            		</c:if>
            	</c:forEach>

                <!-- <div class="col-md-4 col-sm-6">
                    <div class="item">
                        <div class="item-header clearfix">
                            <h3><a href="#">房屋名称</a></h3>
                            <span class="favorite"><i class="fa fa-heart"></i>9</span>
                        </div>
                        <figure>
                            <img src="images/items/1.png" alt="" class="img-responsive">
                            <span class="label sale">热</span>
                            <div class="overlay">
                                <a href="#" class="btn btn-detail">Detail</a>
                            </div>
                        </figure>
                        <div class="item-detail">
                            <div class="left">
                                <span class="place"><i class="fa fa-map-marker"></i>地址</span>                                
                            </div>
                            <div class="right">
                                <span class="area">134 m2</span>
                                <span class="price"> ￥1000</span>
                            </div>
                        </div>
                    </div>
                </div> -->

            </div>
        </div>
        
        <div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="pagination">
							<!-- 如果只有一页 -->
							<c:if test="${page.totalPage ==1 }">
								<span>1</span>
							</c:if>
							<!-- 大于一页 -->
							<c:if test="${page.totalPage > 1 }">
								<!-- 如果是第一页就没有上一页 -->
								<c:if test="${page.pageNum ==1 }">
									<c:forEach begin="${page.start }" end="${page.end }" step="1" var="i">
										<c:if test="${page.pageNum == i }">
											<span>${i}</span>
										</c:if>
										<c:if test="${page.pageNum != i }">
											<a href="${pageContext.request.contextPath}/house/index?pageNum=${i}">${i}</a>
										</c:if>
									</c:forEach>
									<a href="${pageContext.request.contextPath}/house/index?pageNum=${page.pageNum+1}" class="next">下一页<i class="fa fa-angle-right"></i></a> 
								</c:if>
								<!-- 如果当前页就不是最后一页也不是第一页就有上下页 -->
								<c:if test="${page.pageNum >1 && page.pageNum < page.totalPage}">
									<a href="${pageContext.request.contextPath}/house/index?pageNum=${page.pageNum-1}" class="prev"><i class="fa fa-angle-left"></i>上一页</a>
									<c:forEach begin="${page.start }" end="${page.end }" step="1" var="i">
										<c:if test="${page.pageNum == i }">
											<span>${i}</span>
										</c:if>
										<c:if test="${page.pageNum != i }">
											<a href="${pageContext.request.contextPath}/house/index?pageNum=${i}">${i}</a>
										</c:if>
									</c:forEach>
									<a href="${pageContext.request.contextPath}/house/index?pageNum=${page.pageNum+1}" class="next">下一页<i class="fa fa-angle-right"></i></a> 
								</c:if>
								<!-- 如果是最后一页只有上一页 -->
								<c:if test="${page.pageNum == page.totalPage}">
									<a href="${pageContext.request.contextPath}/house/index?pageNum=${page.pageNum-1}" class="prev"><i class="fa fa-angle-left"></i>上一页</a>
									<c:forEach begin="${page.start }" end="${page.end }" step="1" var="i">
										<c:if test="${page.pageNum == i }">
											<span>${i}</span>
										</c:if>
										<c:if test="${page.pageNum != i }">
											<a href="${pageContext.request.contextPath}/house/index?pageNum=${i}">${i}</a>
										</c:if>
									</c:forEach>
								</c:if>
							</c:if>
						</div>
					</div>
				</div>
			</div>
        <!-- ITEMS GRID -->

        <!-- FACTS -->
        
        <!-- FACTS -->

        <!-- ITEMS GRID -->
        
        <footer>
        		<div class="container">
        				<div class="row">
        						<div class="col-md-5 copy-right">
        								<p><img src="${pageContext.request.contextPath}/static/img/index/footer-logo.png" alt="Logo" class="img-responsive"> &copy; 2018 OK租房 - ok租房 自由出行</p>
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
       

        <!-- <script src="js/jquery-1.11.3.min.js"></script> -->
        <script src="${pageContext.request.contextPath}/static/js/jquery-ui.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/masonry.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/jquery.flexslider-min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/jquery.selectBox.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/icheck.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/counter.animation.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/jquery.appear.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/custom.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/jquery.cycle2.js"></script>

    </body>
</html>
