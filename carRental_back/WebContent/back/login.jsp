<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link
	href="<%=request.getContextPath()%>/back/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/assets/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/assets/css/ace.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/assets/css/ace-rtl.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/assets/css/ace-skins.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/css/style.css" />
<script
	src="<%=request.getContextPath()%>/back/assets/js/ace-extra.min.js"></script>
<script src="<%=request.getContextPath()%>/back/js/jquery-1.9.1.min.js"></script>
<script src="<%=request.getContextPath()%>/back/assets/layer/layer.js"
	type="text/javascript"></script>
<title>登陆</title>
</head>

<body class="login-layout">
	<div class="logintop">
		<span>欢迎后台管理界面平台</span>
		<ul>
			<li><a href="/carRental_fore/fore/login.jsp">用户前台</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>
	<div class="loginbody">
		<div class="login-container">
			<div class="center">
				<h1>
					<i class="icon-leaf green"></i> <span class="orange">风行天下</span> <span
						class="white">租车管理系统</span>
				</h1>
				<h4 class="white">Car_Rental Management System</h4>
			</div>
<script type="text/javascript">
var loginInfo = "<%=request.getAttribute("loginInfo")%>";
if(loginInfo != null&& loginInfo !=""){
	if(loginInfo=="0"){
		layer.alert("登录名或密码错误！\r\n",{title: '提示框',icon:0,}); 
	}else if(loginInfo == "1"){
		layer.alert("验证码错误！\r\n",{title: '提示框',icon:0,}); 
	}
}else{
	loginInfo =="";
}
</script>
			<div class="space-6"></div>

			<div class="position-relative">
				<div id="login-box" class="login-box widget-box no-border visible">
					<div class="widget-body">
						<div class="widget-main">
							<h4 class="header blue lighter bigger">
								<i class="icon-coffee green"></i> 管理员登陆
							</h4>
							<form method="post" action="<%=request.getContextPath()%>/loginServlet" id="form1">
								<fieldset>
									<label class="block clearfix"> <span
										class="block input-icon input-icon-right"> <input
											type="text" class="form-control" placeholder="登录名" name="name" id="name">
											<i class="icon-user"></i>
									</span>
									</label> <label class="block clearfix"> <span
										class="block input-icon input-icon-right"> <input
											type="password" class="form-control" placeholder="密码" name="pass" id="pass"> 
											<i class="icon-lock"></i>
									</span>
									</label> <label class="block clearfix"> <span
										class="block input-icon input-icon-right"> 
										<input type="text" class="form-control" placeholder="验证码" name="code" id="code"><i class="icon-key"></i>
									</span>
									</label><label class="block clearfix"> <span
										class="block input-icon input-icon-right"> 
										<img src="<%=request.getContextPath()%>/KeywordCheckcode?number=${201310538}"
 										name="keywordCheckcode" id="keywordCheckcode" style="width:270px;height:50px;border:1px solid blue;">
 										<a style="margin-left:20px;cursor:hand;" onclick="myReload()">看不清？换一张</a>
									</span>
									</label> 
									<div class="space"></div>

									<div class="clearfix">
										<label class="inline"> <input type="checkbox"
											class="ace"> <span class="lbl">保存密码</span>
										</label>

										<button type="button" onclick="tj()"
											class="width-35 pull-right btn btn-sm btn-primary"
											id="login_btn">
											<i class="icon-key"></i> 登陆
										</button>
									</div>

									<div class="space-4"></div>
								</fieldset>
							</form>
<script type="text/javascript">
function myReload(){
	location.reload();
}
</script>
							<div class="social-or-login center">
								<span class="bigger-110">注意</span>
							</div>

							<div style="color: red;" class="social-login center">
								数据珍贵，谨慎删除</div>
						</div>
						<!-- /widget-main -->

						<div class="toolbar clearfix"></div>
					</div>
					<!-- /widget-body -->
				</div>
				<!-- /login-box -->
			</div>
			<!-- /position-relative -->
		</div>
	</div>
	<div class="loginbm">
		版权所有 2017 <a href="">兰州交通大学</a>
	</div>
	<strong></strong>
</body>
</html>
<script>
function tj(){
	if($("#name").val()==""){
        layer.alert("登录名不能为空！\r\n",{title: '提示框',icon:0,}); 
        return;            
    } 
    if($("#pass").val()==""){
        layer.alert("密码不能为空！\r\n",{title: '提示框',icon:0,}); 
        return;            
    } 
    if($("#code").val()==""){
        layer.alert("验证码不能为空！\r\n",{title: '提示框',icon:0,}); 
        return ;            
    } 
    layer.alert('提交成功！',{title: '提示框',icon:1,	});
	
    $("#form1").submit();
    layer.close(index);
}
</script>