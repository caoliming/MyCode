<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>注册页面</title>
<script type="text/javascript">
	function check1(){
		var userName=document.getElementById("userName").value;
		if(userName == ""){
			document.getElementById("userName1").innerHTML="此字段不能为空";
			return false;
		}else{
			return true;
		}
	}
	
	function check2(){
		var passWord=document.getElementById("phone").value;
		if(passWord == ""){
			document.getElementById("phone1").innerHTML="此字段不能为空";
			return false;
		}else{
			return true;
		}
	}
	function check3(){
		var email=document.getElementById("email").value;
		if(email == "" ||!email.matches("(?:\\w[-._\\w]*\\w@\\w[-._\\w]*\\w\\.\\w{2,3}$)")){
			document.getElementById("email1").innerHTML="此字段不能为空或者邮箱格式不正确";
			return false;
		}else{
			return true;
		}
	}
	function check4(){
		var pwd1=document.getElementById("password").value;
		var pwd2=document.getElementById("password1").value;
		if(pwd1 == "" || pwd2 == ""){
			document.getElementById("tip").innerHTML="<font color='red'>请填写此字段</font>";
			return false;
		}
		else{
			if(pwd1 == pwd2){
				document.getElementById("tip").innerHTML="<font color='green'>√</font>";
				return true;
			}else{
				document.getElementById("tip").innerHTML="<font color='red'>您输入的两次密码不一致</font>";
				return false;
			}
		}
	}
	function checkAll(){
		return check1()&&check2()&&check3()&&check4();
	} 
</script>
<script src="/liancheng_product/js/jquery-1.8.2.min.js"></script>
<script src="/liancheng_product/js/common.js"></script>
<script src="/liancheng_product/js/jquery.easing.1.3.js"></script>
<script src="/liancheng_product/js/ddsmoothmenu.js"></script>
<script src="/liancheng_product/js/jquery.flexslider.js"></script>
<script src="/liancheng_product/js/jquery.elastislide.js"></script>
<script src="/liancheng_product/js/jquery.jcarousel.min.js"></script>
<script src="/liancheng_product/js/jquery.accordion.js"></script>
<script src="/liancheng_product/js/light_box.js"></script>
<script type="text/javascript">$(document).ready(function(){$(".inline").colorbox({inline:true, width:"50%"});});</script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="/liancheng_product/css/style.css">
<link rel="stylesheet" href="/liancheng_product/css/orange.css">
<link rel="stylesheet" href="/liancheng_product/css/skeleton.css">
<link rel="stylesheet" href="/liancheng_product/css/layout.css">
<link rel="stylesheet" href="/liancheng_product/css/ddsmoothmenu.css"/>
<link rel="stylesheet" href="/liancheng_product/css/elastislide.css"/>
<link rel="stylesheet" href="/liancheng_product/css/home_flexslider.css"/>

<link rel="stylesheet" href="css/light_box.css"/>
<script src="js/html5.js"></script>
</head>
<body>
	<div class="mainContainer sixteen container">
<!--Header Block-->
<div class="header-wrapper">
              <header class="container">
                <div class="head-right">
                     <ul class="top-nav">
						<li class=""><a href="/liancheng_product/seeacount.jsp" title="我的账户">查看账户</a></li>
						<li class="my-wishlist"><a href="<%=session.getAttribute("user") == null ? "/liancheng_product/account_login.jsp":"/liancheng_product/SeeColleServlet?userId="+session.getAttribute("userId")%>" title="我的收藏">我的收藏</a></li>
						<li class="contact-us"><a href="/liancheng_product/contact_us.jsp" title="联系我们">联系我们</a></li>
						<%
							if(session.getAttribute("user") != null){
								%>
								<li class="checkout"><a href="/liancheng_product/LogisticsServlet?userId=<%=session.getAttribute("userId")%>" title="核对">查看物流</a></li>
								<%
							}
						%>
						<li class="log-in"><a href="<%=session.getAttribute("user") == null? "/liancheng_product/account_login.jsp":"/liancheng_product/CheckInformationServlet?userId="+session.getAttribute("userId")%>"
							title="Log In">${sessionScope.user == null?"登录":sessionScope.user}</a></li>
						<%
							if(session.getAttribute("user") != null){
								%>
								<li class="checkout"><a href="/liancheng_product/LoginOutServlet" title="核对">注销</a></li>
								<%
							}
						%>
					</ul>
                  <section class="header-bottom">
                    <<div class="cart-block">
							<ul>
								<li>${requestScope.count}</li>
								<li><a href="<%=session.getAttribute("user") == null? "/liancheng_product/account_login.jsp":"/liancheng_product/CartItemServlet?userId="+session.getAttribute("userId")%>" title="Cart"><img title="Item"
										alt="Item" src="images/item_icon.png" /></a></li>
								<li>购物车</li>
							</ul>
						</div>
						<div class="search-block">
						<form action="/liancheng_product/SearchServlet" method="post">
							<input type="text" placeholder="搜索" name="search"/> 
							<input type="submit" value="Search" title="Search" />
						</form>
						</div>
                  </section>
                </div>
                 <h1 class="logo">
					<a href="index-2.html" title="Logo"> <img title="嘟嘟商店"
						alt="Logo" src="images/logo1.png" />
					</a>
				</h1>
                <nav id="smoothmenu1" class="ddsmoothmenu mainMenu">
                 <ul id="nav">
						<li class="active"><a href="/liancheng_product/home.jsp" title="Home">主页</a></li>
						<li class=""><a href="javascript:void(0)" title="Shop by">分类查看</a>
							<ul>
								<li><a href="/liancheng_product/CategoryServler?op=novel">小说</a></li>
								<li><a href="/liancheng_product/CategoryServler?op=literature">文学</a></li>
								<li><a href="/liancheng_product/CategoryServler?op=program">编程</a></li>
								<li><a href="/liancheng_product/CategoryServler?op=socialscience">社会科学</a>
									</li>
								<li><a href="/liancheng_product/CategoryServler?op=motivation">励志</a></li>
							</ul>
						</li>
						<li class=""><a href="/liancheng_product/AboutWeServlet" title="About us">关于我们</a></li>
						<li class=""><a href="/liancheng_product/contact_us.jsp" title="Footwear">联系我们</a></li>
					</ul>
                </nav>
              </header>
            </div>	
<!--注册-->
<section class="content-wrapper">
	<form action="/liancheng_product/RegisterServlet?op=register" method="post" onsubmit="return checkAll()">
		<div class="content-container container">
		<div class="main">
			<h1 class="page-title">注册一个用户</h1>
			<div class="fieldset">
			<!-- 个人信息-->
	            <h2 class="legend">个人信息</h2>
				<ul class="form-list">
					<li class="fields">
						<div class="customer-name">
							<div class="input-box name-firstname">
								<label for="firstname">用户名<em>*</em></label>
								<input type="text" class="required-entry input-text" title="First Name"  value="${requestScope.user.userName}" name="name" id="userName" onblur="check1()">
								 <span style="color: red; font-weight: 900" id="userName1"></span>
							</div>
							<div class="input-box name-lastname">
								<label for="lastname">手机号码<em>*</em></label>
								<input type="text" class="required-entry input-text" title="Last Name" value="${requestScope.user.phone}" name="phone" id="phone1"  onblur="check2()">
								 <span style="color: red; font-weight: 900" id="phone1"></span>
							</div>
							<div class="clear"></div>
						</div>                
					</li>
					<li>
						<div class="input-box">
							<label class="required" for="email_address">邮箱<em>*</em></label>
							<input type="text" class="input-text validate-email required-entry" title="Email Address" value="value="${requestScope.user.phone}"" id="email" name="email" onblur="check3()">
							 <span style="color: red; font-weight: 900" id="email1">${requestScope.errMap.email}</span>
						</div>
						<div class="clear"></div>
					</li>
					<li>
						<div class="input-box">
							<div class="input-box">
								<label  for="email_address">性别<em></em></label>
								<input type="radio"  ${requestScope.register.sex=="男"? "checked='checked'" :""}class="input-text validate-email required-entry"  name="sex" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;
								<input type="radio"  ${requestScope.register.sex=="女"? "checked='checked'" :""} class="input-text validate-email required-entry" name="sex" value="女">女
							</div>
							<div class="clear"></div>
						</div>
					</li>
				</ul>
				<br />
				<h2 class="legend">登录信息</h2>
				<ul class="form-list">
					<li class="fields">
						<div class="customer-name">
							<div class="input-box name-firstname">
								<label for="firstname">密码<em>*</em></label>
								<input type="password" class="required-entry input-text" title="First Name" value="" name="password" id="password">
							</div>
							<div class="input-box name-lastname">
								<label for="lastname">确认密码<em>*</em></label>
								<input type="password" class="required-entry input-text" title="Last Name" value="" name="password1" id="password1" onblur="check4()">
							</div>
							<div class="input-box name-lastname">
								<br />
								<label class="required-entry input-text" id="tip"></label>
							</div>
							<div class="clear"></div>
						</div>
					</li>
				</ul>
				<div class="buttons-set">
					<p class="required">*必填项</p>
					<a href="/liancheng_product/RegisterServlet" title="Back" class="f-left">&laquo; 返回</a>
					<input title="Submit" class="orange-btn" id="submit" type="submit" value="提交" >
					<div class="clear"></div>
				</div>
        </div>
		</div>
		<div class="clearfix"></div>
		<div class="news-letter-container">
			<div class="free-shipping-block">
				<h1>ENJOY FREE SHIPPING</h1>
				<p>on all orders as our holiday gift for you!</p>
			</div>
			<div class="news-letter-block">
				<h2>SIGN UP FOR OUR NEWSLETTER</h2>
				<input type="text" value="Enter email address" title="" />
				<input type="submit" value="Submit" title="Submit" />
			</div>
		</div>	
	</div>
	</form>
</section>
</div>
</body>
</html>