package cn.clm.servlets;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.clm.services.CarService;
import cn.clm.utils.BaseServlet;

@WebServlet("/queryCarServlet")
public class queryCarServlet extends  BaseServlet{
	private static final long serialVersionUID = 1L;
    private List<Map<String,Object>> list;
	
	public String getAllCar(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		System.out.println("getAllCar Method....");
		CarService cs = new CarService();
		list = cs.queryAllCar();
		if(null!=list){
			req.setAttribute("allCar", list);
			return "/back/carList.jsp";
		}
		return null;
	}
	
	public String getOneCar(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String code=req.getParameter("code");
		System.out.println("getOneCar Method....code-》"+code);
		CarService cs = new CarService();
		list = cs.queryOneCar(code);
		if(null!=list){
			req.setAttribute("car", list);
			return "/back/carInfo.jsp";
		}
		return null;
	}
	
	public String getOneCarInfo(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String code=req.getParameter("code");
		System.out.println("getOneCarInfo Method....code-》"+code);
		CarService cs = new CarService();
		list = cs.queryOneCar(code);
		if(null!=list){
			req.setAttribute("allCar", list);
			return "/back/carList.jsp";
		}
		return null;
	}

}
