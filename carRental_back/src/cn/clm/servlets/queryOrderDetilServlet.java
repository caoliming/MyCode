package cn.clm.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.clm.services.OrderService;
@WebServlet("/queryOrderDetilServlet")
public class queryOrderDetilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String o_code = request.getParameter("o_code");
		OrderService orderService = new OrderService();
		Map<String,Object> order = orderService.getOrderDetil(o_code);
		request.setAttribute("order", order);
		request.getRequestDispatcher("/back/orderDetil.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
