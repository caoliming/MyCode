package cn.clm.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.clm.services.BiaoZhiSercice;
import cn.clm.services.TypeService;
import cn.clm.utils.BaseServlet;

@WebServlet("/queryTypeServlet")
public class queryTypeServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
private List<Map<String,Object>> list;
	
	public String getAllType(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		System.out.println("getAllType Method....");
		TypeService te = new TypeService();
		list = te.queryAllType();
		if(null!=list){
			req.setAttribute("allType", list);
			return "/back/carType.jsp";
		}
		return null;
	}
	
	public String getOneType(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String type = req.getParameter("type");
		System.out.println("getOneType Method....type"+type);
		TypeService ts = new TypeService();
		
		list = ts.queryOneType(type);
		if(null!=list){
			req.setAttribute("allType", list);
			return "/back/carType.jsp";
		}
		return null;
	}
}
