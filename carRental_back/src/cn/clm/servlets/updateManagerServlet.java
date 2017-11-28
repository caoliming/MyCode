package cn.clm.servlets;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.clm.services.ManagerService;
import cn.clm.utils.BaseServlet;

@WebServlet("/updateManagerServlet")
public class updateManagerServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	/*修改密码*/
	public String updatePass(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String pass = req.getParameter("pass");
		ManagerService managerService = new ManagerService();
		String m_card = req.getSession().getAttribute("managerCard").toString();
		managerService.updatePass(pass,m_card);
		return "/back/admin_info.jsp";
	}
	/*修改信息*/
	public String updateManager(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String info = req.getParameter("info");
		ManagerService managerService = new ManagerService();
		String m_card = req.getSession().getAttribute("managerCard").toString();
		managerService.updateManager(info,m_card);
		return "/back/admin_info.jsp";
	}

}
