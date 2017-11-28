package cn.clm.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import cn.clm.services.CarService;
import cn.clm.utils.ImageFindUtil;

@MultipartConfig
public class queryCarByImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Part part=request.getPart("img");
		String realName=part.getSubmittedFileName();
		
		String sourceImg=ImageFindUtil.path+realName;
		System.out.println("sourceImg:"+sourceImg);
		
		/*生成目标图片的指纹*/
		String sourceImgFingure = ImageFindUtil.produceFingerPrint(sourceImg);
		
		CarService c =new CarService();
		
		List<Map<String,Object>> allImg = c.findFinger(sourceImgFingure);
		
		
		request.setAttribute("allImg", allImg);
		
		request.getRequestDispatcher("/back/queryCarByImg.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
