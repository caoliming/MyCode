package cn.com.clm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import cn.com.clm.beans.Order;
import cn.com.clm.beans.OrderInfo;
import cn.com.clm.beans.User;
import cn.com.clm.services.OrderService;
import cn.com.clm.services.UserService;

@Controller
@SessionAttributes("user")
@Scope("prototype")
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private UserService userService;
	@Autowired
	private OrderService orderService;
	
	
	/*依据o_code将订单状态修改为已支付*/
	@ResponseBody  
	@RequestMapping(value="/orderResult", method=RequestMethod.POST)  
	public void updateOrderResult(HttpServletRequest request) throws Exception { 
		String o_code = request.getParameter("o_code");
		orderService.setOrderState("已支付", o_code);
	}  

	
	/*跳转到支付页面*/
	@ResponseBody  
	@RequestMapping(value="/pay", method=RequestMethod.GET)  
	public ModelAndView PayOrder(HttpServletRequest request) throws Exception { 
		String viewName="payOrder";
		ModelAndView modelAndView = new ModelAndView(viewName);
		
		String o_code = request.getParameter("o_code");
		String u_card = request.getParameter("u_card");
		OrderInfo orderInfo = orderService.getOrderInfo(o_code);
	    
	    modelAndView.addObject("user", userService.getUserCore(u_card));
	    modelAndView.addObject("orderInfo", orderInfo);
		 
		return modelAndView;
	}  
	
	
	
	/*依据o_code 取消订单（已取消）,并设置汽车状态（Y：可租用）*/
	@ResponseBody  
	@RequestMapping(value="/qxOrder", method=RequestMethod.GET)  
	public ModelAndView qxOrder(HttpServletRequest request) throws Exception { 
		String o_code = request.getParameter("o_code");
		String u_card = request.getParameter("u_card");
		
		orderService.setOrderState("已取消",o_code);
		
		String viewName="orderList";
	    ModelAndView modelAndView = new ModelAndView(viewName);
	    
	    List<Order> orders = orderService.getOrders(u_card);
	    modelAndView.addObject("user", userService.getUserCore(u_card));
	    modelAndView.addObject("orders", orders);
	    
	    /*订单统计*/
		modelAndView.addObject("PayOrders", orderService.getPayOrder(u_card));
		modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(u_card));
		modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(u_card));
		modelAndView.addObject("BXOrders", orderService.getBXOrder(u_card));
		 
		return modelAndView;
	}  
	
	/*依据订单号查询订单*/
	@ResponseBody  
	@RequestMapping(value="/cxOrder", method=RequestMethod.GET)  
	public ModelAndView cxOrder(HttpServletRequest request) throws Exception { 
		String o_code = request.getParameter("o_code");
		String u_card = request.getParameter("u_card");
		
		String viewName="orderList";
		ModelAndView modelAndView = new ModelAndView(viewName);
		
		List<Order> orders = orderService.getOwnOrders(o_code,u_card);
		modelAndView.addObject("user", userService.getUserCore(u_card));
		modelAndView.addObject("orders", orders);
		
		/*订单统计*/
		modelAndView.addObject("PayOrders", orderService.getPayOrder(u_card));
		modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(u_card));
		modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(u_card));
		modelAndView.addObject("BXOrders", orderService.getBXOrder(u_card));
		
		return modelAndView;
	}  
	
	/*依据订单状态查询订单*/
	@ResponseBody  
	@RequestMapping(value="/grtOrderByTj", method=RequestMethod.GET)  
	public ModelAndView grtOrderByTj(HttpServletRequest request) throws Exception { 
		String o_state = request.getParameter("o_state");
		String u_card = request.getParameter("u_card");
		
		String viewName="orderList";
		ModelAndView modelAndView = new ModelAndView(viewName);
		
		List<Order> orders = orderService.getOrdersByTj(o_state,u_card);
		modelAndView.addObject("user", userService.getUserCore(u_card));
		modelAndView.addObject("orders", orders);
		
		/*订单统计*/
		modelAndView.addObject("PayOrders", orderService.getPayOrder(u_card));
		modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(u_card));
		modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(u_card));
		modelAndView.addObject("BXOrders", orderService.getBXOrder(u_card));
		
		return modelAndView;
	}  
	
	/*依据o_code查询订单详情*/
	@ResponseBody  
	@RequestMapping(value="/orderInfo", method=RequestMethod.POST)  
	public OrderInfo getOrderInfo(HttpServletRequest request) throws Exception { 
		String o_code = request.getParameter("o_code");
		OrderInfo oi = orderService.getOrderInfo(o_code);
		System.out.println("OrderController->oi:"+oi);
		return oi;
	}  
	
	@ResponseBody
	@RequestMapping(value="/makeOrderList",method=RequestMethod.GET)
    public ModelAndView makeOrderList(HttpServletRequest request) throws Exception {
		String viewName="orderList";
		/*生成订单并依据u_card查询所有的订单*/
		String u_card = request.getParameter("u_card");
		String orderList = request.getParameter("orderList");
		/*添加订单*/
		orderService.makeOrder(orderList, u_card);
		/*获取所有的订单*/
		List<Order> orders = orderService.getOrders(u_card);
		System.out.println("orders:"+orders);
		
        ModelAndView modelAndView = new ModelAndView(viewName);
        modelAndView.addObject("user", userService.getUserCore(u_card));
        modelAndView.addObject("orders", orders);
        
        /*订单统计*/
		modelAndView.addObject("PayOrders", orderService.getPayOrder(u_card));
		modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(u_card));
		modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(u_card));
		modelAndView.addObject("BXOrders", orderService.getBXOrder(u_card));
        
        return modelAndView;
	}
	
	/*获取所有的订单*/
	@ResponseBody
	@RequestMapping(value="/getOrders",method=RequestMethod.GET)
	public ModelAndView getOrders(HttpServletRequest request,@ModelAttribute("user") User user) throws Exception {
		String viewName="orderList";
		String u_card = user.getU_card();
		List<Order> orders = orderService.getOrders(u_card);
		System.out.println("orders:"+orders);
		
		ModelAndView modelAndView = new ModelAndView(viewName);
		modelAndView.addObject("user", userService.getUserCore(u_card));
		modelAndView.addObject("orders", orders);
		
		/*订单统计*/
		modelAndView.addObject("PayOrders", orderService.getPayOrder(u_card));
		modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(u_card));
		modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(u_card));
		modelAndView.addObject("BXOrders", orderService.getBXOrder(u_card));
		
		return modelAndView;
	}

}
