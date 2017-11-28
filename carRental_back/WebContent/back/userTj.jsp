<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>   
<%
Map<String,Integer> userTjMap = (Map<String,Integer>)request.getAttribute("userTjMap");
%>
<html >
<head>
 <link href="<%=request.getContextPath() %>/back/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/css/style.css"/>       
        <link href="<%=request.getContextPath() %>/back/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/assets/css/ace.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/font/css/font-awesome.min.css" />
		<script src="<%=request.getContextPath() %>/back/js/jquery-1.9.1.min.js"></script>
		<script src="<%=request.getContextPath() %>/back/assets/js/typeahead-bs2.min.js"></script>   
        <script src="<%=request.getContextPath() %>/back/js/lrtk.js" type="text/javascript" ></script>		
		<script src="<%=request.getContextPath() %>/back/assets/js/jquery.dataTables.min.js"></script>
		<script src="<%=request.getContextPath() %>/back/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="<%=request.getContextPath() %>/back/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="<%=request.getContextPath() %>/back/assets/dist/echarts.js"></script>
      
<title>用户等级</title>
</head>

<body>
<div class="grading_style"> 
<div id="category">
    <div id="scrollsidebar" class="left_Treeview">
    <div class="show_btn" id="rightArrow"><span></span></div>
    <div class="widget-box side_content" >
    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
     <div class="side_list">
      <div class="widget-header header-color-green2">
          <h4 class="lighter smaller">用户等级</h4>
      </div>
      <div class="widget-body">
         <ul class="b_P_Sort_list">
             <li><i class="orange  fa fa-user-secret"></i><a href="#">全部(<%=userTjMap.getOrDefault("所有用户", 0) %>)</a></li>
             <li><i class="fa fa-diamond pink "></i> <a href="#">普通用户(<%=userTjMap.getOrDefault("普通用户", 0) %>)</a></li>
             <li> <i class="fa fa-diamond pink "></i> <a href="#">青铜用户(<%=userTjMap.getOrDefault("青铜用户", 0) %>)</a> </li>
             <li><i class="fa fa-diamond pink "></i> <a href="#">黄金用户(<%=userTjMap.getOrDefault("黄金用户", 0) %>)</a></li>
             <li> <i class="fa fa-diamond pink "></i> <a href="#">白金用户(<%=userTjMap.getOrDefault("白金用户", 0) %>)</a></li>
             <li><i class="fa fa-diamond pink "></i> <a href="#">钻石用户(<%=userTjMap.getOrDefault("钻石用户", 0) %>)</a></li>
            </ul>
  </div>
  </div>
  </div>  
  </div>
  <!--右侧样式-->
   <div class="page_right_style right_grading">
   <div class="Statistics_style" id="Statistic_pie">
     <div class="type_title">等级统计 
     <span class="top_show_btn Statistic_btn">显示</span> 
     <span class="Statistic_title Statistic_btn"><a title="隐藏" class="top_close_btn">隐藏</a></span>
     </div> 
      <div id="Statistics" class="Statistics"  style="position:absolute; left:135px;top:95px;"></div> 
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
});
function tj1() {
	var myData = new Array(['普通用户',<%=userTjMap.getOrDefault("普通用户", 0) %>], 
			['青铜用户',<%=userTjMap.getOrDefault("青铜用户", 0) %>], 
			['黄金用户',<%=userTjMap.getOrDefault("黄金用户", 0) %>],
			['白金用户',<%=userTjMap.getOrDefault("白金用户", 0) %>],
			['钻石用户',<%=userTjMap.getOrDefault("钻石用户", 0) %>]);
	var colors = ['#0673B8', '#0091F1', '#F85900','#CC0033','#009966'];
	var myChart = new JSChart('Statistics', 'pie');
	myChart.setDataArray(myData);
	myChart.colorizePie(colors);
	myChart.setTitle('用户等级统计');
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



$(function() { 
	$("#category").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:20,
		spacingh:240,
		set_scrollsidebar:'.right_grading',
	});
});
$(function() { 
	$("#Statistic_pie").fix({
		float : 'top',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:0,
		spacingh:0,
		close_btn:'.top_close_btn',
		show_btn:'.top_show_btn',
		side_list:'.Statistics',
		close_btn_width:80,
		side_title:'.Statistic_title',
	});
});
</script>
<script type="text/javascript">
//初始化宽度、高度  
 $(".widget-box").height($(window).height()); 
 $(".page_right_style").width($(window).width()-220);
 //$(".table_menu_list").width($(window).width()-240);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height());
	 $(".page_right_style").width($(window).width()-220);
	 //$(".table_menu_list").width($(window).width()-240);
	}) 

</script>
<script type="text/javascript">
$(function($) {
				var oTable1 = $('#sample-table').dataTable( {
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6,7,9]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			});
</script>