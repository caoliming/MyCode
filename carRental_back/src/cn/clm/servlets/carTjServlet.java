package cn.clm.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.clm.services.CarService;

@WebServlet("/carTjServlet")
public class carTjServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CarService cs = new CarService();
		int a[] = cs.getPrice();
		
		//查询状态
		request.setAttribute("car0", cs.getKyCar());
		request.setAttribute("car1", cs.getYyCar());
		request.setAttribute("car2", cs.getYzCar());
		
		//查询租价
		request.setAttribute("num0",a[0]);
		request.setAttribute("num1",a[1]);
		request.setAttribute("num2",a[2]);
		request.setAttribute("num3",a[3]);
		request.setAttribute("num4",a[4]);
		
		//汽车品牌
		request.setAttribute("markList", cs.getMarkNum());
		
		//汽车类型
		request.setAttribute("typeList", cs.getTypeNum());
		
		
		request.getRequestDispatcher("/back/carTj.jsp").forward(request, response); ;
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
