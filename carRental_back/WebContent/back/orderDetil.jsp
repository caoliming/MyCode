<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
Map<String,Object> order = (Map<String,Object>)request.getAttribute("order");
%>
<html>
<head>
 <link href="<%=request.getContextPath() %>/back/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/css/style.css"/>       
        <link href="<%=request.getContextPath() %>/back/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/assets/css/ace.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/font/css/font-awesome.min.css" />
		<script src="<%=request.getContextPath() %>/back/js/jquery-1.9.1.min.js"></script>
        <script src="<%=request.getContextPath() %>/back/assets/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath() %>/back/assets/js/typeahead-bs2.min.js"></script> 
        <script type="text/javascript" src="<%=request.getContextPath() %>/back/js/H-ui.js"></script>      	
		<script src="<%=request.getContextPath() %>/back/assets/js/jquery.dataTables.min.js"></script>
		<script src="<%=request.getContextPath() %>/back/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="<%=request.getContextPath() %>/back/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="<%=request.getContextPath() %>/back/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/back/assets/js/jquery.easy-pie-chart.min.js"></script>
        <script src="<%=request.getContextPath() %>/back/js/lrtk.js" type="text/javascript" ></script>
<title>订单详细</title>
 <style type="text/css">
    	.img img{  
                cursor: pointer;  
                transition: all 1.2s;  
        }  
        .img img:hover{  
            transform: scale(1.6);  
        }  
    </style>
</head>
<body>
<div class="margin clearfix">
<div class="Order_Details_style">
<div class="Numbering">订单编号:<b><%=order.getOrDefault("o_code", "") %></b></div>
</div>
 <div class="detailed_style">
 <!--收件人信息-->
    <div class="Receiver_style">
     <div class="title_name">用户信息</div>
     <div class="Info_style clearfix">
        <div class="col-xs-4" style="float:left;">  
         <div class="o_content">
         	<img style="width:120px;height:150px;border:1px solid blue;border-radius:5px;margin-left:30px;" alt="不见了..." src="/car_img/<%=order.getOrDefault("u_img", "") %>">
         </div>
        </div>
        <div style="position:relative;float:left;margin-left:15px;margin-top: 20px;left:-180px;">
	         <label> 用户姓名： </label> <%=order.getOrDefault("u_name", "") %> <br><br>
	         <label> 身份证号： </label> <%=order.getOrDefault("u_card", "") %> <br><br>
	         <label> 驾驶证号： </label> <%=order.getOrDefault("u_jscard", "") %> <br><br>
        </div>
        <div style="position:relative;float:left;margin-left:15px;margin-top: 20px;left:-160px;">
	         <label> 用户性别： </label> <%=order.getOrDefault("u_sex", "") %> <br><br>
	         <label> 用户年龄： </label> <%=order.getOrDefault("u_age", "") %> <br><br>
	         <label> 电话号码： </label> <%=order.getOrDefault("u_phone", "") %> <br><br>
        </div>
        <div style="position:relative;float:left;margin-left:15px;margin-top: 20px;left:-140px;">
	         <label> 家庭住址： </label> <%=order.getOrDefault("u_address", "") %> <br><br>
	         <label> 注册日期： </label> <%=order.getOrDefault("u_date", "") %> <br><br>
        </div>
     </div>
    </div>
    
    <!--订单信息-->
    <div class="product_style">
    <div class="title_name">汽车图片</div>
    <div class="Info_style clearfix">
      <div id="demo" style="overflow: hidden; width: 1090px; ">
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
											<td class="img">
												<img style="margin: 10px;height:200px;width: 300px;" src="/car_img/<%=order.getOrDefault("img"+i,"") %>" />
											</td>
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
    <!--总价-->
    <div class="Total_style">
     <div class="Info_style clearfix">
      <div class="col-xs-4">  
         <label class="label_name" for="form-field-2"> 支付方式： </label>
         <div class="o_content">在线支付</div>
        </div>
        <div class="col-xs-4">  
         <label class="label_name" for="form-field-2"> ￥35保险： </label>
         <div class="o_content" style="color:blue;font-weight:900;"><%=order.getOrDefault("o_bx", "") %></div>
        </div>
        <div class="col-xs-4">  
         <label class="label_name" for="form-field-2"> 支付状态： </label>
         <div class="o_content" style="color:blue;font-weight:900;"><%=order.getOrDefault("o_state", "") %></div>
        </div>
        <div class="col-xs-4">  
         <label class="label_name" for="form-field-2"> 提车店铺： </label>
         <div class="o_content"><%=order.getOrDefault("d_pname", "") %></div>
        </div>
        <div class="col-xs-4">  
         <label class="label_name" for="form-field-2"> 提车日期： </label>
         <div class="o_content"><%=order.getOrDefault("start_date", "") %></div>
        </div>
        <div class="col-xs-4">  
         <label class="label_name" for="form-field-2"> 还车日期： </label>
         <div class="o_content"><%=order.getOrDefault("end_date", "") %></div>
        </div>
        </div>
      <div class="Total_m_style">
	      <span style="margin-left:45px;" class="Total">总天数：<b><%=order.getOrDefault("days", "") %></b>天</span>
	      <span style="margin-left:254px;" class="Total_price">日租价：<b><%=order.getOrDefault("b_price", "") %></b>元</span>
	      <span style="margin-left:230px;" class="Total_price">总金额：<b><%=order.getOrDefault("allMoney", "") %></b>元</span>
      </div>
    </div>
</div>
</body>
</html>
