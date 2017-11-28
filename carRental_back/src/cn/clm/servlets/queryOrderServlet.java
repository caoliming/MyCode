package cn.clm.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.clm.services.OrderService;
import cn.clm.utils.BaseServlet;
@WebServlet("/queryOrderServlet")
public class queryOrderServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private List<Map<String,Object>> list;
	
	/*查询所有的订单*/
	public String getAllOrder(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		OrderService orderService = new OrderService();
		list = orderService.getAllOrder();
		if(null!=list){
			req.setAttribute("order", list);
			req.setAttribute("num", orderService.getOrderStateNum());
			req.setAttribute("all", list.size());
			return "/back/Orderform.jsp";
		}
		return null;
	}
	
	/*依据订单状态条件查询订单*/
	public String getOrderByState(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String o_state = req.getParameter("o_state");
		System.out.println("o_state:"+o_state);
		OrderService orderService = new OrderService();
		list = orderService.getPayOrder(o_state);
		System.out.println("list:"+list);
		req.setAttribute("order", list);
		req.setAttribute("num", orderService.getOrderStateNum());
		req.setAttribute("all", orderService.getAllOrder().size());
		return "/back/Orderform.jsp";
	}

	/*依据订单号/提车时间查询订单*/
	public String getOrderByTj(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String o_code=req.getParameter("o_code");
		if(o_code == null){
			o_code="";
		}
		String startDate=req.getParameter("startDate");
		if(startDate == null){
			startDate="";
		}
		OrderService orderService = new OrderService();
		list = orderService.getOrderByTj(o_code, startDate);
		req.setAttribute("order", list);
		req.setAttribute("num", orderService.getOrderStateNum());
		req.setAttribute("all", orderService.getAllOrder().size());
		return "/back/Orderform.jsp";
	}
	
	
	
	
	
	

}
