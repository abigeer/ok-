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
        <title>关于我们</title>
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
       <header class="clearfix">

            <div class="logo">
                <a href="#"><img src="${pageContext.request.contextPath }/static/img/index/logo.png" alt="HATA">K租</a>
            </div>

            <nav class="navbar collapse" id="mobile-menu">
            		<ul class="nav navbar-nav">
            				<li class="active"><a href="${pageContext.request.contextPath }/house/index?pageNum=1">主页</a></li>
            				
            				<!-- <li class="dropdown">
            						<li class="active"><a href="properties-grid.html" >找房</a>
            						<ul class="dropdown-menu"></ul>
            				</li> -->
            				<!-- <li class="dropdown">
            						<a class="dropdown-toggle" data-toggle="dropdown">服务</a>
            						<ul class="dropdown-menu">
            								<li><a href="services.html">服务页面</a></li>
            								<li><a href="services-single.html">准备文件</a></li>
            								<li><a href="services-single.html">设计项目</a></li>
            								<li><a href="services-single.html">房屋装修</a></li>
            						</ul>
            				</li> -->
            				<li class="active"><a href="login.html">登陆/注册</a></li>
            		</ul>
            </nav>

            <div class="user">
				<p>${user.account }</p>
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<img src="${pageContext.request.contextPath }/static/img/index/avatar1.png" alt="User Photo">
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

        <div class="page-wrap">

            <!-- BREADCRUMBS-->
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="breadcrumbs">
                            <a href="index.html">主页</a>
                            <span class="sep">/</span>
                            <span class="current">关于我们</span>
                        </div>
                        <h2 class="page-title">关于我们</h2>
                    </div>
                </div>
            </div>
            <!-- BREADCRUMBS -->

            <!-- CONTENTS -->
            <div class="container">
                <div class="page-contents">

                    <div class="row">
                        <div class="col-md-11 col-md-offset-1">
                            <p>  武汉OK租房租科技发展有限公司（简称K租），成立于2018年8月，是国内领先的大数据驱动的全价值链商办运营平台，致力于商办产业资源整合及行业效能提升。

									k租聚焦写字楼租赁及各类强相关服务领域，依托强大的平台资源优势，推出“xx”产业赋能战略，以大数据生态系统为核心驱动，开放布局资产管理 、楼点通、SpaceOne、选址和K租商城等生态业务体系，连接、赋能产业链上下游参与者，为其提供集策划、营销、运营、去化及服务为一体的整体解决方案。

									自成立以来，K租的商业模式及价值潜力屡获资本青睐。
							</p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <figure>
                                <a href="#">
                                    <img src="${pageContext.request.contextPath }/static/images/about.png" alt="Profile Image" class="img-responsive">
                                    <div class="overlay"></div>
                                </a>
                            </figure>
                        </div>
                        <div class="col-md-7">
                            <p>黑暗中，我看到令我瞠目的景象，两队人使尽全力滚着硕大的圆形重物，面对面相互冲刺撞击。一方叫骂“你们为何不肯放弃？”另一方回击“你们为何放手丢弃？”重物撞击的疼痛，令两方发出惊人的哀嚎声。但是，无论多么痛苦与疲倦，彼此的攻击却无法停止</p>
                            <p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?</p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-11 col-md-offset-1">
                            <p>这凄惨的呼声，发自那些悲哀的灵魂，他们生前不曾受到称赞，也未留下骂名。混杂在这可鄙的合唱当中，还有一些天使，他们曾不忠于上帝，但也不反叛上帝，他们一心考虑的只有自己。</p>
                        </div>
                    </div>

                </div>
            </div>
            <!-- CONTENTS -->

            <!-- BANNER  -->
            <div class="full-width history">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h3>大事记</h3>
                            <p>我们走罢，因为漫长的道路不容我们稍停。<br>  神选的器皿’去到那里，为信仰带来了鼓励，而信仰正是走上获救之途的凭依 <br> 通过我，进入痛苦之城；通过我，进入永世凄苦之深坑；通过我，进入万劫不复之人群。</p>
                            <a href="team.html"><button class="btn btn-danger">联系我们</button></a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- BANNER -->

            <!-- CONTENTS -->
            <div class="container">
                <div class="page-contents">

                    <div class="row">
                        <div class="col-md-11 col-md-offset-1">
                            <p>倘若这厄运业已发生，那也不算过早：既然它总要发生，那就索性让它早日来到！因为不然的话，这会使我更加痛苦，正如我会变得更加衰老。</p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-7">
                            <p>倘若这厄运业已发生，那也不算过早：既然它总要发生，那就索性让它早日来到！因为不然的话，这会使我更加痛苦，正如我会变得更加衰老。 </p>
                            <p>倘若这厄运业已发生，那也不算过早：既然它总要发生，那就索性让它早日来到！因为不然的话，这会使我更加痛苦，正如我会变得更加衰老。</p>
                        </div>
                        <div class="col-md-5">
                            <figure>
                                <a href="#">
                                    <img src="${pageContext.request.contextPath }/static/images/about2.png" alt="Profile Image" class="img-responsive">
                                    <div class="overlay"></div>
                                </a>
                            </figure>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-11 col-md-offset-1">
                            <p>倘若这厄运业已发生，那也不算过早：既然它总要发生，那就索性让它早日来到！因为不然的话，这会使我更加痛苦，正如我会变得更加衰老。</p>
                        </div>
                    </div>

                </div>
            </div>
            <!-- CONTENTS -->

            <!-- BANNER  -->
            <div class="full-width partners">
                <div class="container">
                    <div class="row">
                        <ul>
                            <li class="col-md-2"><a href="#"><img src="${pageContext.request.contextPath }/static/images/logo1.png" alt="Client Logo" class="img-responsive"></a></li>
                            <li class="col-md-2"><a href="#"><img src="${pageContext.request.contextPath }/static/images/logo2.png" alt="Client Logo" class="img-responsive"></a></li>
                            <li class="col-md-2"><a href="#"><img src="${pageContext.request.contextPath }/static/images/logo3.png" alt="Client Logo" class="img-responsive"></a></li>
                            <li class="col-md-2"><a href="#"><img src="${pageContext.request.contextPath }/static/images/logo4.png" alt="Client Logo" class="img-responsive"></a></li>
                            <li class="col-md-2"><a href="#"><img src="${pageContext.request.contextPath }/static/images/logo5.png" alt="Client Logo" class="img-responsive"></a></li>
                            <li class="col-md-2"><a href="#"><img src="${pageContext.request.contextPath }/static/images/logo6.png" alt="Client Logo" class="img-responsive"></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- BANNER -->

            <!-- REVIEWS -->
            <div class="full-width rewiews">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <img src="${pageContext.request.contextPath}/static/images/avatar1.png" alt="" class="img-responsive">
                            <h6>七七</h6>
                            <p>K租市场研究中心负责人兼首席市场分析师，毕业于中国传媒大学，研究生学历，曾就职于国家统计局，在存量房市场研究领域具有丰富、专业的经验，在城市发展、经纪行业等多个领域有独到见解</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- REVIEWS -->

        </div>

        <!-- CALL2ACTION -->
        <div class="full-width call-action">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <h4>想租房？找K租</h4>
                    </div>
                    <div class="col-md-3">
                        <a href="contact.html" class="btn btn-danger">联系我们</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- CALL2ACTION -->

        <!-- FOOTER -->
        
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
