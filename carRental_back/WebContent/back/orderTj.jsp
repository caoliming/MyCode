<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
String num  = (String)request.getAttribute("num"); 
String Num[]=new String[5];
Num=num.split("-");

/* 全部 */
String qbNum  = (String)request.getAttribute("qbNum"); 
String QbNum[]=qbNum.split("-");
/* 已支付*/
String yzfNum  = (String)request.getAttribute("yzfNum"); 
String YzfNum[]=yzfNum.split("-");
/* 已还车 */
String yhcNum  = (String)request.getAttribute("yhcNum"); 
String YhcNum[]=yhcNum.split("-");
/* 已提车 */
String ytcNum  = (String)request.getAttribute("ytcNum"); 
String YtcNum[]=ytcNum.split("-");
/* 未支付 */
String wzfNum  = (String)request.getAttribute("wzfNum"); 
String WzfNum[]=wzfNum.split("-");
/* 已取消 */
String yqxNum  = (String)request.getAttribute("yqxNum"); 
String YqxNum[]=yqxNum.split("-");
%>
<html>
<head>
<link href="<%=request.getContextPath() %>/back/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/css/style.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/assets/css/font-awesome.min.css" />
        <link href="<%=request.getContextPath() %>/back/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/back/font/css/font-awesome.min.css" />
		<script src="<%=request.getContextPath() %>/back/js/jquery-1.9.1.min.js" type="text/javascript"></script>       
        <script src="<%=request.getContextPath() %>/back/assets/dist/echarts.js"></script>
        <script src="<%=request.getContextPath() %>/back/assets/js/bootstrap.min.js"></script>
<title>交易</title>
</head>
<body>
<div class=" page-content clearfix">
 <div class="transaction_style">
   <ul class="state-overview clearfix">
   <!-- 已支付，未支付，*已取消，*已提车，*已还车 -->
    <li class="Info">
     <span class="symbol red"><i class="fa fa-jpy"></i></span>
     <span class="value"><h4>未支付</h4><p class="Quantity color_red"><%=Num[0] %></p></span>
    </li>
     <li class="Info">
     <span class="symbol  blue"><i class="fa fa-shopping-cart"></i></span>
     <span class="value"><h4>已取消</h4><p class="Quantity color_red"><%=Num[1] %></p></span>
    </li>
     <li class="Info">
     <span class="symbol terques"><i class="fa fa-shopping-cart"></i></span>
     <span class="value"><h4>已提车</h4><p class="Quantity color_red"><%=Num[2] %></p></span>
    </li>
     <li class="Info">
     <span class="symbol yellow"><i class="fa fa-shopping-cart"></i></span>
     <span class="value"><h4>已还车</h4><p class="Quantity color_red"><%=Num[3] %></p></span>
    </li>
     <li class="Info">
     <span class="symbol darkblue"><i class="fa fa-jpy"></i></span>
     <span class="value"><h4>已支付</h4><p class="Quantity color_red"><%=Num[4] %></p></span>
    </li>
   </ul>
 
 </div>
 <div class="t_Record">
               <div id="main" style="height:400px; overflow:hidden; width:100%; overflow:auto" ></div>     
              </div> 
</div>
</body>
</html>
<script type="text/javascript">
     $(document).ready(function(){
		 
		  $(".t_Record").width($(window).width()-60);
		  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
		 $(".t_Record").width($(window).width()-60);
		});
 });
	 
	 
        require.config({
            paths: {
                echarts: '<%=request.getContextPath()%>/back/assets/dist'
            }
        });
        require(
            [
                'echarts',
				'echarts/theme/macarons',
                'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                'echarts/chart/bar'
            ],
            function (ec,theme) {
                var myChart = ec.init(document.getElementById('main'),theme);
               option = {
    title : {
        text: '月订单交易记录',
        subtext: '实时获取用户订单租赁记录'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['所有订单','已提车','已支付','已还车','未支付','已取消']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'所有订单',
            type:'bar',
            data:['<%=QbNum[0]%>','<%=QbNum[1]%>','<%=QbNum[2]%>','<%=QbNum[3]%>','<%=QbNum[4]%>','<%=QbNum[5]%>','<%=QbNum[6]%>','<%=QbNum[7]%>','<%=QbNum[8]%>','<%=QbNum[9]%>','<%=QbNum[10]%>','<%=QbNum[11]%>'],
            markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            }           
        },
        {
            name:'已提车',
            type:'bar',
            data:['<%=YtcNum[0]%>','<%=YtcNum[1]%>','<%=YtcNum[2]%>','<%=YtcNum[3]%>','<%=YtcNum[4]%>','<%=YtcNum[5]%>','<%=YtcNum[6]%>','<%=YtcNum[7]%>','<%=YtcNum[8]%>','<%=YtcNum[9]%>','<%=YtcNum[10]%>','<%=YtcNum[11]%>'],
            markPoint : {
                data : [
                    {type : 'max', name: '年最高'},
                    {type : 'min', name: '年最低'}
                ]
            },
           
			
        }
		, {
            name:'已支付',
            type:'bar',
            data:['<%=YzfNum[0]%>','<%=YzfNum[1]%>','<%=YzfNum[2]%>','<%=YzfNum[3]%>','<%=YzfNum[4]%>','<%=YzfNum[5]%>','<%=YzfNum[6]%>','<%=YzfNum[7]%>','<%=YzfNum[8]%>','<%=YzfNum[9]%>','<%=YzfNum[10]%>','<%=YzfNum[11]%>'],
            markPoint : {
                data : [
                    {type : 'max', name: '年最高'},
                    {type : 'min', name: '年最低'}
                ]
            },
           
		}
		, {
            name:'已还车',
            type:'bar',
            data:['<%=YhcNum[0]%>','<%=YhcNum[1]%>','<%=YhcNum[2]%>','<%=YhcNum[3]%>','<%=YhcNum[4]%>','<%=YhcNum[5]%>','<%=YhcNum[6]%>','<%=YhcNum[7]%>','<%=YhcNum[8]%>','<%=YhcNum[9]%>','<%=YhcNum[10]%>','<%=YhcNum[11]%>'],
            markPoint : {
                data : [
                    {type : 'max', name: '年最高'},
                    {type : 'min', name: '年最低'}
                ]
            },
           
		}
		,{
            name:'未支付',
            type:'bar',
            data:['<%=WzfNum[0]%>','<%=WzfNum[1]%>','<%=WzfNum[2]%>','<%=WzfNum[3]%>','<%=WzfNum[4]%>','<%=WzfNum[5]%>','<%=WzfNum[6]%>','<%=WzfNum[7]%>','<%=WzfNum[8]%>','<%=WzfNum[9]%>','<%=WzfNum[10]%>','<%=WzfNum[11]%>'],
            markPoint : {
                data : [
                    {type : 'max', name: '年最高'},
                    {type : 'min', name: '年最低'}
                ]
            },
           
		}
	   ,{
           name:'已取消',
           type:'bar',
           data:['<%=YqxNum[0]%>','<%=YqxNum[1]%>','<%=YqxNum[2]%>','<%=YqxNum[3]%>','<%=YqxNum[4]%>','<%=YqxNum[5]%>','<%=YqxNum[6]%>','<%=YqxNum[7]%>','<%=YqxNum[8]%>','<%=YqxNum[9]%>','<%=YqxNum[10]%>','<%=YqxNum[11]%>'],
           markPoint : {
               data : [
                   {type : 'max', name: '年最高'},
                   {type : 'min', name: '年最低'}
               ]
           },
          
		}
    ]
};
                    
                myChart.setOption(option);
            }
        );
    </script> 