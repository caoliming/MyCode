package cn.clm.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.clm.services.MessageService;

@WebServlet("/backMessageServlet")
public class backMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m_id = request.getParameter("m_id");
		String content = request.getParameter("content");
		MessageService messageService = new MessageService();
		int result = messageService.backMessage(m_id, content);
		if(result>0){
			System.out.println("【回复成功！】");
		}else{
			System.out.println("【回复失败！】");
		}
		request.getRequestDispatcher("/queryMessageServlet").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
