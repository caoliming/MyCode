package cn.clm.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.clm.services.BiaoZhiSercice;
import cn.clm.utils.BaseServlet;

@WebServlet("/queryMarkServlet")
public class queryMarkServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private List<Map<String,Object>> list;
	
	public String getAllMark(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		System.out.println("getAllMark Method....");
		BiaoZhiSercice bzs = new BiaoZhiSercice();
		list = bzs.queryAllMark();
		if(null!=list){
			req.setAttribute("allMark", list);
			return "/back/carMark.jsp";
		}
		return null;
	}
	
	public String getOneMark(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String mark = req.getParameter("mark");
		System.out.println("getOneMark Method....mark"+mark);
		BiaoZhiSercice bzs = new BiaoZhiSercice();
		
		list = bzs.queryOneMark(mark);
		if(null!=list){
			req.setAttribute("allMark", list);
			return "/back/carMark.jsp";
		}
		return null;
	}
	

}
