<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.js"></script>
<link href="${pageContext.request.contextPath }/static/css/basic_layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/static/css/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/commonAll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/artDialog.js?skin=default"></script>
<title>房源管理系统</title>

<style>
	.alt td{ background:black !important;}
</style>
</head>
<body>
	<form id="submitForm" name="submitForm" action="" method="post">
		<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
		<input type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName"/>
		<div id="container">
			<div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top"><a href="${pageContext.request.contextPath }/admin/touserIndex?pageNum=1">用户管理</a></div>
						<div id="box_center">
							房源
							<select name="fangyuanEntity.fyStatus" id="fyStatus" class="ui_select01">
                                <option value="">--请选择--</option>
                                <option value="26">已审核</option>
                                <option value="25">未审核</option>
                            </select>
						</div>
					</div>
				</div>
			</div>
			<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th width="30"><input type="checkbox" id="all" onclick="selectOrClearAllCheckbox(this);" />
							</th>
							<th>房主</th>
							<th>房源</th>
							<th>房源面积</th>
							<th>户型</th>
							<th>状态</th>
							<th>发布时间</th>
							<th>操作</th>
						</tr>
						<c:forEach var="house" items="${page.list }" varStatus="status">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="14458579642011" class="acb" /></td>
								<td>${house.master.account }</td>
								<td>${house.positionProvince }.${house.positionCity }</td>
								<td>${house.area }m2</td>
								<td>${house.houseType }</td>
								<td>${house.houseState=='1'?"待审核":house.houseState=='2'?"在售":"已售" }</td>
								<td>${house.creatTime }</td>
								<td>
									<c:if test="${house.houseState=='1' }">
										<a href="${pageContext.request.contextPath }/admin/adminpast?id=${house.id}&pageNum=${page.pageNum}">通过审核</a>
									</c:if>
									<a href="${pageContext.request.contextPath }/admin/deletehouse?id=${house.id}&pageNum=${page.pageNum}">删除</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- <div class="ui_tb_h30">
					<div class="ui_flt" style="height: 30px; line-height: 30px;">
						共有
						<span class="ui_txt_bold04">90</span>
						条记录，当前第
						<span class="ui_txt_bold04">1
						/
						9</span>
						页
					</div>
					<div class="ui_frt">
						   如果是第一页，则只显示下一页、尾页
						
							<input type="button" value="首页" class="ui_input_btn01" />
							<input type="button" value="上一页" class="ui_input_btn01" />
							<input type="button" value="下一页" class="ui_input_btn01"
								onclick="jumpNormalPage(2);" />
							<input type="button" value="尾页" class="ui_input_btn01"
								onclick="jumpNormalPage(9);" />
						
						
						
						    如果是最后一页，则只显示首页、上一页
						
						转到第<input type="text" id="jumpNumTxt" class="ui_input_txt01" />页
							 <input type="button" class="ui_input_btn01" value="跳转" onclick="jumpInputPage(9);" />
					</div> -->
					<div>
							<c:if test="${page.totalPage ==1 }">
								<p>1</p>
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
											<a href="${pageContext.request.contextPath}/admin/touserIndex?pageNum=${i}">${i}</a>
										</c:if>
									</c:forEach>
									<a href="${pageContext.request.contextPath}/admin/touserIndex?pageNum=${page.pageNum+1}" class="next">下一页<i class="fa fa-angle-right"></i></a> 
								</c:if>
								<!-- 如果当前页就不是最后一页也不是第一页就有上下页 -->
								<c:if test="${page.pageNum >1 && page.pageNum < page.totalPage}">
									<a href="${pageContext.request.contextPath}/admin/touserIndex?pageNum=${page.pageNum-1}" class="prev"><i class="fa fa-angle-left"></i>上一页</a>
									<c:forEach begin="${page.start }" end="${page.end }" step="1" var="i">
										<c:if test="${page.pageNum == i }">
											<span>${i}</span>
										</c:if>
										<c:if test="${page.pageNum != i }">
											<a href="${pageContext.request.contextPath}/admin/touserIndex?pageNum=${i}">${i}</a>
										</c:if>
									</c:forEach>
									<a href="${pageContext.request.contextPath}/admin/touserIndex?pageNum=${page.pageNum+1}" class="next">下一页<i class="fa fa-angle-right"></i></a> 
								</c:if>
								<!-- 如果是最后一页只有上一页 -->
								<c:if test="${page.pageNum == page.totalPage}">
									<a href="${pageContext.request.contextPath}/admin/touserIndex?pageNum=${page.pageNum-1}" class="prev"><i class="fa fa-angle-left"></i>上一页</a>
									<c:forEach begin="${page.start }" end="${page.end }" step="1" var="i">
										<c:if test="${page.pageNum == i }">
											<span>${i}</span>
										</c:if>
										<c:if test="${page.pageNum != i }">
											<a href="${pageContext.request.contextPath}/admin/touserIndex?pageNum=${i}">${i}</a>
										</c:if>
									</c:forEach>
								</c:if>
							</c:if>
						</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>
