<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
  List<Map<String,Object>> allImg = (List<Map<String,Object>>)request.getAttribute("allImg"); 
%>
<html>
<head>
<link
	href="<%=request.getContextPath()%>/back/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/css/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/assets/css/ace.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/assets/css/font-awesome.min.css" />
<link href="<%=request.getContextPath()%>/back/Widget/icheck/icheck.css"
	rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/back/js/jquery-1.9.1.min.js"></script>
<script
	src="<%=request.getContextPath()%>/back/assets/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/back/assets/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->
<script
	src="<%=request.getContextPath()%>/back/assets/js/jquery.dataTables.min.js"></script>
<script
	src="<%=request.getContextPath()%>/back/assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/back/js/H-ui.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/back/js/H-ui.admin.js"></script>
<script src="<%=request.getContextPath()%>/back/assets/layer/layer.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/back/assets/laydate/laydate.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/back/assets/dist/echarts.js"></script>
<script src="<%=request.getContextPath()%>/back/js/lrtk.js"
	type="text/javascript"></script>
	<!-- 引入图片上传的js文件 -->
<script src="<%=request.getContextPath() %>/back/js/upload.js"></script>
<script src="<%=request.getContextPath() %>/back/js/jquery-1.7.2.min.js"></script>
	
<title>品牌管理</title>
</head>
<body>
	<div class="page-content clearfix">
		<div id="brand_style">
			<!--品牌展示-->
			<div class="brand_list clearfix" id="category">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th width="50px">品牌编号</th>
							<th width="100px">品牌图片</th>
							<th width="100px">品牌简介</th>
							<th width="100px">日租价</th>
							<th width="100px">添加日期</th>
							<th width="100px">查询详情</th>
						</tr>
					</thead>
					<tbody>
						<%
							if(allImg.size()==0){
								%>
								<h3 style="color:red;">数据库中还没有这样的汽车！<h3>
								<%
							}else{
								for (Map<String,Object> i : allImg) {
									%>

									<tr>
										<td width="50px"><%=i.getOrDefault("b_code", "") %></td>
										<td width="100px">
											<img style="height: 150px;width: 200px;" alt="图片不见了..." src="/car_img/<%=i.getOrDefault("img1", "") %>">  
										</td>
										<td style="color:#003399;font-family: 楷体;" width="100px"><%=i.getOrDefault("b_introduce", "") %></td>
										<td style="color:red;font-family: 楷体;" width="100px">￥:<%=i.getOrDefault("b_price", "") %></td>
										<td style="color:#003399;font-family: 楷体;" width="100px"><%=i.getOrDefault("b_buydate", "") %></td>
										<td style="color:#333399;font-family: 宋体;" width="100px">
											<a class="icon-search" href="<%=request.getContextPath()%>/queryCarServlet?method=getOneCar&code=<%=i.getOrDefault("b_code", "")%>">查询详情</a>
										</td>
									</tr>

									<%
										}
							}
						%>


					</tbody>
				</table>
			</div>
		</div>

	</div>
</body>
</html>

<script>
	//初始化宽度、高度  
	$(".chart_style").height($(window).height() - 215);
	$(".table_menu_list").height($(window).height() - 215);
	$(".table_menu_list ").width($(window).width() - 440);
	//当文档窗口发生改变时 触发  
	$(window).resize(function() {
		$(".chart_style").height($(window).height() - 215);
		$(".table_menu_list").height($(window).height() - 215);
		$(".table_menu_list").width($(window).width() - 440);
	});
	//图层隐藏限时参数		 
	$(function() {
		$("#category").fix({
			float : 'left',
			//minStatue : true,
			skin : 'green',
			durationTime : false,
			stylewidth : '400',
			spacingw : 30,//设置隐藏时的距离
			spacingh : 440,//设置显示时间距
		});
	});
	/*用户-启用*/
	function member_start(obj, id) {
		layer
				.confirm(
						'确认要启用吗？',
						function(index) {
							$(obj)
									.parents("tr")
									.find(".td-manage")
									.prepend(
											'<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
							$(obj)
									.parents("tr")
									.find(".td-status")
									.html(
											'<span class="label label-success radius">已启用</span>');
							$(obj).remove();
							layer.msg('已启用!', {
								icon : 6,
								time : 1000
							});
						});
	}
</script>