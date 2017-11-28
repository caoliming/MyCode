package cn.clm.servlets;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import cn.clm.models.Biaozhi;
import cn.clm.services.BiaoZhiSercice;
import cn.clm.utils.HttpUtils;

@MultipartConfig
public class addCarMarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String image;
	
	public void init(ServletConfig config) throws ServletException {
		image = config.getInitParameter("image");
		System.out.println("init:"+image);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*1.判断如果两个值相等，说明同一时间键入，然后把session 中存储的值移出
		若不等，就说明有一个是页面上重新注入的值，会造成表单的重复提交
		若不等的值，就直接使用重定向跳转跳回添加页面，重新来过*/
		HttpSession session = request.getSession();
		String oldHidden = request.getParameter("zlm");
		Object token = session.getAttribute("token");
		System.out.println("oldHidden:"+oldHidden+" , session:"+token);
		if(token!=null && token.equals(oldHidden)){
			session.removeAttribute("token");
		}else{
			//重定向跳转
			response.sendRedirect(request.getContextPath()+"/back/addMark.jsp");
			return;
		}
		
		/*2.获取表单置*/
		String mark = request.getParameter("mark");
		String date = request.getParameter("date");
		String introduce = request.getParameter("introduce");
		
		Part part=request.getPart("img");
		image=HttpUtils.fileUpload(part, image);
		
		/*3.将输入的数据存入数据库*/
		Biaozhi bz = new Biaozhi(mark, introduce, image, date);
		BiaoZhiSercice bzs = new BiaoZhiSercice();
		boolean result = bzs.addMark(bz);
		
		if(result){
			System.out.println("【添加成功】");
			request.setAttribute("addInfo", "1");
		}else{
			System.out.println("【添加失败】");
			request.setAttribute("addInfo", "0");
		}
		
		/*4.页面跳转*/
		request.getRequestDispatcher("/back/addMark.jsp").forward(request, response);
		
		
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
