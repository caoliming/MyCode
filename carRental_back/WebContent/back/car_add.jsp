<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
  List<Map<String,Object>> mark = (List<Map<String,Object>>)request.getAttribute("mark");
  List<Map<String,Object>> type = (List<Map<String,Object>>)request.getAttribute("type");
%>

<html>
<%-- <%= mark%>
<%= type%> --%>
<head>
<link href="<%=request.getContextPath()%>/back/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/back/css/style.css"/>       
<link href="<%=request.getContextPath()%>/back/assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/back/assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/back/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/back/assets/css/font-awesome.min.css" />
<link href="<%=request.getContextPath()%>/back/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/back/Widget/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />

<!-- 引入图片上传的js文件 -->
<script src="<%=request.getContextPath() %>/back/js/upload.js"></script>

<!-- 添加成功的提示 -->
<script>
var addInfo = "<%=request.getAttribute("addInfo")%>";
if(addInfo != null&& addInfo !=""){
	if(addInfo=="1"){
		alert("【汽车添加成功!】");
	}else if(addInfo == "0"){
		alert("【汽车添加失败!】");
	}
}else{
	addInfo =="";
}
</script>

<title>添加汽车信息</title>
</head>
<body>
<div class="clearfix" id="add_picture">
	<form action="<%=request.getContextPath() %>/addCarServlet" enctype="multipart/form-data" method="post" class="form form-horizontal" id="form-article-add">
		<!-- 防止表单的重复提交 -->
					<% 
						String token = Math.round(Math.random()*100000)+new Date().getTime()+"";
						session.setAttribute("token", token);
					%>
					<input type="hidden" name="zlm" value="<%=token %>"/>
					<!-- 防止表单的重复提交 -->
		<div class=" clearfix cl">
			<div class="Add_p_s">
	            <label class="form-label col-2">汽车车牌：</label>
				<div class="formControls col-2">
					<input style="color: blue;" type="text" class="input-text" placeholder="请输入" name="code">
				</div>
            </div>
             <div class="Add_p_s">
	             <label class="form-label col-2">汽车类型：</label>	
				 <div class="formControls col-2">
					 <span class="select-box">
						<select class="select" name="type">
							<%
								for(Map<String,Object> t : type){
								%>
								<option value="<%=t.getOrDefault("t_id", "")%>"><%=t.getOrDefault("t_type", "")%></option>
								<%	
								}
							%>
						</select>
					</span>
				</div>
			</div>
			<div class="Add_p_s">
	             <label class="form-label col-2">汽车品牌：</label>	
				 <div class="formControls col-2">
					 <span class="select-box">
						<select class="select" name="mark">
							<%
								for(Map<String,Object> m : mark){
								%>
								<option value="<%=m.getOrDefault("b_id", "")%>"><%=m.getOrDefault("b_name", "")%></option>
								<%	
								}
							%>
						</select>
					</span>
				</div>
			</div>
			<div class="Add_p_s">
	             <label class="form-label col-2">汽车款式：</label>	
				 <div class="formControls col-2">
					 <span class="select-box">
						<select class="select"  name="kuanshi">
							<option value="高配">高配</option>
							<option value="低配">低配</option>
							<option value="典雅款">典雅款</option>
							<option value="悦动款">悦动款</option>
							<option value="运动款">运动款</option>
						</select>
					</span>
				</div>
			</div>
			<div class="Add_p_s">
	             <label class="form-label col-2">座&nbsp;&nbsp;位&nbsp;&nbsp;数：</label>	
				 <div class="formControls col-2">
					 <span class="select-box">
						<select class="select"  name="zuowei">
							<option value="2">2</option>
							<option value="4">4</option>
							<option value="6">6</option>
							<option value="8">8</option>
							<option value="10">10</option>
						</select>
					</span>
				</div>
			</div>
			<div class="Add_p_s">
	             <label class="form-label col-2">车&nbsp;&nbsp;门&nbsp;&nbsp;数：</label>	
				 <div class="formControls col-2">
					 <span class="select-box">
						<select class="select"  name="chemen">
							<option value="2">2</option>
							<option value="4">4</option>
							<option value="6">6</option>
							<option value="8">8</option>
						</select>
					</span>
				</div>
			</div>
			<div class="Add_p_s">
	             <label class="form-label col-2">燃料类型：</label>	
				 <div class="formControls col-2">
					 <span class="select-box">
						<select class="select" name="ranliao">
							<option value="汽油">汽油</option>
							<option value="CNG">CNG</option>
							<option value="柴油">柴油</option>
							<option value="电力">电力</option>
							<option value="混动">混动</option>
						</select>
					</span>
				</div>
			</div>
			<div class="Add_p_s">
	             <label class="form-label col-2">变&nbsp;&nbsp;速&nbsp;&nbsp;箱：</label>	
				 <div class="formControls col-2">
					 <span class="select-box">
						<select class="select" name="bainsu">
							<option value="手动">手动</option>
							<option value="自动">自动</option>
							<option value="手自一体">手自一体</option>
							<option value="其他">其他</option>
						</select>
					</span>
				</div>
			</div>
			<div class="Add_p_s">
	             <label class="form-label col-2">座椅材质：</label>	
				 <div class="formControls col-2">
					 <span class="select-box">
						<select class="select" name="zuoyi">
							<option value="皮质">皮质</option>
							<option value="皮革">皮革</option>
							<option value="织物">织物</option>
							<option value="皮布结合">皮布结合</option>
							<option value="其他">其他</option>
						</select>
					</span>
				</div>
			</div>
			<div class="Add_p_s">
	             <label class="form-label col-2">有无导航：</label>	
				 <div class="formControls col-2">
					 <span class="select-box">
						<select class="select"  name="isdao">
							<option value="有">有</option>
							<option value="无">无</option>
						</select>
					</span>
				</div>
			</div>
			<div class="Add_p_s">
	             <label class="form-label col-2">有无天窗：</label>	
				 <div class="formControls col-2">
					 <span class="select-box">
						<select class="select"  name="iswindow">
							<option value="有">有</option>
							<option value="无">无</option>
						</select>
					</span>
				</div>
			</div>
			
            <div class="Add_p_s">
             <label class="form-label col-2">日&nbsp;&nbsp;租&nbsp;&nbsp;价：</label>	
			 <div class="formControls col-2">
			 <input style="width: 90px;color: red;" type="text" class="input-text" name="price" >元/天</div>
			</div>
		</div>
		<div class="clearfix cl">
         <label class="form-label col-2">汽车简介：</label>
			<div class="formControls col-10">
				<script id="editor"  type="text/plain" name="introduce" style="width:90%;height:130px;"></script>
             </div>
        </div>
		
		<div class="clearfix cl">
			<label class="form-label col-2">图片上传：</label>
			<div class="formControls col-10">
				<div class="uploader-list-container" style="width:845px;height: 200px; "> 
				
					<div class="logobox" style="height: 170px;width: 180px; margin:15px;border: solid 1px #CCCCFF;position: relative;float: left;">
						<h4 align="center">车图1</h4>
						<img style="padding: 5px 17px;height: 140px;width: 180px;" id="img_1" alt="图片暂时无法加载" src="<%=request.getContextPath()%>/back/images/image.png">
						<input style="opacity: 0;-ms-filter: 'alpha(opacity=0)';" type="file" name="img_1" id="img_1_in" onchange="PreviewImage1(this,'img_1')"/>
					</div>
					
					<div class="logobox" style="height: 170px;width: 180px;margin: 15px;border: solid 1px #CCCCFF;position: relative;float: left;">
						<h4 align="center">车图2</h4>
						<img style="padding: 5px 17px;height: 140px;width: 180px;" id="img_2" alt="图片暂时无法加载" src="<%=request.getContextPath()%>/back/images/image.png">
						<input style="opacity: 0;-ms-filter: 'alpha(opacity=0)';"  type="file" name="img_2" id="img_2_in" onchange="PreviewImage1(this,'img_2')"/>
					</div>
					
					<div class="logobox" style="height: 170px;width: 180px;margin: 15px;border: solid 1px #CCCCFF;position: relative;float: left;">
						<h4 align="center">车图3</h4>
						<img style="padding: 5px 17px;height: 140px;width: 180px;" id="img_3" alt="图片暂时无法加载" src="<%=request.getContextPath()%>/back/images/image.png">
						<input style="opacity: 0;-ms-filter: 'alpha(opacity=0)';"  type="file" name="img_3" id="img_3_in" onchange="PreviewImage1(this,'img_3')"/>
					</div>
					
					<div class="logobox" style="height: 170px;width: 180px;margin: 15px;border: solid 1px #CCCCFF;position: relative;float: left;">
						<h4 align="center">车图4</h4>
						<img style="padding: 5px 17px;height: 140px;width: 180px;" id="img_4" alt="图片暂时无法加载" src="<%=request.getContextPath()%>/back/images/image.png">
						<input style="opacity: 0;-ms-filter: 'alpha(opacity=0)';"  type="file" name="img_4" id="img_4_in" onchange="PreviewImage1(this,'img_4')"/>
					</div>
					
				</div>
			</div>
		</div>
         
        
		<div class="clearfix cl">
			<div class="Button_operation">
				<button type="button" onclick="carSubmit()" class="btn btn-primary radius" type="submit"><i class="icon-save "></i>保存并提交</button>
				<button class="btn btn-default radius" type="reset">&nbsp;&nbsp;取&nbsp;&nbsp;消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
    </div>
<!-- 对表单的验证 -->
<script type="text/javascript">
	function carSubmit(){
		var code = $("input[name='code']").val();
		var price = $("input[name='price']").val();
		if(""==code||null==code){
			alert("请输入汽车车牌号码！");
			return;
		}
		if(""==price||null==price){
			alert("请输入汽车日租价！");
			return;
		}
		 $("#form-article-add").submit();
	}
</script>

<script src="<%=request.getContextPath()%>/back/js/jquery-1.9.1.min.js"></script>   
<script src="<%=request.getContextPath()%>/back/assets/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/back/assets/js/typeahead-bs2.min.js"></script>
<script src="<%=request.getContextPath()%>/back/assets/layer/layer.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/back/assets/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/back/Widget/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/back/Widget/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/back/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/back/Widget/Validform/5.3.2/Validform.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/back/Widget/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/back/Widget/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/back/Widget/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/back/Widget/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/back/js/lrtk.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/back/js/H-ui.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/back/js/H-ui.admin.js"></script> 
<script>
$(function() { 
	$("#add_picture").fix({
		float : 'left',
		skin : 'green',	
		durationTime :false,
		stylewidth:'220',
		spacingw:0,
		spacingh:260,
	});
});
$( document).ready(function(){
//初始化宽度、高度
  
   $(".widget-box").height($(window).height()); 
   $(".page_right_style").height($(window).height()); 
   $(".page_right_style").width($(window).width()-220); 
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){

	 $(".widget-box").height($(window).height()); 
	 $(".page_right_style").height($(window).height()); 
	 $(".page_right_style").width($(window).width()-220); 
	});	
});
$(function(){
	var ue = UE.getEditor('editor');
});
				
</script>
</body>
</html>