package cn.com.clm.utils;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/sendVerifyCodeServlet")
public class sendVerifyCodeServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	/*获取sessionCode的方法*/
	public String getsessionCode(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String sessionCode = (String) req.getSession().getAttribute("sessionCode");
		System.out.println("sendVerifyCodeServlet->sessionCode:"+sessionCode);
		resp.getWriter().println(sessionCode);
		return null;
	}
	
	/*获取日期差值*/
	public String getDate(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String days = req.getParameter("days");
		String price = req.getParameter("price");
		double allMoney = MoneyUtil.getAllMoney(Integer.parseInt(days),Double.parseDouble(price));
		DecimalFormat df = new DecimalFormat("#.0");  
		resp.getWriter().println(df.format(allMoney));
		return null;
	}
       
   
}
