<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
Map<String,Object> systemSet = (Map<String,Object>)application.getAttribute("SystemSet");
%>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>网站后台管理系统</title>
<link href="<%=request.getContextPath()%>/back/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/back/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/back/assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/back/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/back/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/back/css/style.css" />
<script src="<%=request.getContextPath()%>/back/assets/js/ace-extra.min.js"></script>
<script src="<%=request.getContextPath()%>/back/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	if ("ontouchend" in document)
		document
				.write("<script src='back/assets/js/jquery.mobile.custom.min.js'>"
						+ "<"+"script>");
</script>
<script src="<%=request.getContextPath()%>/back/assets/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/back/assets/js/typeahead-bs2.min.js"></script> 
<script src="<%=request.getContextPath()%>/back/assets/js/ace-elements.min.js"></script>
<script src="<%=request.getContextPath()%>/back/assets/js/ace.min.js"></script>
<script src="<%=request.getContextPath()%>/back/assets/layer/layer.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/back/assets/laydate/laydate.js" type="text/javascript"></script>
<style type="text/css">
body{
	border: 0px;
}
</style>
</head>
<body>
	<div class="navbar navbar-default" id="navbar">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>
		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> 
				<h1 style="font-family: 楷体;font-size: 2.2em;font-weight: 900;"><%=systemSet==null?"风行天下汽车租赁":systemSet.getOrDefault("s_name", "").toString() %></h1>
				</a>
				<!-- /.brand -->
			</div>
			<!-- /.navbar-header -->
			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <span class="time"><em
								id="time"></em></span><span class="user-info"><small>欢迎光临,</small>
								<%=request.getSession().getAttribute("managerName")==null?"张三":request.getSession().getAttribute("managerName").toString() %>
						</span> <i class="icon-caret-down"></i>
					</a>
					<ul
						class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						<li><a href="<%=request.getContextPath() %>/back/admin_info.jsp"><i class="icon-user"></i>个人资料</a></li>
						<li><a href="javascript:ovid(0)" id="Exit_system"><i class="icon-off"></i>退出</a></li>
						<li><a>当前在线人数：<i style="color:red;"><%=application.getAttribute("count") %></i></a></li>
					</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>
		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>
			<div class="sidebar" id="sidebar">
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'fixed')
					} catch (e) {
					}
				</script>
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						租车后台管理系统</div>
					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span> <span class="btn btn-info"></span>
						<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
					</div>
				</div>
				<!-- #sidebar-shortcuts -->
				<ul class="nav nav-list" id="nav_list">
					<li class="home"><a href="javascript:void(0)" name="<%=request.getContextPath() %>/back/home.jsp"
						class="iframeurl" title=""><i class="icon-dashboard"></i><span
							class="menu-text"> 系统首页 </span></a></li>
					<li><a href="#" class="dropdown-toggle"><i
							class="icon-desktop"></i><span class="menu-text"> 汽车管理 </span><b
							class="arrow icon-angle-down"></b></a>
						<ul class="submenu">
						
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/queryCarServlet?method=getAllCar" title="汽车列表" class="iframeurl"><i
									class="icon-double-angle-right"></i>汽车列表</a></li>
									
							<!-- 请求查询品牌的servlet，查询到结果后，请求转发到carMark.jsp -->		
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/queryMarkServlet?method=getAllMark" title="汽车品牌" class="iframeurl"><i
									class="icon-double-angle-right"></i>汽车品牌</a></li>
									
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/queryTypeServlet?method=getAllType" title="汽车类型" class="iframeurl"><i
									class="icon-double-angle-right"></i>汽车类型</a></li>
							
							<!-- 汽车统计 -->
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/carTjServlet" title="汽车统计" class="iframeurl"><i
									class="icon-double-angle-right"></i>汽车统计</a></li>
						</ul></li>
					<li><a href="#" class="dropdown-toggle"><i
							class="icon-list"></i><span class="menu-text"> 订单管理 </span><b
							class="arrow icon-angle-down"></b></a>
						<ul class="submenu">
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/orderTjServlet" title="租赁统计" class="iframeurl"><i
									class="icon-double-angle-right"></i>订单统计</a></li>
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/queryOrderServlet?method=getAllOrder" title="订单管理" class="iframeurl"><i
									class="icon-double-angle-right"></i>订单处理</a></li>

						</ul></li>
					<li><a href="#" class="dropdown-toggle"><i
							class="icon-user"></i><span class="menu-text"> 用户管理 </span><b
							class="arrow icon-angle-down"></b></a>
						<ul class="submenu">
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/queryUserServlet" title="会员列表" class="iframeurl"><i
									class="icon-double-angle-right"></i>用户列表</a></li>
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/queryUserTjServlet" title="等级管理" class="iframeurl"><i
									class="icon-double-angle-right"></i>用户统计</a></li>
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/back/integration.html" title="会员记录管理" class="iframeurl"><i
									class="icon-double-angle-right"></i>会员积分</a></li>

						</ul></li>
					<li><a href="#" class="dropdown-toggle"><i
							class="icon-edit"></i><span class="menu-text"> 消息管理 </span><b
							class="arrow icon-angle-down"></b></a>
						<ul class="submenu">
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/queryMessageServlet" title="留言列表" class="iframeurl"><i
									class="icon-double-angle-right"></i>用户留言</a></li>
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/back/talk.jsp" title="意见反馈" class="iframeurl"><i
									class="icon-double-angle-right"></i>用户聊天</a></li>
						</ul></li>
					<li><a href="#" class="dropdown-toggle"><i
							class="icon-cogs"></i><span class="menu-text"> 系统管理 </span><b
							class="arrow icon-angle-down"></b></a>
						<ul class="submenu">
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/back/Systems.jsp" title="系统设置" class="iframeurl"><i
									class="icon-double-angle-right"></i>系统设置</a></li>

						</ul></li>
					<li><a href="#" class="dropdown-toggle"><i
							class="icon-group"></i><span class="menu-text"> 管理员 </span><b
							class="arrow icon-angle-down"></b></a>
						<ul class="submenu">
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/back/admin_info.jsp" title="个人信息" class="iframeurl"><i
									class="icon-double-angle-right"></i>个人信息</a></li>
						</ul></li>
					<li><a href="#" class="dropdown-toggle"><i
							class="icon-desktop"></i><span class="menu-text"> 工具 </span><b
							class="arrow icon-angle-down"></b></a>
						<ul class="submenu">
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/back/jsq.html" title="个人信息" class="iframeurl"><i
									class="icon-double-angle-right"></i>计算器</a></li>
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/back/tq.html" title="个人信息" class="iframeurl"><i
									class="icon-double-angle-right"></i>天气</a></li>
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/back/wnl.html" title="个人信息" class="iframeurl"><i
									class="icon-double-angle-right"></i>万年历</a></li>
							<li class="home"><a href="javascript:void(0)"
								name="<%=request.getContextPath() %>/back/clock.html" title="个人信息" class="iframeurl"><i
									class="icon-double-angle-right"></i>电子时钟</a></li>
						</ul></li>
				</ul>
				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"
						data-icon1="icon-double-angle-left"
						data-icon2="icon-double-angle-right"></i>
				</div>
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'collapsed')
					} catch (e) {
					}
				</script>
			</div>
			<div class="main-content">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="icon-home home-icon"></i> <a
							href="<%=request.getContextPath()%>/back/index.jsp">首页</a></li>
						<li class="active"><span class="Current_page iframeurl"></span></li>
						<li class="active" id="parentIframe"><span
							class="parentIframe iframeurl"></span></li>
						<li class="active" id="parentIfour"><span
							class="parentIfour iframeurl"></span></li>
					</ul>
				</div>

				<iframe id="iframe"
					style="border: 0; width: 100%; background-color: #FFF;"
					name="iframe" frameborder="0"
					src="<%=request.getContextPath()%>/back/home.jsp"> </iframe>


				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->

			<div class="ace-settings-container" id="ace-settings-container">
				<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
					id="ace-settings-btn">
					<i class="icon-cog bigger-150"></i>
				</div>

				<div class="ace-settings-box" id="ace-settings-box">
					<div>
						<div class="pull-left">
							<select id="skin-colorpicker" class="hide">
								<option data-skin="default" value="#438EB9">#438EB9</option>
								<option data-skin="skin-1" value="#222A2D">#222A2D</option>
								<option data-skin="skin-2" value="#C6487E">#C6487E</option>
								<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
							</select>
						</div>
						<span>&nbsp; 选择皮肤</span>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-sidebar" /> <label class="lbl"
							for="ace-settings-sidebar"> 固定滑动条</label>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-rtl" /> <label class="lbl"
							for="ace-settings-rtl">切换到左边</label>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-add-container" /> <label class="lbl"
							for="ace-settings-add-container"> 切换窄屏 <b></b>
						</label>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!--底部样式-->

	<div class="footer_style" id="footerstyle">
		<p class="l_f">版权所有：cn.com.clm</p>
		<p class="r_f">地址：甘肃省兰州市兰州交通大学   邮编：730500   技术支持：clm</p>
	</div>

</body>
<script type="text/javascript">
	$(function() {
		var cid = $('#nav_list> li>.submenu');
		cid.each(function(i) {
			$(this).attr('id', "Sort_link_" + i);
		})
	})
	jQuery(document)
			.ready(
					function() {
						$.each($(".submenu"), function() {
							var $aobjs = $(this).children("li");
							var rowCount = $aobjs.size();
							var divHeigth = $(this).height();
							$aobjs.height(divHeigth / rowCount);
						});
						//初始化宽度、高度    
						$("#main-container").height($(window).height() - 76);
						$("#iframe").height($(window).height() - 140);

						$(".sidebar").height($(window).height() - 99);
						var thisHeight = $("#nav_list").height(
								$(window).outerHeight() - 173);
						$(".submenu").height();
						$("#nav_list").children(".submenu").css("height",
								thisHeight);

						//当文档窗口发生改变时 触发  
						$(window).resize(
								function() {
									$("#main-container").height(
											$(window).height() - 76);
									$("#iframe").height(
											$(window).height() - 140);
									$(".sidebar").height(
											$(window).height() - 99);

									var thisHeight = $("#nav_list").height(
											$(window).outerHeight() - 173);
									$(".submenu").height();
									$("#nav_list").children(".submenu").css(
											"height", thisHeight);
								});
						$(".iframeurl")
								.click(
										function() {
											var cid = $(this).attr("name");
											var cname = $(this).attr("title");
											$("#iframe").attr("src", cid)
													.ready();
											$("#Bcrumbs").attr("href", cid)
													.ready();
											$(".Current_page a").attr('href',
													cid).ready();
											$(".Current_page")
													.attr('name', cid);
											$(".Current_page").html(cname).css(
													{
														"color" : "#333333",
														"cursor" : "default"
													}).ready();
											$("#parentIframe")
													.html(
															'<span class="parentIframe iframeurl"> </span>')
													.css("display", "none")
													.ready();
											$("#parentIfour").html('').css(
													"display", "none").ready();
										});

					});

	
	$(document).ready(
			function() {
				$('#nav_list').find('li.home').click(function() {
					$('#nav_list').find('li.home').removeClass('active');
					$(this).addClass('active');
				});

				//时间设置
				function currentTime() {
					var d = new Date(), str = '';
					str += d.getFullYear() + '年';
					str += d.getMonth() + 1 + '月';
					str += d.getDate() + '日';
					str += d.getHours() + '时';
					str += d.getMinutes() + '分';
					str += d.getSeconds() + '秒';
					return str;
				}
				setInterval(function() {
					$('#time').html(currentTime)
				}, 1000);
				
				$('#Exit_system').on('click', function() {
					layer.confirm('是否确定退出系统？', {
						btn : [ '是', '否' ],//按钮
						icon : 2,
					}, function() {
						location.href = "back/login.jsp";

					});
				});
			})
</script>
</html>

