<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
Map<String,Object> manager = (Map<String,Object>)session.getAttribute("manager");
%>
<html>
<head>
 <link href="<%=request.getContextPath() %>/back/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/css/style.css"/>       
        <link href="<%=request.getContextPath() %>/back/assets/css/codemirror.css" rel="stylesheet"/>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/assets/css/ace.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/font/css/font-awesome.min.css" />
		<script src="<%=request.getContextPath() %>/back/js/jquery-1.9.1.min.js"></script>
		<script src="<%=request.getContextPath() %>/back/assets/layer/layer.js" type="text/javascript" ></script>
        <script src="<%=request.getContextPath() %>/back/assets/laydate/laydate.js" type="text/javascript"></script>  
        <script src="<%=request.getContextPath() %>/back/assets/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath() %>/back/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="<%=request.getContextPath() %>/back/assets/js/jquery.dataTables.min.js"></script>
		<script src="<%=request.getContextPath() %>/back/assets/js/jquery.dataTables.bootstrap.js"></script>
                      
<title>个人信息管理</title>
</head>

<body>
<div class="clearfix">
 <div class="admin_info_style">
 <br><br><br>
   <div class="admin_modify_style" id="Personal" style="position: absolute;left: 150px;margin: 0px;padding: 0px;border: 0px;">
      <div class="xinxi">
        <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">用户名： </label>
          <div class="col-sm-9">
            <input type="text" name="姓名" id="website-title" value="<%=manager.getOrDefault("m_name", "") %>" class="col-xs-7 text_info" disabled="disabled">
          &nbsp;&nbsp;&nbsp;<a href="javascript:ovid()" onclick="change_Password()" class="btn btn-warning btn-xs">修改密码</a>
          </input></div>
          
          </div>
          <div class="form-group">
          <label class="col-sm-3 control-label no-padding-right" for="form-field-1">性别： </label>
          <div class="col-sm-9">
          <span class="sex">男</span>
            <div class="add_sex">
            <label><input name="form-field-radio" type="radio" class="ace"
            <%if("男".equals(manager.getOrDefault("m_sex", "").toString())){%>checked="checked"<%} %>><span class="lbl"/>男</input> &nbsp;&nbsp;</label>
            <label><input name="form-field-radio" type="radio" class="ace"
            <%if("女".equals(manager.getOrDefault("m_sex", "").toString())){%>checked="checked"<%} %>><span class="lbl"/>女</input>
            </label>
            </div>
           </div>
          </div>
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">年龄： </label>
          <div class="col-sm-9"><input type="text" name="年龄" id="website-title" value="<%=manager.getOrDefault("m_age", "").toString() %>" class="col-xs-7 text_info" disabled="disabled"></div>
          </div>
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">移动电话： </label>
          <div class="col-sm-9"><input type="text" name="电话" id="website-title" value="<%=manager.getOrDefault("m_phone", "").toString() %>" class="col-xs-7 text_info" disabled="disabled"></div>
          </div>
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">身份证号： </label>
          <div class="col-sm-9"><input type="text" name="身份证号" id="website-title" value="<%=manager.getOrDefault("m_card", "").toString() %>" class="col-xs-7 text_info" disabled="disabled"> </div>
          </div>
           <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">权限： </label>
          <div class="col-sm-9" > <span>普通管理员</span></div>
          </div>
           <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">注册时间： </label>
          <div class="col-sm-9" > <%=manager.getOrDefault("m_date", "").toString() %></span></div>
          </div>
           <div class="Button_operation clearfix"> 
				<button onclick="modify();" class="btn btn-danger radius" type="submit">修改信息</button>				
				<button onclick="save_info();" class="btn btn-success radius" type="button">保存修改</button>              
			</div>
            </div>
            <img alt="不见了..." src="/car_img/<%=manager.getOrDefault("m_img", "").toString()%>"
            style="border: 5px solid #ccc;border-radius:10px;width: 250px;height: 260px;
            position: absolute;top:25px;left: 365px;">
    </div>
 </div>
</div>
 <!--修改密码样式-->
         <div class="change_Pass_style" id="change_Pass">
            <ul class="xg_style">
             <li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="原密码" type="password" class="" id="password"></li>
             <li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="新密码" type="password" class="" id="Nes_pas"></li>
             <li><label class="label_name">确认密码</label><input name="再次确认密码" type="password" class="" id="c_mew_pas"></li>
              
            </ul>
     <!--       <div class="center"> <button class="btn btn-primary" type="button" id="submit">确认修改</button></div>-->
         </div>
</body>
</html>
<script>

 //按钮点击事件
function modify(){
	 $('.text_info').attr("disabled", false);
	 $('.text_info').addClass("add");
	  $('#Personal').find('.xinxi').addClass("hover");
	  $('#Personal').find('.btn-success').css({'display':'block'});
	};
function save_info(){
	    var num=0;
		 var str="";
     $(".xinxi input[type$='text']").each(function(n){
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
              var info = $("input[name='姓名']").val()+"-"+$("input[name='年龄']").val()+"-"+$("input[name='电话']").val()+"-"+$("input[name='身份证号']").val();
        	  window.location.href='<%=request.getContextPath()%>/updateManagerServlet?method=updateManager&info=' + info;  
			   layer.alert('修改成功！',{
               title: '提示框',				
			   icon:1,			   		
			  });
			  $('#Personal').find('.xinxi').removeClass("hover");
			  $('#Personal').find('.text_info').removeClass("add").attr("disabled", true);
			  $('#Personal').find('.btn-success').css({'display':'none'});
			   layer.close(index);
			
		  }		  		
	};	
 //初始化宽度、高度    
    $(".admin_modify_style").height($(window).height()); 
	$(".recording_style").width($(window).width()-400); 
    //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".admin_modify_style").height($(window).height()); 
	$(".recording_style").width($(window).width()-400); 
  });
  //修改密码
  function change_Password(){
	   layer.open({
    type: 1,
	title:'修改密码',
	area: ['300px','300px'],
	shadeClose: true,
	content: $('#change_Pass'),
	btn:['确认修改'],
	yes:function(index, layero){		
		   if ($("#password").val()==""){
			  layer.alert('原密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		  var oldPass = '<%=manager.getOrDefault("m_psw", "").toString()%>';
		    if($("#password").val() !=oldPass)
	      {
	          layer.alert('你输入的旧密码错误!',{
	            title: '提示框',				
					icon:0,
				    
				 });
				 return false;
	      }   
		      
		  if ($("#Nes_pas").val()==""){
			  layer.alert('新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 

	        
		   
		  if ($("#c_mew_pas").val()==""){
			  layer.alert('确认新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          }
		    if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
        {
            layer.alert('两次输入密码不一致!',{
              title: '提示框',				
				icon:0,
			    
			 });
			 return false;
        }   
	       
		 else{		
			 var pass = $("#Nes_pas").val();	
			 window.location.href='<%=request.getContextPath() %>/updateManagerServlet?method=updatePass&pass='+ pass;  
			  layer.alert('修改成功！',{
               title: '提示框',				
			icon:1,		
			  }); 
			  layer.close(index);      
		  }	 
	}
    });
}

jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
});
</script>
