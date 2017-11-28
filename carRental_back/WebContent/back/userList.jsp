<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cn.clm.models.*,java.util.*"%>
    
<%
Page pageData = (Page)request.getAttribute("pageDate");
%> 
<html>
<head>
        <link href="<%=request.getContextPath() %>/back/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/css/style.css"/>       
        <link href="<%=request.getContextPath() %>/back/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/assets/css/ace.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/assets/css/font-awesome.min.css" />
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=request.getContextPath() %>/back/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='<%=request.getContextPath() %>/back/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="<%=request.getContextPath() %>/back/assets/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath() %>/back/assets/js/typeahead-bs2.min.js"></script>
		<!-- page specific plugin scripts -->
		<script src="<%=request.getContextPath() %>/back/assets/js/jquery.dataTables.min.js"></script>
		<script src="<%=request.getContextPath() %>/back/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/back/js/H-ui.js"></script> 
        <script type="text/javascript" src="<%=request.getContextPath() %>/back/js/H-ui.admin.js"></script> 
        <script src="<%=request.getContextPath() %>/back/assets/layer/layer.js" type="text/javascript" ></script>
        <script src="<%=request.getContextPath() %>/back/assets/laydate/laydate.js" type="text/javascript"></script>
<title>用户列表</title>

<style type="text/css">
a{
	float:left;
	margin-left: 15px;
}
</style>
</head>
<script type="text/javascript">
/* 按条件查询 */
function findUser() {
	var name = $("#name").val();
	var date = $("#start").val();
	if(name==""&&date==""){
		alert("请输入查询条件！");
		return;
	}else{
		window.location.href="<%=request.getContextPath()%>/queryUserByNDServlet?name="+name+"&date="+date;
	}
	
}
</script>
<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
      <div class="d_Confirm_Order_style">
    <div class="search_style">
    <!-- 搜索查询***************************************************************** -->
      <div class="title_names">搜索查询</div>
      <ul class="search_content clearfix">
       <li><label class="l_f">用户名</label><input id="name" type="text"  class="text_add" placeholder="请输入用户名"  style="width:200px"/></li>
       <li><label class="l_f">添加时间</label><input class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
       <li style="width:90px;"><button type="button" class="btn_search" onclick="findUser()"><i class="icon-search"></i>查询</button></li>
      </ul>
    </div>
     <!-- 搜索查询***************************************************************** -->
 
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover">
		<thead>
		 <tr>
				<th width="80">姓名</th>
				<th width="180">照片</th>
				<th width="80">性别</th>
				<th width="80">年龄</th>
				<th width="120">手机</th>
				<th width="180">身份证</th>
				<th width="150">驾驶证</th>
				<th width="120">注册时间</th>
                <th width="100">住址</th>
				<th width="70">状态</th>   
			</tr>
		</thead>
	<tbody>
		<%
		if(pageData.getDate().size()==0){
			%>
			<h2 style="color: red;">数据库中没有此条件的用户！</h3>
			<%
			
		}else{
			for(Map<String ,Object> map : pageData.getDate()){
			%>
		
			<tr>
			       <td width="80"><%=map.getOrDefault("u_name", "") %></td>
				   <td width="180"><img style="height:100px;width: 110px; " alt="图片不见了..." src="/car_img/<%=map.getOrDefault("u_img", "") %>"></td>
				   <td width="80"><%=map.getOrDefault("u_sex", "") %></td>
				   <td width="80"><%=map.getOrDefault("u_age", "") %></td>
				   <td width="120"><%=map.getOrDefault("u_phone", "") %></td>
				   <td width="180"><%=map.getOrDefault("u_card", "") %></td>
				   <td width="150"><%=map.getOrDefault("u_jscard", "") %></td>
				   <td width="120"><%=map.getOrDefault("u_date", "") %></td>
			       <td width="100"><%=map.getOrDefault("u_address", "") %></td>
			       <td class="td-status"><span class="label label-success radius">已启用</span></td>
	          
			</tr>
			<%
			}
		}
		%>
        
      </tbody>
	</table>
     	 <a class="btn btn-xs btn-success" href="#" id="frist">首页</a>
    	 <a class="btn btn-xs btn-success" href="#" id="forw">上一页</a>
    	 <a class="btn btn-xs btn-success" href="#" id="next">下一页</a>
         <a class="btn btn-xs btn-success" href="#" id="end">尾页</a>
		<span style="padding-left: 30px;font-family: 楷体;font-size: 1.5em;">每页显示：<i style="color:red;font-size: 1.6em;"><%=pageData.getSize() %></i>
		条数据，当前页面：<i style="color:red;font-size: 1.6em;"><%=pageData.getPage() %>/<%=pageData.getTotalPage() %></i></span>
   </div>
  </div>
 </div>
</div>
<script type="text/javascript">
/* 分页 */
var page="<%=pageData.getPage()%>";
var totalPage="<%=pageData.getTotalPage()%>";
$(function(){
    $("#frist").click(function(){
    	if(page!=1){
    		page=1;
        	window.location.href="<%=request.getContextPath()%>/queryUserServlet?page="+page;
    	}else{
    		alert("本页就是第一页！");
    	}
    	
	});
	$("#forw").click(function(){
		if(page>1){
			page--;
			window.location.href="<%=request.getContextPath()%>/queryUserServlet?page="+page;
		}else{
			alert("已经是第一页了！");
		}
	});
 	$("#next").click(function(){
 		if(page<totalPage){
			page++;
			window.location.href="<%=request.getContextPath()%>/queryUserServlet?page="+page;
		}else{
			alert("已经是最后一页了！");
		}
	});
 	$("#end").click(function(){
 		if(page!=totalPage){
 			page=totalPage;
 	 		window.location.href="<%=request.getContextPath()%>/queryUserServlet?page="+page;
 		}else{
 			alert("本页就是最后一页！");
 		}
 		
	});
})
</script>
</body>
</html>
<script>
jQuery(function($) {
				var oTable1 = $('#sample-table').dataTable( {
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
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
			})
/*用户-添加*/
 $('#member_add').on('click', function(){
    layer.open({
        type: 1,
        title: '添加用户',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
		 var num=0;
		 var str="";
     $(".add_menber input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  layer.alert('添加成功！',{
               title: '提示框',				
			icon:1,		
			  });
			   layer.close(index);	
		  }		  		     				
		}
    });
});

laydate({
    elem: '#start',
    event: 'focus' 
});

</script>