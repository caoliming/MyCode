package cn.com.clm.utils;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/userServlet")
public class userServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	public String sendMessage(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String name=req.getParameter("username");;
		String content=req.getParameter("textarea");
		String face=req.getParameter("face");
		String sendTime = new Date().toLocaleString();
		
		ServletContext application = req.getServletContext();
		//  从ServletContext中获取消息
		String sourceMessage = (String) application.getAttribute("message");
		// 拼接发言的内容:xx 对 yy 说 xxx
		if(sourceMessage==null){
			sourceMessage="";
		}
		sourceMessage +="["+sendTime +"]"+ "<font color='blue'><strong>" + name
				+ "</strong></font>"+"<font color='red'>"+face+"</font>"+"说："+ content + "</font>"
				+  "<br>";
		// 将消息存入到application的范围
		application.setAttribute("message", sourceMessage);
		return getMessage(req, resp);
	}
	
	/*获取消息的方法*/
	public String getMessage(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String message = (String) getServletContext().getAttribute("message");
		if(message != null){
			resp.getWriter().println(message);
		}
		return null;
	}
   

}
