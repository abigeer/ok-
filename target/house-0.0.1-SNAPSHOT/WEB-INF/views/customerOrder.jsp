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
		
       <title>我的订单</title>
		   <meta charset="UTF-8" />
	     <meta http-equiv="Content-Type"  content="text/html; charset=gb2312" />
	     <meta name="format-detection" content="telephone=no" />
       <script type="text/javascript"></script>
    	 <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath }/static/css/uccss/11.css"/>
       <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath }/static/css/uccss/12.css"/>
			 <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath }/static/css/uccss/share-rec.css"/>
			 <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath }/static/css/uccss/tips.css"/>
		   <script language="javascript" type="text/javascript" >
		   if(window.top !== window.self){ window.top.location = window.location;}
	     </script>
</head>  
<body myjd="_MYJD_ordercenter" style="background: url(${pageContext.request.contextPath }/static/images/userCenter_bg.jpg);">
    

    <div class="w"> 
        <div id="content">
            <div id="sub">
            	<!--左侧导航栏-->
               	<div id="menu">

	<dl class="fore1">
			<dt id="_MYJD_fw"><h2>我的订单</h2></dt>
			<dd class="fore1_1" id="_MYJD_repair">
		</dl>
		
	</div>
                
            </div>
            <div id="main">
		<div id="chunjie" class="mb10"></div>
                
                <div class="safety-box hide">
                </div>

                <div class="mod-main mod-comm lefta-box" id="order02">
                    <div class="mt">
                        <ul class="extra-l">
                            <li class="fore1"><a href="" class="txt">全部订单</a></li>
                                                    <div class="extra-r">
                                <div class="search">
                                    <input id="ip_keyword" type="text" class="itxt" value="商品名称/订单号">
                                    <a href="javascript:;" class="search-btn" clstag="click|keycount|orderinfo|search">搜索<b></b></a>
                                </div>
                            </div>
                                            </div>

                    <div class="mc">

                                <table class="td-void order-tb">
                                <colgroup>
                                <col class="number-col">
                                <col class="consignee-col">
                                <col class="amount-col">
                                <col class="status-col">
                                <col class="operate-col">
                                </colgroup>
                            
                                <tr>
                                    <th><div class="ordertime-cont">
									<div class="time-txt">订单<b></b><span class="blank"></span></div>
									<div class="time-list">
	                                       
	                </div>
									</div>
									<div class="order-detail-txt ac">订单详情</div>
									</th>
                                    <th>入住人</th>
                                    <th>金额</th>
                                    <!-- <th>
                                        <div class="deal-state-cont" id="orderState">
                                            <div class="state-txt">全部状态<b></b><span class="blank"></span></div>
                                            <div class="state-list">
                                                <ul>
                                                    <li value="4096">
                                                        <a href="#none" clstag='click|keycount|orderlist|quanbuzhuangtai' class="curr"><b></b>全部状态</a>
                                                    </li>
                                                    <li value="1">
                                                        <a href="#none" clstag='click|keycount|orderlist|dengdaifukuan'><b></b>等待付款</a>
                                                    </li>
                                                    <li value="128" clstag='click|keycount|orderlist|dengdaishouhuo'>
                                                        <a href="#none"><b></b>等待收货</a>
                                                    </li>
                                                    <li value="1024">
                                                        <a href="#none" clstag='click|keycount|orderlist|yiwancheng'><b></b>已完成</a>
                                                    </li>
                                                    <li value="-1">
                                                        <a href="#none" clstag='click|keycount|orderlist|yiquxiao'><b></b>已取消</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </th> -->
                                    <th>订单状态</th>
                                </tr>

                                                            </thead>
		 <tbody id="tb-78637762351">
        <tr class="sep-row"><td colspan="5"></td></tr>
    
                <tr class="tr-th">
                    <td colspan="5">
                <span class="gap"></span>
                <span class="dealtime" title="2018-08-22 22:47:04">2018.8.22</span>
                <input type="hidden" id="" value=""/>

                <span class="number">
               		                	订单号：
                	                	<a name='orderIdLinks' id='orderId' target='_blank' href='' clstag='click|keycount|orderinfo|order_num'>78637762351</a> </span>

                <div class="tr-operate">
                	                        <span class="order-shop">
                            <a href="#none" target="_blank" class="shop-txt venderName667857" clstag='click|keycount|orderlist|vender'></a>
                            <a class="btn-im venderChat667857" href="#none" target='_blank' title="联系卖家"  clstag='click|keycount|orderinfo|chatim'></a>
                        </span>

                        <span class="tel">
                            <i class="tel-icon venderTel667857"></i>
                        </span>
                    
                    
        <a href="#none" clstag='click|keycount|orderlist|dingdanshanchu' class="order-del" _orderid="78637762351" _passkey="E355B43EB705D6F62F9F587F5672DE59"></a>

                                    </div>
            </td>
        </tr>

        
        <tr class="tr-bd" id="track78637762351" oty="22,4,70" cxl="0">
            <td>
                <div class="goods-item p-27994895084">
                    <div class="p-img">
                        <a href="" clstag="click|keycount|orderinfo|order_product" target="_blank">
                     <img class="err-product" src="img/1.jpg" title="data-lazy-img" width="60" height="60">
						 
                        </a>
                    </div>
                   
                <div class="goods-number">
                    x1
                </div>
            <div class="goods-repair">
	       <a href="" target="_blank" clstag="click|keycount|orderinfo|order_repair">申请售后</a>
	                    	                </div>
                                <div class="clr"></div>
            </td>

                        <td rowspan="1">
                <div class="consignee tooltip">
                    <span class="txt">恬妞</span><b></b>
                    	                   
	      <div class="p-arrow p-arrow-left"></div>
	                    </div>
                                    </div>
                            </td>
            <td rowspan="1">
                <div class="amount">
                	<span>总额 &yen;1990</span> <br>
                	   <span class="ftx-13">在线支付</span>
                                    </div>
            </td>
            <td rowspan="1">
                <div class="status" >
                    <span class="order-status">
                                            
            	已完成
            
             </span>
                    <br>
                    
             <!-- <a href="" clstag='click|keycount|orderlist|dingdanxiangqing' target="_blank">订单详情</a> -->
                                    </div>
            </td>
            <!-- <td rowspan="1" id="operate78637762351"> -->
                <div class="operate">

                    
                    
               <div id="pay-button-78637762351" _baina="0"></div>
                    
                    
					
					
                </div>
            </td>
                    </tr>
                
            </tbody>
                      </table>

						 <div class="mt20">
                            <div class="pagin fr">
                     <!--  <span class="text">共1条记录</span>    <span class="text">共1页</span> -->
                <span class="prev-disabled">上一页<b></b></span>
       
		<!-- <span class="prev-disabled">首页</span> -->
                        <a class="current">1</a>       	<!-- <span class="next-disabled">末页</span>  -->
    <span class="next-disabled">下一页<b></b></span>
            
                                </div>
                            <div class="clr"></div>
                        </div>
                        
                        
                    </div>
                </div>
<!--service end-->

 <!--footer start-->

	  </body>
</html>