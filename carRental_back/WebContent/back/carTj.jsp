<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
List<Map<String,Object>> markList = (List<Map<String,Object>>)request.getAttribute("markList");
List<Map<String,Object>> typeList = (List<Map<String,Object>>)request.getAttribute("typeList");
%>
<html>
<head>
<link href="<%=request.getContextPath() %>/back/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/back/css/style.css"/>       
<link href="<%=request.getContextPath() %>/back/assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/back/assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/back/assets/css/font-awesome.min.css" />
      
<script src="<%=request.getContextPath() %>/back/js/jquery-1.9.1.min.js"></script>
<script src="<%=request.getContextPath() %>/back/assets/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/back/assets/js/typeahead-bs2.min.js"></script>           	
<script src="<%=request.getContextPath() %>/back/assets/layer/layer.js" type="text/javascript" ></script>          
<script src="<%=request.getContextPath() %>/back/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="<%=request.getContextPath() %>/back/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=request.getContextPath() %>/back/assets/js/ace-elements.min.js"></script>
<script src="<%=request.getContextPath() %>/back/assets/js/ace.min.js"></script>
<title>系统设置</title>

</head>

<body>
<div class="margin clearfix">
 <div class="stystems_style">
  <div class="tabbable">
	<ul class="nav nav-tabs" id="myTab">
	  <li class="active"><a data-toggle="tab" href="#tongji1" onclick="tj1()">汽车状态统计</a></li>
      <li class=""><a data-toggle="tab" href="#tongji2" >日租价统计</a></li>
      <li class=""><a data-toggle="tab" href="#tongji3" >汽车品牌统计</a></li>
	  <li class=""><a data-toggle="tab" href="#tongji4" >汽车类型统计</a></li>
	</ul>
	
    <div class="tab-content">
		<div id="tongji1" class="tab-pane active">
			<div id="tj1" style="position:absolute; left:150px;top:65px;"></div>
        </div>
        <div id="tongji2" class="tab-pane ">
        	<div id="tj2" style="position:absolute; left:150px;top:65px;"></div>
        </div>
        <div id="tongji3" class="tab-pane">
         	<div id="tj3" style="position:absolute; left:150px;top:65px;"></div>
		</div>
		<div id="tongji4" class="tab-pane">
		    <div id="tj4" style="position:absolute; left:150px;top:65px;"></div>
	    </div>
		</div>
		</div>
 </div>
</div>
</body>
</html>
<script type="text/javascript" src="<%=request.getContextPath() %>/back/js/tjJS/jscharts.js"></script>
<script type="text/javascript">
$(function(){
	tj1();
	tj2();
	tj3();
	tj4();
});
function tj1() {
	var myData = new Array(['可租用',<%=request.getAttribute("car0")%>], 
			['已预约',<%=request.getAttribute("car1")%>], 
			['已租出',<%=request.getAttribute("car2")%>]);
	var colors = ['#0673B8', '#0091F1', '#F85900'];
	var myChart = new JSChart('tj1', 'pie');
	myChart.setDataArray(myData);
	myChart.colorizePie(colors);
	myChart.setTitle('汽车状态统计');
	myChart.setTitleColor('#0066CC');
	myChart.setTitleFontSize(16);
	myChart.setTextPaddingTop(280);
	myChart.setPieValuesDecimals(1);
	myChart.setPieUnitsFontSize(9);
	myChart.setPieValuesFontSize(8);
	myChart.setPieValuesColor('#fff');
	myChart.setPieUnitsColor('#969696');
	myChart.setSize(616, 321);
	myChart.setPiePosition(308, 145);
	myChart.setPieRadius(95);
	myChart.setFlagColor('#fff');
	myChart.setFlagRadius(4);
	myChart.setBackgroundImage('<%=request.getContextPath() %>/back/images/chart_bg.jpg');
	myChart.draw();
}
function tj2() {
	var myData = new Array(['<80',<%=request.getAttribute("num0") %>],
			['80-110',<%=request.getAttribute("num1") %>],
			['110-140',<%=request.getAttribute("num2") %>],
			['140-170',<%=request.getAttribute("num3") %> ],
			['>170',<%=request.getAttribute("num4") %>]);
	
	var colors = ['#AF0202', '#EC7A00', '#FCD200', '#81C714','#0099CC'];
	var myChart = new JSChart('tj2', 'bar');
	myChart.setDataArray(myData);
	myChart.colorizeBars(colors);
	myChart.setTitle('汽车日租价统计');
	myChart.setTitleColor('#009966');
	myChart.setAxisNameX('日租价（元）');
	myChart.setAxisNameY('车辆数目');
	myChart.setAxisColor('#009966');
	myChart.setAxisNameFontSize(16);
	myChart.setAxisNameColor('#999');
	myChart.setAxisValuesColor('#7E7E7E');
	myChart.setBarValuesColor('#7E7E7E');
	myChart.setAxisPaddingTop(60);
	myChart.setAxisPaddingRight(140);
	myChart.setAxisPaddingLeft(150);
	myChart.setAxisPaddingBottom(50);
	myChart.setTextPaddingLeft(105);
	myChart.setTitleFontSize(11);
	myChart.setBarBorderWidth(1);
	myChart.setBarBorderColor('#009966');
	myChart.setBarSpacingRatio(50);
	myChart.setGrid(false);
	myChart.setSize(616, 321);
	myChart.setBackgroundImage('<%=request.getContextPath()%>/back/images/chart_bg.jpg');
	myChart.draw();
}
function tj3() {
	var data = [];
    <%
    for(int i = 0; i < markList.size(); i++){
    	%>
    	var element = new Array();
        element.push('<%=markList.get(i).get("b_name").toString()%>');
        element.push(<%=markList.get(i).get("num")%>);
        data.push(element);
       <%
    }
    %>
    
	var colors = new Array();
	<%
	for(int i=0; i <markList.size(); i++){
		%>
		colors[ <%=i%>]= '#3366CC'; 
		<%
	} 
	%>
	
	var myChart = new JSChart('tj3', 'bar');
	myChart.setDataArray(data);
	myChart.colorizeBars(colors);
	myChart.setTitle('汽车各品牌统计');
	myChart.setTitleColor('#8E8E8E');
	myChart.setAxisNameX('汽车品牌');
	myChart.setAxisNameY('汽车数量');
	myChart.setAxisColor('#C4C4C4');
	myChart.setAxisNameFontSize(16);
	myChart.setAxisNameColor('#999');
	myChart.setAxisValuesColor('#7E7E7E');
	myChart.setBarValuesColor('#7E7E7E');
	myChart.setAxisPaddingTop(60);
	myChart.setAxisPaddingRight(140);
	myChart.setAxisPaddingLeft(150);
	myChart.setAxisPaddingBottom(50);
	myChart.setTextPaddingLeft(105);
	myChart.setTitleFontSize(11);
	myChart.setBarBorderWidth(1);
	myChart.setBarBorderColor('#C4C4C4');
	myChart.setBarSpacingRatio(50);
	myChart.setGrid(false);
	myChart.setSize(616, 321);
	myChart.setBackgroundImage('<%=request.getContextPath() %>/back/images/chart_bg.jpg');
	myChart.draw();
}
function tj4() {
	var data = [];
    
    <%
    for(int i = 0; i < typeList.size(); i++){
    	%>
    	var element = new Array();
        element.push('<%=typeList.get(i).get("t_type").toString()%>');
        element.push(<%=typeList.get(i).get("num")%>);
        data.push(element);
       <%
    }
    %>
    
	var colors = new Array();
	<%
	for(int i=0; i <typeList.size(); i++){
		%>
		colors[ <%=i%>]= '#EC7A00'; 
		<%
	} 
	%>
	var myChart = new JSChart('tj4', 'bar');
	myChart.setDataArray(data);
	myChart.colorizeBars(colors);
	myChart.setTitle('汽车类型统计');
	myChart.setTitleColor('#8E8E8E');
	myChart.setAxisNameX('汽车类型');
	myChart.setAxisNameY('汽车数量');
	myChart.setAxisColor('#C4C4C4');
	myChart.setAxisNameFontSize(16);
	myChart.setAxisNameColor('#999');
	myChart.setAxisValuesColor('#7E7E7E');
	myChart.setBarValuesColor('#7E7E7E');
	myChart.setAxisPaddingTop(60);
	myChart.setAxisPaddingRight(140);
	myChart.setAxisPaddingLeft(150);
	myChart.setAxisPaddingBottom(50);
	myChart.setTextPaddingLeft(105);
	myChart.setTitleFontSize(11);
	myChart.setBarBorderWidth(1);
	myChart.setBarBorderColor('#C4C4C4');
	myChart.setBarSpacingRatio(50);
	myChart.setGrid(false);
	myChart.setSize(616, 321);
	myChart.setBackgroundImage('<%=request.getContextPath() %>/back/images/chart_bg.jpg');
	myChart.draw();
}

</script>
