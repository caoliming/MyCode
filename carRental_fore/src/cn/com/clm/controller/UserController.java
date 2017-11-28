package cn.com.clm.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import cn.com.clm.beans.Message;
import cn.com.clm.beans.User;
import cn.com.clm.beans.UserPb;
import cn.com.clm.services.CarService;
import cn.com.clm.services.UserService;
import cn.com.clm.utils.HttpUtils;
import cn.com.clm.utils.dateUtil;


@Controller
@SessionAttributes("user")
@Scope("prototype")
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private CarService carService;
	
	@RequestMapping(value="/addUser",method=RequestMethod.GET)
	private String addUser(HttpServletRequest request) throws IOException{
		String userStr = request.getParameter("user");
		String []u = userStr.split("!");
		for(String s:u){
			System.out.print(s+" ");
		}
		String date = u[2];
		String u_date = new Date().toLocaleString().substring(0, 9);
		int age = dateUtil.getYearSub(date, u_date);
		
		String img = u[8];
		if("*".equals(img)){
			img="C://Users//曹黎明//Pictures//tx//a14.jpg";
		}
		/*File file =  new File(img);
		InputStream input =  file.getInputStream();
		//String fileName = file.getOriginalFilename();
		String filePath = request.getServletContext().getInitParameter("filePath");
		String newFileName = (int)(Math.random()*10000)+new Date().getTime()+".jpg";
		FileUtils.upFile(input, newFileName, filePath);*/
		
		String filePath = request.getServletContext().getInitParameter("filePath");
		String newFileName = (int)(Math.random()*10000)+new Date().getTime()+".jpg";
		HttpUtils.fileUpload2(filePath+newFileName, img);
		
		User user = new User(u[0], u[6], u[1], age, u[3], u[5], u[7], "201704202209521615.jpg", u[4], u_date);
		UserPb userPb = new UserPb(u[3], 0, 0);
		int result = userService.registerUser(user);
		int result1 = userService.registerUserPb(userPb);
		if(result>0&&result1>0){
			return "login";
		}else{
			request.setAttribute("result", "0");
			return "register";
		}
		
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
    public ModelAndView login(User user,HttpServletRequest request,ModelMap model) throws Exception {
		System.out.println("login->user:"+user);
		/*user.setU_name(new String(user.getU_name().getBytes("GB2312"),"UTF-8")); */
        user=userService.checkLogin(user.getU_name(), user.getU_psw());
        String viewName="fail";
        ModelAndView modelAndView;
        if(user!=null){
			viewName="index";
			modelAndView = new ModelAndView(viewName); 
			modelAndView.addObject("newCars", carService.getNewCar());
			modelAndView.addObject("lowCars", carService.getLowCar());
			modelAndView.addObject("user", user);
			model.addAttribute("user", user);
			return modelAndView;
        }
        modelAndView = new ModelAndView(viewName); 
        return modelAndView;
    }
	
	 
	 @RequestMapping(value="/getUser/{u_card}")
	public String getUserInfo(@PathVariable("u_card") String u_card,Map<String,Object> map){
		map.put("user", userService.getUserCore(u_card));
		map.put("userRecodes", userService.getUserRecode(u_card));
		return "userCore";
	}
	 
	 /*重置密码*/
	 @RequestMapping(value="/updateUserPs")
	 public String updateUserPs(HttpServletRequest request,Map<String,Object> map){
		 String u_card  =request.getParameter("u_card");
		 String newPs  =request.getParameter("newPs");
		 userService.updateUserPass(newPs,u_card);
		 
		 map.put("user", userService.getUserCore(u_card));
		 map.put("userRecodes", userService.getUserRecode(u_card));
		 return "userCore";
	 }
	
	 /*充值*/
	 @RequestMapping(value="/updateUserMoney")
	 public String updateUserMoney(HttpServletRequest request,Map<String,Object> map){
		 String u_card  =request.getParameter("u_card");
		 String addMon  =request.getParameter("addMon");
		 String r_date = new Date().toLocaleString().substring(0, 9);
		 
		 /*修改积分表*/
		 userService.updateUserMoney(Integer.parseInt(addMon) ,u_card);
		 userService.addMoneyRecode(u_card,Integer.parseInt(addMon) ,r_date);
		 
		 map.put("user", userService.getUserCore(u_card));
		 map.put("userRecodes", userService.getUserRecode(u_card));
		 return "userCore";
	 }
	 
	 /*兑换积分*/
	 @RequestMapping(value="/updateUserPb")
	 public String updateUserPb(HttpServletRequest request,Map<String,Object> map){
		 String u_card  =request.getParameter("u_card");
		 String p_pd  =request.getParameter("p_pd");
		 
		 /*修改积分表*/
		 userService.updateUserPb(Integer.parseInt(p_pd) ,u_card);
		 
		 map.put("user", userService.getUserCore(u_card));
		 map.put("userRecodes", userService.getUserRecode(u_card));
		 return "userCore";
	 }
	 
	 /*响应注册页面*/
	 @RequestMapping(value="/registerJsp")
	 public String registerJsp(){
		 return "register";
	 }
	 
	@ResponseBody
	@RequestMapping(value="/sendNote",method=RequestMethod.GET)
	public ModelAndView sendNote(HttpServletRequest request,Map<String,Object> map){
		String u_card = request.getParameter("u_card");
		String note = request.getParameter("note");
		System.out.println("留言的u_card："+u_card+"-note:"+note);
		/*依据u_card 添加留言，并为此用户添加1积分*/
		String currentdate = new Date().toLocaleString().toString().substring(0, 9);
		Message message=new Message(u_card, note, currentdate);
		userService.sendNote(message);
		userService.addPb(u_card);
		
		map.put("user", userService.getUserCore(u_card));
		map.put("userRecodes", userService.getUserRecode(u_card));
		
		ModelAndView modelAndView = new ModelAndView("redirect:/user/getUser/"+u_card); 
		
		return modelAndView;
	} 
	
	@ResponseBody
	@RequestMapping(value="/talk",method=RequestMethod.GET)
	public ModelAndView talk(@ModelAttribute("user") User user){ 
		String viewName="talk";
		String u_card = user.getU_card();
		ModelAndView modelAndView = new ModelAndView(viewName);
		modelAndView.addObject("user", userService.getUserCore(u_card));
		return modelAndView;
	}
	
	/*查找user是否已注册*/
	@ResponseBody  
	@RequestMapping(value="/verifyUser", method=RequestMethod.POST)  
	public int verifyUser(HttpServletRequest request) throws Exception { 
		String u_card = request.getParameter("u_card");
		User user = userService.getUserCore(u_card);
		return null==user?0:1;
	} 
	
	//查询的依赖方法
	@ModelAttribute
	public void getUser(@RequestParam(value="u_card",required=false) String u_card,Map<String,Object> map){
		if(null!=u_card){
			map.put("user", userService.getUserRecode(u_card));
		}
	}
	

}
