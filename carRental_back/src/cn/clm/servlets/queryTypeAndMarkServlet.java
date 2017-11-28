package cn.clm.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.clm.services.BiaoZhiSercice;
import cn.clm.services.TypeService;


@WebServlet("/queryTypeAndMarkServlet")
public class queryTypeAndMarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取到所有的类型和品牌后请求转发到 /back/car_add.jsp页面，遍历出类型和品牌，以便完成汽车信息添加
		BiaoZhiSercice bs = new BiaoZhiSercice();
		request.setAttribute("mark", bs.queryAllMark());
		
		TypeService ts = new TypeService();
		request.setAttribute("type", ts.queryAllType());
		
		request.getRequestDispatcher("/back/car_add.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
