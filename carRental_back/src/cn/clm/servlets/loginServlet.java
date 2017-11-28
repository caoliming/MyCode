package cn.clm.servlets;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.clm.models.Manager;
import cn.clm.services.ManagerService;


@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String code = request.getParameter("code");
		
		String managerSessionCode = request.getSession().getAttribute("randCheckCode").toString();
		
		if(!code.equals(managerSessionCode)){
			request.setAttribute("loginInfo", "1");
			request.getRequestDispatcher("/back/login.jsp").forward(request, response);
		}else{
			Manager manager = new Manager(name, pass);
			ManagerService managerService = new ManagerService();
			Map<String,Object> currnetManager = managerService.login(manager);
			if(null==currnetManager){
				request.setAttribute("loginInfo", "0");
				request.getRequestDispatcher("/back/login.jsp").forward(request, response);
			}else{
				request.getSession().setAttribute("managerName", currnetManager.getOrDefault("m_name", "").toString());
				request.getSession().setAttribute("managerCard", currnetManager.getOrDefault("m_card", "").toString());
				request.getSession().setAttribute("manager", currnetManager);
				request.getRequestDispatcher("/back/index.jsp").forward(request, response);
			}
		}
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
