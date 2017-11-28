<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
  List<Map<String,Object>> type = (List<Map<String,Object>>)request.getAttribute("allType");
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
<title>类型管理</title>
</head>
<script type="text/javascript">
	function findType() {
		var info =  document.getElementById("info").value;
		if(null==info || ""==info){
			alert("请输入类型后查询！");
		}else{
			 window.location.href = "<%=request.getContextPath() %>/queryTypeServlet?method=getOneType&type="+info;
		}
	}
</script>
<body>
	<div class="page-content clearfix">
		<div id="brand_style">
			<div class="search_style">
				<div class="title_names">添加/查询类型</div>
				<ul class="search_content clearfix">
					<li><a href="<%=request.getContextPath()%>/back/addType.jsp"
						title="添加类型" class="btn btn-warning Order_form"><i
							class="icon-plus"></i>添加类型</a></li>
					<li>
						<label class="l_f">类型名称</label>
						<input id="info" type="text" class="text_add" placeholder="输入类型名称" style="width: 250px" />
					</li>
					<li style="width: 90px;">
						<button type="button" class="btn_search" onclick="findType()">
							<i class="icon-search"></i>查询
						</button>
					</li>
					<li><span class="r_f" >共：<b style="color:red;font-size: 1.3em;"><%=type.size() %></b>个类型
					</span></li>
				</ul>
			</div>
			<!--品牌展示-->
			<div class="brand_list clearfix" id="category">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th width="50px">类型编号</th>
							<th width="100px">类型名称</th>
							<th width="100px">类型图片</th>
							<th width="100px">类型简介</th>
							<th width="100px">添加日期</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Map<String,Object> t : type) {
						%>

						<tr>
							<td width="50px"><%=t.getOrDefault("t_id", "") %></td>
							<td style="color:#0066CC;font-family: 仿宋;font-weight: bold;" width="100px"><%=t.getOrDefault("t_type", "") %></td>
							<td width="100px">
								<img style="width: 159px;height: 96px;" alt="图片不见了..." src="/car_img/<%=t.getOrDefault("t_img", "") %>">  
							</td>
							<td style="color:#003399;font-family: 楷体;" width="100px"><%=t.getOrDefault("t_introduce", "") %></td>
							<td style="color:#333399;font-family: 宋体;" width="100px"><%=t.getOrDefault("t_date", "") %></td>
						</tr>

						<%
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
	/*品牌-编辑*/
	function member_edit(title, url, id, w, h) {
		layer_show(title, url, w, h);
	}

	/*品牌-删除*/
	function member_del(obj, id) {
		layer.confirm('确认要删除吗？', function(index) {
			$(obj).parents("tr").remove();
			layer.msg('已删除!', {
				icon : 1,
				time : 1000
			});
		});
	}
	laydate({
		elem : '#start',
		event : 'focus'
	});
</script>