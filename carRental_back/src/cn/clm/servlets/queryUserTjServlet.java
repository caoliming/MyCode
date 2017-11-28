package cn.clm.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.clm.services.userService;

@WebServlet("/queryUserTjServlet")
public class queryUserTjServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*统计到用户的登记数据，转发到userTj.jsp*/
		userService u = new userService();
		Map<String, Integer> m  = new HashMap<String, Integer>();
		m=u.getUserTj();
		System.out.println("queryUserTjServlet:"+m);
		request.setAttribute("userTjMap", m);
		request.getRequestDispatcher("/back/userTj.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
