<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css"/>       
        <link href="assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="font/css/font-awesome.min.css" />
		<script src="js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>           	
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>
<title>聊天区</title>
</head>
<script src="<%=request.getContextPath() %>/back/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
var sysBBS = "<span style='font-size:14px; line-height:30px;'>欢迎光临聊天室，请遵守聊天室规则，不要使用不文明用语。</span><br><span style='line-height:22px;'>";
window.setInterval("showContent();",1000);
// Jquery:JS框架.
// 相当于window.onload
$(function(){
	showContent();
});
document.onkeyup = function (e) {
    var ev = e || event;
    if(ev.keyCode == 13){
    	sendMessage();
    }
}  
var url="${pageContext.request.contextPath}/";

function sendMessage() {
	var textarea= $("#textarea").val();
	if(textarea==""||textarea==null){
		alert("请输入内容后发送！");
		return;
	}
	$.post(url+"userServlet?"+new Date().getTime(),$("#form1").serialize(),function(data){
		$("#list").html(sysBBS+data+"</span>");
	}); 
	
	fmusic1();
	$("#textarea").val("");
	$("#textarea").focus();
}

// 显示聊天的内容
function showContent(){
	$.post(url+"userServlet?"+new Date().getTime(),{'method':'getMessage'},function(data){
		$("#list").html(sysBBS+data+"</span>");
	}); 

}
// 清屏
function clear(){
	$.post(url+"userServlet",{'method':'clear'},function(data){
		$("#list").html(sysBBS+data+"</span>");
	}); 

}

/* 声音特效 */
function fmusic1(){
    var lss = $("#lss");
	$('<audio id="chatAudio1"><source src="music/3424.mp3" type="audio/ogg"></audio>').appendTo(lss);//载入声音文件 
    $("#chatAudio1")[0].play();
}

function checkScrollScreen(){
	if(!$("#scrollScreen").attr("checked")){
    	$("#list").css("overflow","scroll");
    }else{
    	$("#list").css("overflow","hidden");
        //当聊天信息超过一屏时，设置最先发送的聊天信息不显示
        //alert($("#content").height());
        $("#list").scrollTop($("#list").height()*2);
    }
    setTimeout('checkScrollScreen()',500);
}
</script>
<body>
<div class="margin clearfix">
 <div class="Feedback_style">
  <div class="border clearfix">
       <span class="l_f">
        <a href="#" onclick="clear()" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;清除</a>
        <a href="javascript:ovid()" class="btn btn-sm btn-primary"><i class="fa fa-check"></i>&nbsp;已浏览</a>
        <a href="javascript:ovid()" class="btn btn-yellow"><i class="fa fa-times"></i>&nbsp;未浏览</a>
        <a href="javascript:ovid()" class="btn btn-success"><i class="fa fa-feed"></i>&nbsp;建议</a>
        <a href="javascript:ovid()" class="btn btn-success"><i class="fa fa-feed"></i>&nbsp;投诉</a>
       </span>
     </div>
    <div class="feedback">
    <!-- 聊天 -->

    	<form id="form1" name="form1" method="post">
    	<span id="lss"></span>
			<input type="hidden" name="method" value="sendMessage"/>
			<input type="hidden" name="username" value="管理员"/>
				<div id="list" style="border:1px solid #CCCCCC; height: 250px;font-size: 1.3em;"></div>
				<div  style="margin-top: 15px;">
					<input name="scrollScreen" type="checkbox" class="noborder" id="scrollScreen" onClick="checkScrollScreen()" value="1" checked>
				      <select  style=" width:200px;height: 35px;font-family:楷体;font-size: 1.3em;font-weight: 900;" name="face" class="wenbenkuang">
							<option value="无表情的">无表情的</option>
							<option value="微笑着">微笑着</option>
							<option value="笑呵呵地">笑呵呵地</option>
							<option value="热情的">热情的</option>
							<option value="温柔的">温柔的</option>
							<option value="红着脸">红着脸</option>
							<option value="幸福的">幸福的</option>
							<option value="嘟着嘴">嘟着嘴</option>
							<option value="热泪盈眶的">热泪盈眶的</option>
							<option value="依依不舍的">依依不舍的</option>
							<option value="得意的">得意的</option>
							<option value="神秘兮兮的">神秘兮兮的</option>
							<option value="恶狠狠的">恶狠狠的</option>
							<option value="大声的">大声的</option>
							<option value="生气的">生气的</option>
							<option value="幸灾乐祸的">幸灾乐祸的</option>
							<option value="同情的">同情的</option>
							<option value="遗憾的">遗憾的</option>
							<option value="正义凛然的">正义凛然的</option>
							<option value="严肃的">严肃的</option>
							<option value="慢条斯理的">慢条斯理的</option>
							<option value="无精打采的">无精打采的</option>
						</select>
					<input style="width:300px;height: 35px;font-family:楷体;font-size: 1.3em;font-weight: 900;" type="text" name="textarea" id="textarea" placeholder="请输入..."/>
				  <input style="background-color:#99CCCC;font-size: 1.4em;" type="button" name="button" id="button" onclick="sendMessage()" value=" 发 送 " />
			</div>
		</form>
		<!-- 聊天 -->
    </div>
 </div>
</div>
</body>
</html>