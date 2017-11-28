<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
List<Map<String,Object>> message = (List<Map<String,Object>>)request.getAttribute("message");
%>
<html>
<head>
 <link href="<%=request.getContextPath()%>/back/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/back/css/style.css"/>       
        <link href="<%=request.getContextPath()%>/back/assets/css/codemirror.css" rel="stylesheet"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/back/assets/css/ace.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/back/font/css/font-awesome.min.css" />
		<script src="<%=request.getContextPath()%>/back/js/jquery-1.9.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/back/assets/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/back/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="<%=request.getContextPath()%>/back/assets/js/jquery.dataTables.min.js"></script>
		<script src="<%=request.getContextPath()%>/back/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="<%=request.getContextPath()%>/back/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="<%=request.getContextPath()%>/back/assets/laydate/laydate.js" type="text/javascript"></script>
<title>留言</title>
 <style type="text/css">
    	.img img{  
                cursor: pointer;  
                transition: all 1.2s;  
        }  
        .img img:hover{  
            transform: scale(2.6);  
        }  
    </style>
</head>

<body>
<div class="margin clearfix">
 <div class="Guestbook_style">
 <div class="search_style">
      <div class="title_names">搜索查询</div>
      <ul class="search_content clearfix">
       <li><label class="l_f">留言</label><input id="info" type="text" class="text_add" style=" width:250px"></li>
       <li style="width:150px;"><button onclick="queryByTj()" type="button" style="width:110px;" class="btn_search"><i class="icon-search"></i>模糊查询</button></li>
      </ul>
    </div>
<script type="text/javascript">
function queryByTj() {
	var info = $("#info").val();
	if(""==info || null==info){
		$("#info").attr("placeholder","请输入留言内容");
		return;
	}
	window.location.href="<%=request.getContextPath()%>/queryMessageByInfoServlet?info="+info;
}
</script>
    <!--留言列表-->
    <div class="Guestbook_list">
      <table class="table table-striped table-bordered table-hover" id="sample-table">
      <thead>
		 <tr>
          <th>用户名</th>
          <th>用户头像</th>
          <th>留言</th>
          <th>留言日期</th>
          <th>状态</th>
          </tr>
      </thead>
	<tbody>
			<%
			if(message.size()>0){
				for(Map<String,Object> m : message){
					%>
					<tr>
				          <td><%=m.getOrDefault("u_name", "").toString()%></td>
				          <td class="img"><img style="width:100px;height:80px;border-radius:8px;border:1px solid blue;" alt="流失了..." src="/car_img/<%=m.getOrDefault("u_img", "").toString()%>"></td>
				          <td class="text-l">
				          	<a href="javascript:;" 
				          	onclick="Guestbook_iew('<%=m.getOrDefault("u_card", "").toString()%>','<%=m.getOrDefault("m_info", "").toString()%>','<%=m.getOrDefault("u_phone", "").toString()%>','<%=m.getOrDefault("u_jscard", "").toString()%>','<%=m.getOrDefault("m_id", "").toString()%>')"><%=m.getOrDefault("m_info", "").toString().substring(0,3)%>...</a>
				          </td>
				          <td><%=m.getOrDefault("m_date", "").toString()%></td>
				          <td class="td-status">
				          <%
				          if(null==m.getOrDefault("m_return", "")){
				        	  %>
				        	  <span class="label label-error radius">未回复</span>
				        	  <%
				          }else{
				        	  %>
				        	  <span class="label label-success radius">已回复</span>
				        	  <%
				          }
				          %>
				          </td>
		        	</tr>
					<%
				}
			}else{
				%>
			 	<tr>
			 		<td style="color: red;" colspan="5">数据库中没有这样的留言！</td>
			 	</tr>
				<%
			}
			%>
        </tbody>
      </table>
    </div>
 </div>
</div>
<!--留言详细-->
<div id="Guestbook" style="display:none">
 <div class="content_style">
  <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">身份证号：</label>
       <div class="col-sm-9" id="u_card"></div>
	</div>
  <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">驾驶证号：</label>
       <div class="col-sm-9" id="u_jscard"></div>
	</div>
   <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 电话号码： </label>
       <div class="col-sm-9" id="u_phone"></div>
	</div>
   <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 留言内容： </label>
       <div class="col-sm-9" id="m_info"></div>
	</div>
    <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">是否回复： </label>
       <div class="col-sm-9">
       <label><input name="checkbox" type="checkbox" class="ace" id="checkbox"><span class="lbl"> 回复</span></label>
       <div class="Reply_style">
          <textarea name="回复用户留言" class="form-control" id="form_textarea" placeholder="" onkeyup="checkLength(this);"></textarea>
          <span class="wordage">剩余字数：<span id="sy" style="color:Red;">50</span>字</span>
       </div>
       </div>
	</div>
 </div>
</div>
</body>
</html>
<script type="text/javascript">
/*checkbox激发事件*/
$('#checkbox').on('click',function(){
	if($('input[name="checkbox"]').prop("checked")){
		 $('.Reply_style').css('display','block');
		}
	else{
		
		 $('.Reply_style').css('display','none');
		}	
	})
/*留言查看*/
function Guestbook_iew(u_card,m_info,u_phone,u_jscard,m_id){
	$("#u_card").html(u_card);
	$("#m_info").html(m_info);
	$("#u_phone").html(u_phone);
	$("#u_jscard").html(u_jscard);
	
	var index = layer.open({
        type: 1,
        title: '留言详情',
		maxmin: true, 
		shadeClose:false,
        area : ['600px' , ''],
        content:$('#Guestbook'),
		btn:['确定','取消'],
		yes: function(index, layero){		 
		  if($('input[name="checkbox"]').prop("checked")){			 
			 if($('.form-control').val()==""){
				layer.alert('回复内容不能为空！',{
               title: '提示框',				
			  icon:0,		
			  }) 
			 }else{			
			      layer.alert('确定回复该内容？',{
				   title: '提示框',				
				   icon:0,	
				   btn:['确定','取消'],	
				   yes: function(index){
					   var backContent = $("#form_textarea").val();
					   alert("【回复成功】");				   
					   layer.closeAll();
					   window.location.href="<%=request.getContextPath()%>/backMessageServlet?m_id="+m_id+"&content="+backContent;
					  }
				  }); 		  
		   }			
	      }else{			
			 layer.alert('是否要取消回复！',{
               title: '提示框',				
			icon:0,		
			  }); 
			  layer.close(index);      		  
		  }
	   }
	})	
};
	/*字数限制*/
function checkLength(which) {
	var maxChars = 50; 
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您输入的字数超过限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};
</script>

