<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<%@ page import="java.util.*" %>
<%
List<Map<String,Object>> car = (List<Map<String,Object>>)request.getAttribute("car");
%>
<head>
<link
	href="<%=request.getContextPath()%>/back/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/css/style.css" />
<link
	href="<%=request.getContextPath()%>/back/assets/css/codemirror.css"
	rel="stylesheet">
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/back/assets/css/ace.min.css" /> --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/font/css/font-awesome.min.css" />

<script src="<%=request.getContextPath()%>/back/js/jquery-1.9.1.min.js"></script>
<script
	src="<%=request.getContextPath()%>/back/assets/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/back/assets/js/typeahead-bs2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/back/js/H-ui.js"></script>
<script
	src="<%=request.getContextPath()%>/back/assets/js/jquery.dataTables.min.js"></script>
<script
	src="<%=request.getContextPath()%>/back/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/back/assets/layer/layer.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/back/assets/laydate/laydate.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/back/assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="<%=request.getContextPath()%>/back/js/lrtk.js"
	type="text/javascript"></script>
<title>车的详情</title>
</head>

<body>
	<div class="margin clearfix">
		<div class="Order_Details_style">
			<div class="Numbering">
				<b><%=car.get(0).getOrDefault("b_code", "") %></b>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b style="color:#663366">特点：</b>
				<b style="color:#0066CC"><%=car.get(0).getOrDefault("b_introduce", "") %></b>
			</div>
			
		</div>
		<div class="detailed_style">
			<!--收件人信息-->
			<div class="Receiver_style">
				<div class="title_name">汽车参数</div>
				<div class="Info_style clearfix">
					<!-- 参数 -->
					<div style="width:150px;" class="col-xs-4">
						<div style="height: 140px;width: 150px;padding: 10px;" class="o_content">
							<img alt="图片不见了..." src="/car_img/<%=car.get(0).getOrDefault("b_img", "") %>">
						</div>
					</div>
					<div style="width:150px;" class="col-xs-4">
						<div style="height: 140px;width: 150px;padding: 10px;" class="o_content">
							<img alt="图片不见了..." src="/car_img/<%=car.get(0).getOrDefault("t_img", "")%>">
						</div>
					</div>
					
					<div style="width:190px;" class="col-xs-4">
						<br>
						<label class="label_name" for="form-field-2">品牌： </label>
						<div class="o_content"><%= car.get(0).getOrDefault("b_name", "")%></div>
						<br>
						<label class="label_name" for="form-field-2">类型： </label>
						<div class="o_content"><%= car.get(0).getOrDefault("t_type", "")%></div>
						<br>
						<label class="label_name" for="form-field-2"> 日租价： </label>
						<div style="color:red;" class="o_content">￥<%=car.get(0).getOrDefault("b_price", "")%></div>
						
					</div>
					
					<div style="width:200px;" class="col-xs-4">
						<br>
						<label class="label_name" for="form-field-2"> 购车日期： </label>
						<div class="o_content"><%=car.get(0).getOrDefault("b_buydate", "")%></div>
						<br>
						<label class="label_name" for="form-field-2"> 燃料类型： </label>
						<div class="o_content"><%=car.get(0).getOrDefault("b_ranliao", "")%></div>
						<br>
						<label class="label_name" for="form-field-2"> 变速类型： </label>
						<div class="o_content"><%=car.get(0).getOrDefault("b_biansu", "")%></div>
					</div>
					
					<div style="width:160px;" class="col-xs-4">
						<br>
						<label class="label_name" for="form-field-2"> 有无导航： </label>
						<div class="o_content"><%=car.get(0).getOrDefault("b_isdao", "")%></div>
						<br>
						<label class="label_name" for="form-field-2"> 有无天窗： </label>
						<div class="o_content"><%=car.get(0).getOrDefault("b_iswindow", "")%></div>
						<br>
						<label class="label_name" for="form-field-2"> 座椅材质： </label>
						<div class="o_content"><%=car.get(0).getOrDefault("b_zuoyi", "")%></div>
						
					</div>
					
					<div style="width:150px;" class="col-xs-4">
						<br>
						<label class="label_name" for="form-field-2"> 座位数： </label>
						<div class="o_content"><%=car.get(0).getOrDefault("b_zuowei", "")%></div>
						<br>
						<label class="label_name" for="form-field-2"> 车门数： </label>
						<div class="o_content"><%=car.get(0).getOrDefault("b_chemen", "")%></div>
						<br>
					</div>
					
					<!-- 参数 -->
				</div>
			</div>
			<!--图片信息-->
			<div class="product_style">
				<div class="title_name">汽车图片</div>
				<div class="brands-area">
					<div id="demo" style="overflow: hidden; width: 100%; height:300px;">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td valign="top" id="marquePic1">
									<!-- 要循环滚动的图片 -->
									<table width="100%" border="0" align="center" cellpadding="0"
										cellspacing="0">
										<tr align="center">
											<%
												for (int i = 1; i < 5; i++) {
											%>
											<td>
												<img style="padding:15px;width:400px;height: 300px;" 
											src="/car_img/<%=car.get(0).getOrDefault("img"+i,"") %>"></td>
											<%
												}
											%>
										</tr>
									</table>
								</td>
								<td id="marquePic2" width="1"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
<!-- 实现图片的滚动 -->
<script type="text/javascript">
	var speed = 85; //设置间隔时间
	marquePic2.innerHTML = marquePic1.innerHTML;
	var demo = document.getElementById("demo"); //获取demo对象
	function Marquee(n) { //实现图片循环滚动的方法
		if (marquePic1.offsetWidth - demo.scrollLeft <= 0) {
			demo.scrollLeft = 0;
		} else {
			demo.scrollLeft = demo.scrollLeft + n;
		}
	}
	var MyMar = setInterval("Marquee(5)", speed);
	demo.onmouseover = function() { //停止滚动
		clearInterval(MyMar);
	}
	demo.onmouseout = function() { //继续滚动
		MyMar = setInterval("Marquee(5)", speed);
	}
</script>
</html>
