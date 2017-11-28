<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>用户中心</title>
<link rel="stylesheet" type="text/css" href="/liancheng_product/common/css/general.css" />
<!-- 图片回显的函数 -->
<script src="/liancheng_product/js/upload.js"></script>
<script type="text/javascript">
	/* js检验 */
	function checkType(){
		var pType=document.getElementById("pType");//定位ID
		var typeIndex= pType.selectedIndex;//选中索引
		var typeText=pType.options[typeIndex].text;//选中文本
		if(typeText =="请选择类型"){
			document.getElementById("Type").innerHTML="请选择类型记得选择";
			return false;
		}else{
			return true;
		}
	}
	
	function checkCode(){
		var pCode=document.getElementById("pCode").value;
		if(pCode == ""){
			document.getElementById("Code").innerHTML="产品编号不能为空";
			return false;
		}else{
			return true;
		}
	}
	 
	function checkName(){
		var pName=document.getElementById("pName").value;
		if(pName == ""){
			document.getElementById("Name").innerHTML="产品名称不能为空";
			return false;
		}else{
			return true;
		}
	}
	function checkPrice(){
		var pPrice=document.getElementById("pPrice").value;
		if(pPrice == ""){
			document.getElementById("Price").innerHTML="产品价格不能为空";
			return false;
		}else{
			return true;
		}
	}

	function checkDate(){
		var pDate=document.getElementById("pDate").value;
		if(pDate == ""){
			document.getElementById("Date").innerHTML="产品生产日期不能为空";
			return false;
		}else{
			return true;
		}
	}
	function checkDate1(){
		var pDate1=document.getElementById("pDate1").value;
		if(pDate1 == ""){
			document.getElementById("Date1").innerHTML="产品价格不能为空";
			return false;
		}else{
			return true
		}
	}
	function checkIntroduce(){
		var pIntroduce=document.getElementById("pIntroduce").value;
		if(pIntroduce == ""){
			document.getElementById("Introduce").innerHTML="产品价格不能为空";
			return false;
		}else{
			return true;
		}
	}
	
	function checkDount(){
		var pDiscount=document.getElementById("pDiscount").value;
		if(pDiscount !=""){
			if(0<pDiscount && pDiscount<1 ){
				return true;
			}else{
				document.getElementById("Discount").innerHTML="请输入0-1之间的小数";
				return false;
			}
		}else{
			return true;
		}
		
	}
	function checkImg(){
		var img=document.getElementById("pImage").value;
		if(img ==""){
			document.getElementById("Image").innerHTML="图片不能为空";
			return false;
		}else{
			return true;
		}

	}
	function checkAll(){
		return checkType()&&checkCode()&&checkPrice()&&checkName()&&checkDate()&&checkDate1()&&checkIntroduce()&&checkDount()&&checkImg();
	}  
	
	var xmlHttp;
	function getXmlHttp(){
		return new XMLHttpRequest();
	}
	function init(){
		/*1.创建XMLHttpRequest*/
		xmlHttp=getXmlHttp();
		/*
			2.设置请求的参数
			true;异步
			false:同步
		*/
		xmlHttp.open("get", "/liancheng_product/AJAXClassifyServlet", true);
		/*
			3.监听异步请求的状态的变化
			onreadystatechange:当请求的状态发生改变的时候回调函数
		*/
		xmlHttp.onreadystatechange=classify;
		xmlHttp.send();
	}
	function classify(){
		if(xmlHttp.status == 200 && xmlHttp.readyState==4){
			/*获取JSON格式的字符串*/
			var JSONText=xmlHttp.responseText;
			/*将JSON格式的字符串转化为JS对象*/
			var names=eval(JSONText);
			var select=document.getElementById("pType");//获取select
			var name=null;
			var option=null;
			for(var i=0;i<names.length;i++){
				name=names[i]
				option=document.createElement("option");
				option.value=name.ap_name;
				option.appendChild(document.createTextNode(name.ap_name));
				select.appendChild(option);
			}
		}
	}
</script>
 </head>
<body onload="init()">
<div class="main-wrap">
	<div class="crumb-wrap">
		<div class="crumb-list">
			<i class="icon-font"></i>当前位置<span class="crumb-step">&gt;</span><span
				class="crumb-name">书籍添加</span>
		</div>
	</div>
	<div class="result-wrap">
            <div class="result-content">
             <span style="color: red; font-weight: 900;text-align: center;">${requestScope.msg}${requestScope.fail}</span>
                <form action="/liancheng_product/paths" method="post" id="myform" name="myform" enctype="multipart/form-data"onsubmit="return checkAll()">
                    <table class="insert-tab" width="100%">
                        <tbody>
                        <tr>
                            <th width="120"><i class="require-red">*</i>农产品类型:&nbsp;</th>
                            <td>
                                <select name="pType" id="pType" class="required" onblur="checkType()">
                                    <option value="请选择类型" >请选择类型</option>
                                </select>
                                 <span id="Type" style="color: red; font-weight: 900"></span>
                            </td>
                        </tr>
                            <tr>
                                <th><i class="require-red">*</i>产品编号:&nbsp;&nbsp;</th>
                                <td>
                                    <input class="common-text required" id="pCode" name="pCode" size="50"  type="text" onblur="checkCode()">
                                    <span id="Code" style="color: red; font-weight: 900"></span>
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>产品名称:&nbsp;&nbsp;</th>
                                <td>
                                    <input class="common-text required" id="pName" name="pName" size="15" value="${requestScope.addBook.bookName }" type="text" onblur="checkName()">
                                     <span id="Name" style="color: red; font-weight: 900">${requestScope.errMap.bookName }</span>
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>产品原价格:&nbsp;</th>
                                <td>	
                                	  <input class="common-text required" id="pPrice" name="pPrice" size="15" value="${requestScope.addBook.bookPrice }" type="text" onblur="checkPrice()">
                                
                                     <span id="Price" style="color: red; font-weight: 900">${requestScope.errMap.bookPrice }</span>
                                </td>
                            </tr>
                            <tr>
                                <th style="color: red;"><i class="require-red" >*</i>是否打折:&nbsp;&nbsp;</th>
                                <td>
                                    	<input type="radio" name="discount" value="0.5"/>5折&nbsp;&nbsp;
                                    	<input type="radio" name="discount" value="0.6"/>6折&nbsp;&nbsp;
                                    	<input type="radio" name="discount" value="0.7"/>7折&nbsp;&nbsp;
                                    	<input type="radio" name="discount" value="0.8"/>8折&nbsp;&nbsp;
                                    	<input type="radio" name="discount" value="0.9"/>9折&nbsp;&nbsp;
                                    	<input type="text"  id="pDiscount" name="discount" size="2" onblur="checkDount()">&nbsp;折
                                     <span id="Discount" style="color: red; font-weight: 900">${requestScope.errMap.bookPrice }</span>
                                </td>
                            </tr>
                             <tr>
                                <th><i class="require-red">*</i>产品生产日期:</th>
                                <td>
                                    <input class="common-text required" id="pDate" name="pDate" size="15" value="${requestScope.addBook.bookPrice }" type="date" onblur="checkDate()">
                                     <span id="Date"  style="color: red; font-weight: 900">${requestScope.errMap.bookPrice }</span>
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>产品生保质期:</th>
                                <td>
                                    <input class="common-text required" id="pDate1" name="pDate1" size="15" value="${requestScope.addBook.bookPrice }" type="text" onblur="checkDate1()"><label>天</label>
                                     <span id="Date1"  style="color: red; font-weight: 900">${requestScope.errMap.bookPrice }</span>
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>产品图片:</th>
                                <td>
                                	<img id="image" name="image" width="220px" height="200px" >
									<input type="file" id="pImage" onchange="previewImage(this,'image')" name="image"onblur="checkImg()"/>
									<span id="Image" style="color: red; font-weight: 900">${requestScope.errMap.upload_path}</span>
								</td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>产品描述:</th>
                                <td>
                                <textarea name="pIntroduce" class="common-textarea" id="pIntroduce" cols="30" style="width: 98%;text-indent: 2em;" rows="10" onblur="checkIntroduce()">${requestScope.addBook.bookIntroduce}</textarea>
                              	<span  id="Introduce" style="color: red; font-weight: 900">${requestScope.errMap.bookIntroduce}</span>	
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="添加" type="submit">
                                    <input class="btn btn6" onclick="history.go(-1)" value="重置" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>
    </div>
   
<!--/main-->
</body>
</html>