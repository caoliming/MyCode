<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.net.*" %>
<%@ page import="java.util.*" %>
<%
Map<String,Object> systemSet = (Map<String,Object>)application.getAttribute("SystemSet");
String strIndex = (String)application.getAttribute("strIndex");
String []str = strIndex.split("-");
%>
<html>
<head>
<link href="<%=request.getContextPath() %>/back/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/back/css/style.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/back/assets/css/font-awesome.min.css" />
<link href="<%=request.getContextPath() %>/back/assets/css/codemirror.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/back/assets/js/jquery.min.js"></script> 
<script src="<%=request.getContextPath() %>/back/assets/dist/echarts.js"></script>
<script src="<%=request.getContextPath() %>/back/assets/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/back/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<!-- 获取时间和电脑IP地址 -->   
<script type="text/javascript">
$(function() {
	var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
	$("#currentTime").html(currentdate);
});
</script>
      
<title>首页</title>
</head>
<body  style="margin: 0px;">
<div class="page-content clearfix">
 <div class="alert alert-block alert-success">
  <button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
  <i class="icon-ok green"></i>
           欢迎使用<strong class="green">汽车租赁管理系统
          <small>(v1.0)</small>
          </strong>,你本次登陆时间为:<b style="color:green;" id="currentTime"></b>
        	  ，登录IP:<b style="color:red;"><%=InetAddress.getLocalHost().getHostAddress()%></b>，
        	  登录机名:<b style="color:blue;"><%=InetAddress.getLocalHost().getHostName() %></b>.	
 </div>
             <!--实时交易记录-->
             <div class="clearfix">
             <div class="t_Record">
               <div id="main" style="height:310px;width: 965px;" >
					<div style="float: left;">
						<video id="videoPlay" controls="controls"
						style="border: 5px solid #ccc;border-radius:10px ;height: 300px; width: 450px;"
						src="/car_img/<%=systemSet.getOrDefault("s_video", "").toString()%>"></video>
					</div>
					<div id="flashcontent" style="margin-left:5px; float: left;border: 5px solid #ccc;border-radius:10px ;">
					</div>
               </div>     
             </div> 
 
 <script type="text/javascript" src="<%=request.getContextPath() %>/back/wnl/index/swfobject.js"></script> 
 <script type="text/javascript"> 
 var so = new SWFObject("<%=request.getContextPath() %>/back/wnl/index/PWViewer.swf", "sotester", "500px", "290px", "9.0.0", "#FFFFFF"); 
 so.addParam("allowNetworking", "all"); 
 so.addParam("allowScriptAccess", "always"); 
 so.addParam("allowFullScreen", "true"); 
 so.addParam("scale", "noscale"); 
 so.addVariable("configFileSize", "1.440"); 
 so.addVariable("zipResSize", "0.000"); 
 so.addVariable("sceneFilesSize", "553.258"); 
 so.addVariable("base", "car/"); 
 so.addVariable("lwImg", "resources/waiting.gif"); 
 so.addVariable("lwBgColor", "255,255,255,255"); 
 so.addVariable("lwBarBgColor", "255,45,91,141"); 
 so.addVariable("lwBarColor", "255,130,170,215"); 
 so.addVariable("lwBarBounds", "0,0,0,0"); 
 so.addVariable("lwShowLoadingPercent", "false"); 
 so.addVariable("iniFile", "config_car.bin"); 
 so.addVariable("progressType", "0"); 
 so.addVariable("swfFile", ""); 
 so.addVariable("href", location.href); 
 so.write("flashcontent"); 
 </script>             
              
         <div class="news_style">
          <div class="title_name">系统提示</div>
          <ul class="list">
           <li><i class="icon-bell red"></i><a href="#">系统支持在线支付。</a></li>
           <li><i class="icon-bell red"></i><a href="#">你可以和用户实时聊天。</a></li>
           <li><i class="icon-bell red"></i><a href="#">支持打印报表功能。</a></li>
           <li><i class="icon-bell red"></i><a href="#">微信支付宝扫码支付。</a></li>
           <li><i class="icon-bell red"></i><a href="#">你可以关注系统公众号。</a></li>
          </ul>
         </div> 
         </div>
                 
 <div class="state-overview clearfix">
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol terques">
                             <i class="icon-user"></i>
                          </div>
                          <div class="value">
                              <h1><%=str[0] %></h1>
                              <p>用户数量</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol red">
                              <i class="icon-tags"></i>
                          </div>
                          <div class="value">
                              <h1><%=str[1] %></h1>
                              <p>会员积分</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol yellow">
                              <i class="icon-shopping-cart"></i>
                          </div>
                          <div class="value">
                              <h1><%=str[2] %></h1>
                              <p>订单数量</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol blue">
                              <i class="icon-bar-chart"></i>
                          </div>
                          <div class="value">
                              <h1><%=str[3] %></h1>
                              <p>交易记录</p>
                          </div>
                      </section>
                  </div>
              </div>
 

     </div>
</body>
</html>


