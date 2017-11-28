package cn.clm.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import cn.clm.models.Car;
import cn.clm.models.CarImage;
import cn.clm.models.ImgFinger;
import cn.clm.services.CarService;
import cn.clm.utils.HttpUtils;
import cn.clm.utils.ImageFindUtil;

@MultipartConfig
public class addCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	
	public void init(ServletConfig config) throws ServletException {
		image1 = config.getInitParameter("image1");
		image2 = config.getInitParameter("image2");
		image3 = config.getInitParameter("image3");
		image4 = config.getInitParameter("image4");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*判断如果两个值相等，说明同一时间键入，然后把session 中存储的值移出
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
			response.sendRedirect(request.getContextPath()+"/back/car_add.jsp");
			return;
		}
		
		/*获取表单值*/
		String date = new Date().toLocaleString().toString().substring(0, 9);
		String code = request.getParameter("code");
		int type = Integer.parseInt(request.getParameter("type"));
		int mark = Integer.parseInt(request.getParameter("mark"));
		String kuanshi = request.getParameter("kuanshi");
		int zuowei = Integer.parseInt(request.getParameter("zuowei"));
		int chemen = Integer.parseInt(request.getParameter("chemen"));
		String ranliao = request.getParameter("ranliao");
		String biansu = request.getParameter("bainsu");
		String zuoyi = request.getParameter("zuoyi");
		String isdao = request.getParameter("isdao");
		String iswindow = request.getParameter("iswindow");
		double price = Double.parseDouble(request.getParameter("price"));
		
		String state = "Y";
		
		//多余了<p>333</p>
		String introduce = request.getParameter("introduce").replace("<p>","").replace("</p>","");
		
		Part part1=request.getPart("img_1");
		image1=HttpUtils.fileUpload(part1, image1);
		
		System.out.println("image1:"+image1);
		
		Part part2=request.getPart("img_2");
		image2=HttpUtils.fileUpload(part2, image2);
		
		Part part3=request.getPart("img_3");
		image3=HttpUtils.fileUpload(part3, image3);
		
		Part part4=request.getPart("img_4");
		image4=HttpUtils.fileUpload(part4, image4);
		
		/*封装数据*/
		Car c = new Car(type, mark, code, kuanshi, date, zuowei, chemen, ranliao, biansu, zuoyi, isdao, iswindow, introduce, price, state);
		CarImage ci = new CarImage(code, image1, image2, image3, image4);
		
		
		System.out.println(c+"-"+ci);
		
		/*调用service方法存入数据库*/
		CarService cs = new CarService();
		boolean result = cs.addCar(c, ci);
		if(result){
			System.out.println("【汽车添加成功】");
			request.setAttribute("addInfo", "1");
		}else{
			System.out.println("【汽车添加失败】");
			request.setAttribute("addInfo", "0");
		}
		
		/*页面跳转*/
		request.getRequestDispatcher("/queryTypeAndMarkServlet").forward(request,response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
