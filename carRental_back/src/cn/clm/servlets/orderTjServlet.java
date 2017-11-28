package cn.clm.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.clm.services.OrderService;

@WebServlet("/orderTjServlet")
public class orderTjServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// *总 ，未支付，已取消 ，*已支付，*已提车，*已还车 （5个状态的总数1个数组+4个按月份的数组）
		OrderService orderService = new OrderService();
		int []num = orderService.getOrderAllNum();
		String Num="";
		for(int i=0;i<num.length;i++){
			Num+=num[i];
			Num+=i==(num.length-1)?"":"-";
		}
		
		int []qbNum = orderService.getOrderNumBySate("全部");
		String QbNum="";
		for(int i=0;i<qbNum.length;i++){
			QbNum+=qbNum[i];
			QbNum+=i==(qbNum.length-1)?"":"-";
		}
		int []yzfNum = orderService.getOrderNumBySate("已支付");
		String YzfNum="";
		for(int i=0;i<yzfNum.length;i++){
			YzfNum+=yzfNum[i];
			YzfNum+=i==(yzfNum.length-1)?"":"-";
		}
		int []yhcNum = orderService.getOrderNumBySate("已还车");
		String YhcNum="";
		for(int i=0;i<yhcNum.length;i++){
			YhcNum+=yhcNum[i];
			YhcNum+=i==(yhcNum.length-1)?"":"-";
		}
		int []ytcNum = orderService.getOrderNumBySate("已提车");
		String YtcNum="";
		for(int i=0;i<ytcNum.length;i++){
			YtcNum+=ytcNum[i];
			YtcNum+=i==(ytcNum.length-1)?"":"-";
		}
		int []wzfNum = orderService.getOrderNumBySate("未支付");
		String WzfNum="";
		for(int i=0;i<wzfNum.length;i++){
			WzfNum+=wzfNum[i];
			WzfNum+=i==(wzfNum.length-1)?"":"-";
		}
		int []yqxNum = orderService.getOrderNumBySate("已取消");
		String YqxNum="";
		for(int i=0;i<yqxNum.length;i++){
			YqxNum+=yqxNum[i];
			YqxNum+=i==(yqxNum.length-1)?"":"-";
		}
		
		request.setAttribute("num", Num);
		request.setAttribute("qbNum", QbNum);
		request.setAttribute("yzfNum", YzfNum);
		request.setAttribute("yhcNum", YhcNum);
		request.setAttribute("ytcNum", YtcNum);
		request.setAttribute("wzfNum", WzfNum);
		request.setAttribute("yqxNum", YqxNum);
		request.getRequestDispatcher("/back/orderTj.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
