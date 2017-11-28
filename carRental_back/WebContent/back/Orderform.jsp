<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>   
<%
List<Map<String,Object>> order = (List<Map<String,Object>>)request.getAttribute("order");
Map<String,Integer> num = (Map<String,Integer>)request.getAttribute("num");
int all = (int)request.getAttribute("all");
int p1 = 100*num.get("已支付")/all ;
int p2 = 100*num.get("未支付")/all ;
int p3 = 100*num.get("已取消")/all ;
int p4 = 100*num.get("已提车")/all ;
int p5 = 100*num.get("已还车")/all ;
%> 
<html>
<head>
 <link href="<%=request.getContextPath() %>/back/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/css/style.css"/>       
        <link href="<%=request.getContextPath() %>/back/assets/css/codemirror.css" rel="stylesheet"/>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/assets/css/ace.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/font/css/font-awesome.min.css" />
		<script src="<%=request.getContextPath() %>/back/js/jquery-1.9.1.min.js"></script>
        <script src="<%=request.getContextPath() %>/back/assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/back/js/H-ui.js"></script>     
		<script src="<%=request.getContextPath() %>/back/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="<%=request.getContextPath() %>/back/assets/js/jquery.dataTables.min.js"></script>
		<script src="<%=request.getContextPath() %>/back/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="<%=request.getContextPath() %>/back/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="<%=request.getContextPath() %>/back/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/back/assets/js/jquery.easy-pie-chart.min.js"></script>
        <script src="<%=request.getContextPath() %>/back/js/lrtk.js" type="text/javascript" ></script>
<title>订单管理</title>
</head>
<body>
<div class="margin clearfix" >
 <div class="Order_form clearfix" id="Order_form_style">
 <div class="title_name">订单状态所占总订单比例
     <span class="top_show_btn Statistic_btn">显示</span> 
     <span class="Statistic_title Statistic_btn"><a title="隐藏" class="top_close_btn">隐藏</a></span>
 </div>
 <div class="hide_style clearfix">
   <div class="proportion" onclick="fun1()"> <div id="n1" class="easy-pie-chart percentage" data-percent="<%=p1 %>" data-color="#D15B47"><span class="percent" id="num1"><%=p1 %></span>%</div><span class="name">已支付</span></div>									
   <div class="proportion" onclick="fun2()"> <div id="n2" class="easy-pie-chart percentage" data-percent="<%=p2 %>" data-color="#87CEEB"><span class="percent" id="num2"><%=p2 %></span>%</div><span class="name">未支付</span></div>									
   <div class="proportion" onclick="fun3()"> <div id="n3" class="easy-pie-chart percentage" data-percent="<%=p3 %>" data-color="#87B87F"><span class="percent" id="num3"><%=p3 %></span>%</div><span class="name">已取消</span></div>
   <div class="proportion" onclick="fun4()"> <div id="n4" class="easy-pie-chart percentage" data-percent="<%=p4 %>" data-color="#d63116"><span class="percent" id="num4"><%=p4 %></span>%</div><span class="name">已提车</span></div>
   <div class="proportion" onclick="fun5()"> <div id="n5" class="easy-pie-chart percentage" data-percent="<%=p5 %>" data-color="#13a9e1"><span class="percent" id="num5"><%=p5 %></span>%</div><span class="name">已还车</span></div>
 </div>
 </div>
<script type="text/javascript">
function fun1() {
	var o_state = "已支付";
	window.location.href = "<%=request.getContextPath() %>/queryOrderServlet?method=getOrderByState&o_state=" + o_state;
}
function fun2() {
	var o_state = "未支付";
	window.location.href = "<%=request.getContextPath() %>/queryOrderServlet?method=getOrderByState&o_state=" + o_state;
}
function fun3() {
	var o_state = "已取消";
	window.location.href = "<%=request.getContextPath() %>/queryOrderServlet?method=getOrderByState&o_state=" + o_state;
}
function fun4() {
	var o_state = "已提车";
	window.location.href = "<%=request.getContextPath() %>/queryOrderServlet?method=getOrderByState&o_state=" + o_state;
}
function fun5() {
	var o_state = "已还车";
	window.location.href = "<%=request.getContextPath() %>/queryOrderServlet?method=getOrderByState&o_state=" + o_state;
}
</script>
<!--订单表格-->
<div  style="width: 1250px;">
  
     <!--订单列表-->
     <div >
       <div class="search_style" >
      <div class="title_names">搜索查询</div>
      <ul class="search_content clearfix">
       <li><label class="l_f">订单编号</label><input id="o_code" type="text" class="text_add" placeholder="订单订单编号" style=" width:250px"></li>
       <li><label class="l_f">提车时间</label><input class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
       <li style="width:90px;"><button type="button" onclick="queryByTj()" class="btn_search"><i class="fa fa-search"></i>查询</button></li>
       <li style="float: right;">
       <button style="width:80px;" type="button" 
      onClick ="$('#table1').tableExport({type: 'txt', escape: 'false'});" class="btn_search">导出txt</button></li>
       <li style="float: right;">
       <button style="width:80px;" type="button" 
      onClick ="$('#table1').tableExport({type: 'png', escape: 'false'});" class="btn_search">截图</button></li>
       <li style="float: right;">
       <button style="width:80px;" type="button" 
      onClick ="$('#table1').tableExport({type: 'doc', escape: 'false'});" class="btn_search">导出word</button></li>
       <li style="float: right;">
       <button style="width:80px;" type="button" 
       onClick ="$('#table1').tableExport({type: 'excel', escape: 'false'});" class="btn_search">导出Excel</button></li>
      </ul>
    </div>

<script type="text/javascript" src="<%=request.getContextPath() %>/back/js/html2canvas.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/back/wnl/index/swfobject.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/back/js/jquery.base64.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/back/js/tableExport.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/back/js/webtoolkit.sprintf.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/back/js/jspdf.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/back/js/Base64.js"></script>  
<script type="text/javascript">
/* function dcbb(){
	
} */


function queryByTj() {
	var o_code = $("#o_code").val();
	var startDate = $("#start").val();
	if(o_code==""&&startDate==""){
		layer.msg('请输入查询条件！',{icon:0,time:1000});
		return;
	}else{
		window.location.href="<%=request.getContextPath()%>/queryOrderServlet?method=getOrderByTj&o_code="+o_code+"&startDate="+startDate;
	}
}
</script>
     <!--订单列表展示-->
       <table class="table table-striped table-bordered table-hover" id="table1" >
		<thead>
		 <tr>
				<th>订单编号</th>
				<th>用户身份证</th>
				<th>车牌号</th>
				<th>总天数</th>
                <th>总金额</th>				
				<th>￥35保险</th>
				<th>订单状态</th>                
				<th>操作</th>
			</tr>
		</thead>
	<tbody>
	     <%
	     if(order.size()>0){
	    	 for(Map<String,Object> o : order){
	    		 %>
	    		 <tr>
				     <td><%=o.getOrDefault("o_code", "") %></td>
				     <td><%=o.getOrDefault("u_card", "") %></td>
				     <td><%=o.getOrDefault("b_code", "") %></td>
				     <td><%=o.getOrDefault("days", "") %></td>
				     <td style="color:red;font-weight:900;"><%=o.getOrDefault("allMoney", "") %></td>
				     <td><%
				     	if("已购买".equals(o.getOrDefault("o_bx", "").toString())){
				     		%><span class="label label-success radius">已购买</span><%
				     	}else{
				     		%><span class="label label-error radius">未购买</span><%
				     	}
				     %></td>
				     <td class="td-status">
				     	<%
				     	if("已支付".equals(o.getOrDefault("o_state", "").toString())){
				     		%><span class="label label-success radius">已支付</span><%
				     	}else if("已取消".equals(o.getOrDefault("o_state", "").toString())){
				     		%><span class="label label-warning radius">已取消</span><%
				     	}else if("未支付".equals(o.getOrDefault("o_state", "").toString())){
				     		%><span class="label label-error radius">未支付</span><%
				     	}else if("已提车".equals(o.getOrDefault("o_state", "").toString())){
				     		%><span class="label label-success radius">已提车</span><%
				     	}else{
				     		%><span class="label label-info radius">已还车</span><%
				     	}
				     	%>
				     </td>
				     <td>
				     <a title="提车" href="javascript:;"  onclick="Order_form_tc('<%=o.getOrDefault("o_code", "") %>','<%=o.getOrDefault("o_state", "").toString() %>')" class="btn btn-xs btn-error"><i class="fa fa-cubes bigger-120"></i></a>
				     <a title="还车" href="javascript:;"  onClick="Delivery_hc('<%=o.getOrDefault("o_state", "").toString() %>','<%=o.getOrDefault("o_code", "") %>')"   class="btn btn-xs btn-success"><i class="fa fa-cubes bigger-120"></i></a> 
				     <a title="订单详情"  href="<%=request.getContextPath() %>/queryOrderDetilServlet?o_code=<%=o.getOrDefault("o_code", "") %>"  class="btn btn-xs btn-info order_detailed" ><i class="fa fa-list bigger-120"></i></a> 
				     </td>
			     </tr>
	    		 <%
	    	 }
	     }else{
	    	 %>
	    	 <tr>
	    	 	<td colspan="8"><h3 style="color:red;">数据库中还没有这样的订单！</h3></td>
	    	 </tr>
	    	 <%
	     }
	     %>
     
     </tbody>
     </table>
   </div>
  </div>
 </div>
 <!--发货-->
 <div id="Delivery_stop" style=" display:none" style="width:300px;">
  <div class="">
    <div class="content_style">
  <div class="form-group">
  <label class="col-sm-2 control-label no-padding-right" for="form-field-1" style="width: 100px;">用户评分： </label>
       <div class="col-sm-9">
	       <select class="form-control" id="form-field-select-1" style="width: 250px;">
				<option value="">--请选择用户评分--</option>
				<option value="1">1分</option>
				<option value="2">2分</option>
				<option value="3">3分</option>
				<option value="4">4分</option>
				<option value="5">5分</option>
			</select>
		</div>
  </div>
    <div class="form-group">
     <label class="col-sm-2 control-label no-padding-right" for="form-field-1" style="margin-left:5px; width: 140px;">汽车是否有损伤：</label>
     <input style="margin-left: 15px;" type="radio" checked="checked" name="ss" >无
     <input style="margin-left: 15px;" type="radio" name="ss" >有
	</div>
    <div class="form-group">
     <label class="col-sm-2 control-label no-padding-right" for="form-field-1" style="margin-left:5px; width: 140px;">还车是否已超时：</label>
     <input style="margin-left: 15px;" type="radio" name="cs" >是
     <input style="margin-left: 15px;" type="radio" checked="checked" name="cs" >否
	</div>
 </div>
  </div>
 </div>
</body>
</html>
<script>
/*订单**还车*/
function Delivery_hc(o_state,o_code){
	if("已提车"!=o_state){
		layer.msg('请查看订单状态!',{icon:120,time:1000});
		return;
	}
	layer.open({
        type: 1,
        title: '还车提示',
		maxmin: true, 
		shadeClose:false,
        area : ['500px' , ''],
        content:$('#Delivery_stop'),
		btn:['确定','取消'],
		yes: function(index, layero){		
		if($('#form-field-select-1').val()==""){
			layer.alert('评分不能为空！',{title: '提示框',icon:0,});
		}else{			
			 layer.confirm('提交成功！',function(index){
				window.location.href='<%=request.getContextPath() %>/OrderHandleServlet?method=HuanChe&o_code=' + o_code;
				layer.msg('已还车!',{icon: 6,time:1000});
			});  
			layer.close(index);    		  
		  }
		
		}
	})
};
/*订单-提车*/
function Order_form_tc(o_code,o_state){
	if("已支付"!=o_state){
		layer.msg('请查看订单状态!',{icon:120,time:1000});
		return;
	}
	layer.confirm('确认要提车？',function(index){
		window.location.href='<%=request.getContextPath() %>/OrderHandleServlet?method=TiChe&o_code=' + o_code;
		layer.msg('提车成功!',{icon:1,time:1000});
	});
}
//顶部隐藏显示
$(function() { 
	$("#Order_form_style").fix({
		float : 'top',
		//minStatue : true,
		skin : 'green',	
		durationTime :true,
		spacingw:0,
		spacingh:0,
		close_btn:'.top_close_btn',
		show_btn:'.top_show_btn',
		side_list:'.hide_style',
		close_btn_width:80,
		side_title:'.Statistic_title',
	});
});
//时间选择
 laydate({
    elem: '#start',
    event: 'focus' 
});
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form,.order_detailed').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').html(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});

//初始化宽度、高度
$(".hide_style").height($(".hide_style").height()); 
 var heights=$(".hide_style").outerHeight(true)+90;  
 $(".widget-box").height($(window).height()-heights); 
$(".table_menu_list").width($(window).width()-250);
 $(".table_menu_list").height($(window).height()-heights);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height()-heights);
	 $(".table_menu_list").width($(window).width()-250);
	  $(".table_menu_list").height($(window).height()-heights);
	})
//比例
var oldie = /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase());
			$('.easy-pie-chart.percentage').each(function(){
				$(this).easyPieChart({
					barColor: $(this).data('color'),
					trackColor: '#EEEEEE',
					scaleColor: false,
					lineCap: 'butt',
					lineWidth: 10,
					animate: oldie ? false : 1000,
					size:103
				}).css('color', $(this).data('color'));
			});
		
			$('[data-rel=tooltip]').tooltip();
			$('[data-rel=popover]').popover({html:true});
</script>
<script>
//订单列表
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,1,2,3,4,5,6,7,8,9]}// 制定列不参与排序
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