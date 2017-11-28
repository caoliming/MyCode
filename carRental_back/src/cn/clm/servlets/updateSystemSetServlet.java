package cn.clm.servlets;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import cn.clm.models.SystemSet;
import cn.clm.services.SystemService;
import cn.clm.utils.HttpUtils;
@MultipartConfig
public class updateSystemSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String logo;
	private String xcVideo;

	public void init(ServletConfig config) throws ServletException {
		logo = config.getInitParameter("logo");
		xcVideo = config.getInitParameter("xcVideo");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		
		Part part=request.getPart("logo");
		logo=HttpUtils.fileUpload(part, logo);
		
		Part part1=request.getPart("xcVideo");
		xcVideo=HttpUtils.fileUpload(part1, xcVideo);
		
		SystemSet set = new SystemSet(name, logo, xcVideo);
		SystemService ss = new SystemService();
		int result = ss.updateSystemSet(set);
		if(result>0){
			request.setAttribute("result", "1");
			System.out.println("【上传成功】");
		}else{
			request.setAttribute("result", "0");
			System.out.println("【上传失败】");
		}
		
		request.getRequestDispatcher("/back/Systems.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
