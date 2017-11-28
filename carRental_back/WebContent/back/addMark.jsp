<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="cn.clm.utils.*"%>
<html>
<head>
<title>添加品牌</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/css/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/assets/css/ace.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/assets/css/font-awesome.min.css" />
<link href="<%=request.getContextPath()%>/back/Widget/icheck/icheck.css"
	rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/back/js/jquery-1.9.1.min.js"></script>
<script
	src="<%=request.getContextPath()%>/back/assets/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/back/assets/js/typeahead-bs2.min.js"></script>
<script src="<%=request.getContextPath()%>/back/assets/layer/layer.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/back/Widget/swfupload/swfupload.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/back/Widget/swfupload/swfupload.queue.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/back/Widget/swfupload/handlers.js"></script>
<!-- 引入图片上传的js文件 -->
<script src="<%=request.getContextPath() %>/back/js/upload.js"></script>

<!-- 添加成功的提示 -->
<script>
var addInfo = "<%=request.getAttribute("addInfo")%>";
if(addInfo != null&& addInfo !=""){
	if(addInfo=="1"){
		alert("【品牌添加成功!】");
	}else if(addInfo == "0"){
		alert("【品牌添加失败!】");
	}
}else{
	addInfo =="";
}
</script>
</head>

<body>
	<div class=" clearfix">
		<div id="add_brand" class="clearfix">
			<div class="title_name" style="top: 0px;">添加品牌</div>
			<form action="<%=request.getContextPath() %>/addCarMarkServlet" method="post"  enctype="multipart/form-data">
					<!-- 防止表单的重复提交 -->
					<% 
						String token = Math.round(Math.random()*100000)+new Date().getTime()+"";
						session.setAttribute("token", token);
					%>
					<input type="hidden" name="zlm" value="<%=token %>"/>
					<!-- 防止表单的重复提交 -->
				<ul class="add_conent">
					<li class=" clearfix"><label class="label_name">品牌名称：</label>
						<input style="width: 200px; height: 40px" name="mark" type="text"
						class="add_text" placeholder="请输入品牌名称"/></li>
					<li class=" clearfix"><label class="label_name">添加日期：</label>
						<input name="date" type="date" style="width: 200px; height: 40px"></li>
					<li class=" clearfix"><label class="label_name">品牌描述：</label>
						<textarea placeholder="请简单介绍此汽车品牌..." style="width: 600px; height: 100px" name="introduce" cols=""
							rows="" class="textarea" onkeyup="checkLength(this);"></textarea>
					</li>
					<li class=" clearfix"><label class="label_name">品牌图片：</label>
						<div class="demo l_f">
							<div class="logobox">
								<img id="img_1" alt="图片暂时无法加载" src="<%=request.getContextPath()%>/back/images/image.png" style="left: 120px;height: 140px;width: 160px;">
								<input style="background-color: #CCCCCC;height: 23px;width: 200px" type="file" name="img" id="img_1_in" onchange="PreviewImage1(this,'img_1')"/>
							</div>
						</div></li>
					<li><input style="left: 90px" type="submit"
						class="btn btn-warning" value="保&nbsp;&nbsp;存" /> 
						<input style="left: 110px" name="" type="reset" value="取&nbsp;&nbsp;消"
						class="btn btn-warning" />
						</li>
				</ul>
			</form>
		</div>
	</div>

</body>
</html>
<script type="text/javascript">
	
</script>
