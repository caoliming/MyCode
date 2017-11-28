package cn.com.clm.utils;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.stereotype.Controller;

import cn.com.clm.beans.User;
import cn.com.clm.beans.UserPb;
import cn.com.clm.services.UserService;
import cn.com.clm.services.impl.UserServiceImpl;

@Controller
@MultipartConfig
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String image;
	
	public void init(ServletConfig config) throws ServletException {
		image = config.getInitParameter("image");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String u_name = request.getParameter("u_name");
		String u_sex = request.getParameter("u_sex");
		String date = request.getParameter("u_date");
		String u_card = request.getParameter("u_card");
		String u_jscard = request.getParameter("u_jscard");
		String u_address = request.getParameter("u_address");
		String u_pass = request.getParameter("u_pass");
		String u_phone = request.getParameter("u_phone");
		
		Part part=request.getPart("u_img");
		image=HttpUtils.fileUpload(part, image);

		String u_date = new Date().toLocaleString().substring(0, 9);
		int age = dateUtil.getYearSub(date, u_date);
		
		User user = new User(u_name, u_pass, u_sex, age, u_card, u_address, u_phone, image, u_jscard, u_date);
		UserPb userPb = new UserPb(u_card, 0, 0);
		UserService userService = new UserServiceImpl();
		int result = userService.registerUser(user);
		int result1 = userService.registerUserPb(userPb);
		if(result>0&&result1>0){
			System.out.println("【注册成功！】");
		}else{
			System.out.println("【注册失败！】");
		}
		request.getRequestDispatcher("login").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
