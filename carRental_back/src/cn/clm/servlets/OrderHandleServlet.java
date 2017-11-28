package cn.clm.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.clm.services.OrderService;
import cn.clm.utils.BaseServlet;

@WebServlet("/OrderHandleServlet")
public class OrderHandleServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private List<Map<String,Object>> list;
	
	/*用户提车*/
	public String TiChe(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String o_code = req.getParameter("o_code");
		OrderService orderService = new OrderService();
		list = orderService.getAllOrder();
		/*修改订单状态为已提车，修改汽车状态为 N：已租出*/
		orderService.updateOrderState("N","已提车", o_code);
		if(null!=list){
			req.setAttribute("order", list);
			req.setAttribute("num", orderService.getOrderStateNum());
			req.setAttribute("all", list.size());
			return "/queryOrderServlet?method=getAllOrder";
		}
		return null;
	}
	/*用户还车*/
	public String HuanChe(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String o_code = req.getParameter("o_code");
		OrderService orderService = new OrderService();
		list = orderService.getAllOrder();
		/*修改订单状态为已还车，修改汽车状态为 Y：可租用*/
		orderService.updateOrderState("Y","已还车", o_code);
		if(null!=list){
			req.setAttribute("order", list);
			req.setAttribute("num", orderService.getOrderStateNum());
			req.setAttribute("all", list.size());
			return "/queryOrderServlet?method=getAllOrder";
		}
		return null;
	}
}
