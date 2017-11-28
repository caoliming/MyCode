<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>  
<head>  
    <title>Test生成二维码,支持中文</title>  
   <script type="text/javascript" src="<%=request.getContextPath() %>/back/js/jquery-1.7.2.min.js"></script>
    <script src="<%=request.getContextPath() %>/back/js/jquery.qrcode.min.js" type="text/javascript"></script>  
    <script type="text/javascript">  
        function utf16to8(str) {  
            var out, i, len, c;  
            out = "";  
            len = str.length;  
            for (i = 0; i < len; i++) {  
                c = str.charCodeAt(i);  
                if ((c >= 0x0001) && (c <= 0x007F)) {  
                    out += str.charAt(i);  
                } else if (c > 0x07FF) {  
                    out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));  
                    out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));  
                    out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));  
                } else {  
                    out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));  
                    out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));  
                }  
            }  
            return out;  
        }  
        $(function () {  
            jQuery('#output').qrcode(utf16to8("风行天下租车系统欢迎你，网址:http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3DJSChart%3A%20Input%20data%20in%20wrong%20format%20for%20selected%20chart%20type"));  
        })      
    </script>  
</head>  
<body>  
<div id="output"></div>  
</body>  
</html>