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
<script type="text/javascript">
	function findCar() {
		var img =  $("#img_1_in").val();
		if(null==img || ""==img){
			alert("请插入图片！");
			return;
		}else{
			 $("#form1").submit();
		}
	}
</script>
<body>
	<div class="page-content clearfix">
		<div id="brand_style">
			<div class="search_style">
				<div class="title_names">添加图片</div>
				<form id="form1" action="<%=request.getContextPath() %>/queryCarByImgServlet" method="post"  enctype="multipart/form-data">
				<ul class="search_content clearfix">
				 	<li><span id="Pimg" style="red;"></span></li>
					<li>
						<div class="logobox" style="height: 200px;width: 220px; margin:15px;border: solid 1px #CCCCFF;position: relative;float: left;">
						<img style="padding: 5px 17px;height: 190px;width: 210px;" id="img_1" alt="图片暂时无法加载" src="<%=request.getContextPath()%>/back/images/image.png">
						<input style="opacity: 0;-ms-filter: 'alpha(opacity=0)';" type="file" name="img" id="img_1_in" onchange="PreviewImage1(this,'img_1')"/>
					</div>
					</li>
					<li style="width: 90px;">
						<button style="position:absolute; bottom :50px;" type="button" class="btn_search" onclick="findCar()">
							<i class="icon-search"></i>查询
						</button>
					</li>
					
					<li>
						<h2>用法：</h2>
						<p>1.在插入一张汽车图片，点击查询。</p>
						<p>2.在下面会显示与你插入汽车图片相似的结果。</p>
					</li>
				</ul>
				</form>
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