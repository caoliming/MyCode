<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
 <link href="<%=request.getContextPath()%>/back/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/back/css/style.css"/>       
        <link href="<%=request.getContextPath()%>/back/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/back/assets/css/ace.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/back/assets/css/font-awesome.min.css" />
		<script src="<%=request.getContextPath()%>/back/js/jquery-1.9.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/back/assets/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/back/assets/js/typeahead-bs2.min.js"></script>           	
        <script src="<%=request.getContextPath()%>/back/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="<%=request.getContextPath()%>/back/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="<%=request.getContextPath()%>/back/assets/js/jquery.ui.touch-punch.min.js"></script>
        <script src="<%=request.getContextPath()%>/back/assets/js/ace-elements.min.js"></script>
		<script src="<%=request.getContextPath()%>/back/assets/js/ace.min.js"></script>
		<script src="<%=request.getContextPath() %>/back/js/upload.js"></script>
<title>系统设置</title>

</head>

<body>
<script>
var addInfo = "<%=request.getAttribute("result")%>";
if(addInfo != null&& addInfo !=""){
	if(addInfo=="1"){
		layer.msg('上传成功！',{icon:1,time:1000});
	}else if(addInfo == "0"){
		layer.msg('上传失败！',{icon:0,time:1000});
	}else if(addInfo == "00"){
		layer.msg('请至少上传一项！',{icon:0,time:1000});
	}
}else{
	addInfo =="";
}
</script>
<div class="margin clearfix">
 <div class="stystems_style">
  <div class="tabbable">
	<ul class="nav nav-tabs" id="myTab">
	  <li class="active">
		<a data-toggle="tab" href="#home"><i class="green fa fa-home bigger-110"></i>&nbsp;基本设置</a>
	  </li>
      <li class="">
		<a data-toggle="tab" data-toggle="dropdown" class="dropdown-toggle" href="#other">其他设置</a>
      </li>
	</ul>
    <div class="tab-content">
		<div id="home" class="tab-pane active">
		<form method="post" action="<%=request.getContextPath() %>/updateSystemSetServlet" enctype="multipart/form-data">
          <div class="form-group">
          	<label class="col-sm-1 control-label no-padding-right"><i>*</i>网站名称： </label>
          	<div class="col-sm-9">
          	<input type="text" id="website-title" name="name" placeholder="请输入网站名称" class="col-xs-10" style="width: 260px;"></div>
          </div>
          <div class="form-group">
          	<label class="col-sm-1 control-label no-padding-right"><i>*</i>网站logo： </label>
          	<img id="img_1" alt="图片暂时无法加载" src="<%=request.getContextPath()%>/back/images/image.png" style="border:1px solid #ccc;border-radius:5px;margin:10px;;height: 100px;width: 140px;top:5px;left:400px;position:absolute;">
          	<div class="col-sm-9"><input type="file" name="logo" style="margin-left:10px;background-color: #ccc;width: 260px;" onchange="PreviewImage1(this,'img_1')"/></div>
          </div>
          <div class="form-group">
          	<label class="col-sm-1 control-label no-padding-right"><i>*</i>宣传视频： </label>
          	<video id="video1" autoplay="autoplay" controls="controls" style="border:1px solid #ccc;border-radius:5px;margin:10px;;height: 100px;width: 140px;top:5px;left:550px;position:absolute;" ></video>
          	<div class="col-sm-9"><input type="file" name="xcVideo" id="xcVideo" style="margin-left:10px;background-color: #ccc;width: 260px;" onchange="spPlay()"/></div>
          </div>
          
          <div class="Button_operation"> 
				<button onclick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="fa fa-save "></i>&nbsp;保存</button>
				<button onclick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
		  </div>
		  </form>
        </div>
<script type="text/javascript">
function getFileName(o){
    var pos=o.lastIndexOf("\\");
    alert(o.substring(pos+1));
    return o.substring(pos+1);  
}
function spPlay(){
	var path ="D:/video/"+ getFileName($('#xcVideo').val()); 
	$("#video1").attr("src",path);
}
</script>      
        <!-- 屏蔽词 -->
		<div id="other" class="tab-pane">
		   <div class="form-group"><label class="col-sm-1 control-label no-padding-right" for="form-field-1"><i>*</i>屏蔽词： </label>
          <div class="col-sm-9"><textarea class="textarea"></textarea></div>          
          </div>
          <div class="Button_operation"> 
				<button onclick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="fa fa-save "></i>&nbsp;保存</button>
				<button onclick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
	    </div>
		</div>
		</div>
 </div>
</div>
</body>
</html>
