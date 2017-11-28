package cn.clm.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.clm.services.userService;

@WebServlet("/queryUserByNDServlet")
public class queryUserByNDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*分页*/
		String page=request.getParameter("page");
		if(page == null){
			page="1";
		}
		String name=request.getParameter("name");
		if(name == null){
			name="";
		}
		String date=request.getParameter("date");
		if(date == null){
			date="";
		}
		userService u =new userService();
		request.setAttribute("pageDate",u.pageByND(Integer.parseInt(page),name,date));
		request.getRequestDispatcher("/back/userList.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
