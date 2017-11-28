package cn.clm.servlets;


import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.clm.utils.BaseServlet;
import cn.clm.utils.sendsms;
@WebServlet("/getSmscodeServlet")
public class getSmscodeServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	/*发送短信的方法*/
	public String getYcode(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String u_phone = (String) req.getParameter("u_phone");
		System.out.println("u_phone："+u_phone);
		
		int mCode  = sendsms.sendMessage(u_phone);
		System.out.println("mCode:"+mCode);
		resp.getWriter().println(String.valueOf(mCode));
		return null;
	}
	
	

}
