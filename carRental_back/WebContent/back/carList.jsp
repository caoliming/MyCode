<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%
  List<Map<String,Object>> car = (List<Map<String,Object>>)request.getAttribute("allCar");
%>
<html>
<link href="<%=request.getContextPath()%>/back/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/back/css/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/back/assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/back/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/back/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link href="<%=request.getContextPath()%>/back/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />	
<script src="<%=request.getContextPath()%>/back/js/jquery-1.9.1.min.js"></script>
<script src="<%=request.getContextPath()%>/back/assets/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/back/assets/js/typeahead-bs2.min.js"></script>
<!-- page specific plugin scripts -->
<script src="<%=request.getContextPath()%>/back/assets/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/back/assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/back/js/H-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/back/js/H-ui.admin.js"></script>
<script src="<%=request.getContextPath()%>/back/assets/layer/layer.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/back/assets/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/back/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script src="<%=request.getContextPath()%>/back/js/lrtk.js" type="text/javascript"></script>

<!-- 判断条件并查询 -->
<script type="text/javascript">
	function queryCar(){
		var code = $("#code").val();
		if((""==code||null==code)){
			alert("请输入汽车车牌号！");
			return;
		}else{
			/* alert(code); */
			
			window.location.href = "<%=request.getContextPath() %>/queryCarServlet?method=getOneCarInfo&code="+code;
		}
	}
</script>
<title>汽车列表</title>
</head>
<body>
	<div class=" page-content clearfix">
		<div id="products_style">
			<div class="search_style">
				<div class="title_names">汽车查询</div>
				<ul class="search_content clearfix">
					<li>
						<!-- 跳转到查询汽车类型和品牌的servlet，获取到所有的类型和品牌后请求转发到 /back/car_add.jsp页面，遍历出类型和品牌-->
						<a href="<%=request.getContextPath()%>/queryTypeAndMarkServlet" title="ADD CAR！" class="btn btn-warning Order_form">
						<i class="icon-plus"></i>添加汽车信息</a>
					</li> 
					<li>
						<!-- 跳转到图片查询界面-->
						<a href="<%=request.getContextPath()%>/back/findImg.jsp" title="QUERY CAR BY CAR_IMAGE！" class="btn btn-warning Order_form">
						<i class="icon-search"></i>图片查询</a>
					</li> 
					
					<li><label class="l_f">汽车车牌</label>
					<input id="code" type="text" class="text_add" placeholder="请输入要查询的车号" style="width: 200px" /></li>
					
					<li style="width: 90px;">
					<button type="button" class="btn_search" onclick="queryCar()"> 
						<i class="icon-search"></i>查询
					</button>
					</li>
					<li> <span>共：<b style="font-size: 1.3em;color:red;"><%=car.size() %></b></span>辆汽车</li>
						
				</ul>
			</div>

		</div>
	</div>

	<!-- 显示汽车的table -->
	<div style="margin-left: 15px;margin-right: 15;" >
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th width="150px">车号</th>
					<th width="300px">汽车类型</th>
					<th width="300px">汽车品牌</th>
					<th width="300px">汽车简介</th>
					<th width="200px">购车日期</th>
					<th width="200px">日租价</th>
					<th width="200px">当前状态</th>
					<th width="180px">操作</th>
				</tr>
			</thead>
			<tbody>
				<%
				for(Map<String,Object> c : car){
					%>
					<tr>
						<td style="font-size: 1.1em;font-family: 楷体;color:#333399" width="150px"><%=c.getOrDefault("b_code", "") %></td>
						<td style="font-size: 1.2em;font-family: 楷体;color:#333399" width="300px"><%=c.getOrDefault("t_type", "") %></td>
						<td style="font-size: 1.2em;font-family: 楷体;color:#333399" width="300px"><%=c.getOrDefault("b_name", "") %> </td>
						<td style="font-size: 1.1em;font-family: 楷体;color:#333399" width="300px"><%=c.getOrDefault("b_introduce", "") %></td>
						<td style="font-size: 1.0em;font-family: 楷体;color:#333399" width="200px"><%=c.getOrDefault("b_buydate", "") %> </td>
						<td style="font-size: 1.3em;font-family: 楷体;color:#CC0033" width="200px">￥<%=c.getOrDefault("b_price", "") %> </td>
						<td width="200px">
						    <%
						    	if("Y".equals(c.getOrDefault("state", "").toString())){
						    		%>
						    		<a class="btn btn-xs btn-success">可租用</a> 
						    		<%
						    	}else if("N".equals(c.getOrDefault("state", "").toString())){
						    		%>
						    		<a class="btn btn-xs btn-info" >已租出</a>
						    		<%
						    	}else{
						    		%>
						    		<a class="btn btn-xs btn-warning" >已预约</a>
						    		<%
						    	}
						    %>
					        
						</td>
						<td width="180px">
							<a class="icon-search" href="<%=request.getContextPath()%>/queryCarServlet?method=getOneCar&code=<%=c.getOrDefault("b_code", "")%>">查询详情</a>
						</td>
					</tr>
					<%
				}
				%>
				
				
				
				
			</tbody>
		</table>
	</div>
</body>
</html>
<script>
	jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable({
			"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
			"bStateSave" : true,//状态保存
			"aoColumnDefs" : [
			//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			{
				"orderable" : false,
				"aTargets" : [ 0, 2, 3, 4, 5, 8, 9 ]
			} // 制定列不参与排序
			]
		});
		function tooltip_placement(context, source) {
			var $source = $(source);
			var $parent = $source.closest('table')
			var off1 = $parent.offset();
			var w1 = $parent.width();

			var off2 = $source.offset();
			var w2 = $source.width();

			if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2))
				return 'right';
			return 'left';
		}
	});
	laydate({
		elem : '#start',
		event : 'focus'
	});
	$(function() {
		$("#products_style").fix({
			float : 'left',
			//minStatue : true,
			skin : 'green',
			durationTime : false,
			spacingw : 30,//设置隐藏时的距离
			spacingh : 260,//设置显示时间距
		});
	});
</script>
<script type="text/javascript">
	//初始化宽度、高度  
	$(".widget-box").height($(window).height() - 215);
	$(".table_menu_list").width($(window).width() - 260);
	$(".table_menu_list").height($(window).height() - 215);
	//当文档窗口发生改变时 触发  
	$(window).resize(function() {
		$(".widget-box").height($(window).height() - 215);
		$(".table_menu_list").width($(window).width() - 260);
		$(".table_menu_list").height($(window).height() - 215);
	})

	
	/*产品-停用*/
	function member_stop(obj, id) {
		layer
				.confirm(
						'确认要停用吗？',
						function(index) {
							$(obj)
									.parents("tr")
									.find(".td-manage")
									.prepend(
											'<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
							$(obj)
									.parents("tr")
									.find(".td-status")
									.html(
											'<span class="label label-defaunt radius">已停用</span>');
							$(obj).remove();
							layer.msg('已停用!', {
								icon : 5,
								time : 1000
							});
						});
	}

	/*产品-启用*/
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
	/*产品-编辑*/
	function member_edit(title, url, id, w, h) {
		layer_show(title, url, w, h);
	}

	/*产品-删除*/
	function member_del(obj, id) {
		layer.confirm('确认要删除吗？', function(index) {
			$(obj).parents("tr").remove();
			layer.msg('已删除!', {
				icon : 1,
				time : 1000
			});
		});
	}
	
</script>

