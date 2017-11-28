package cn.com.clm.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import cn.com.clm.beans.Page;
import cn.com.clm.beans.User;
import cn.com.clm.services.CarService;
import cn.com.clm.services.UserService;

@Controller
@SessionAttributes("user")
@Scope("prototype")
@RequestMapping("/car")
public class CarController {
	@Autowired
	private CarService carService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/getCarInfo/{b_code}")
	public String getCarInfo(@PathVariable("b_code") String b_code,@ModelAttribute("user") User user,Map<String,Object> map){
		System.out.println("你所查询的汽车的车牌："+b_code);
		map.put("car", carService.getOneCar(b_code));
		map.put("user", user);
		return "carInfo";
	}
	
	@RequestMapping(value="/index/{u_card}",method=RequestMethod.GET)
    public ModelAndView getIndex(@PathVariable("u_card") String u_card) throws Exception {
        String viewName="index";
        ModelAndView modelAndView = new ModelAndView(viewName); 
		modelAndView.addObject("newCars", carService.getNewCar());
		modelAndView.addObject("lowCars", carService.getLowCar());
		modelAndView.addObject("user", userService.getUserCore(u_card));
		return modelAndView;
    }
	
	@ResponseBody
	@RequestMapping(value="/makeOrder",method=RequestMethod.GET)
    public ModelAndView makeOrder(HttpServletRequest request) throws Exception {
		String u_card = request.getParameter("u_card");
		String b_code=request.getParameter("b_code");
		String viewName="makeOrder";
        ModelAndView modelAndView = new ModelAndView(viewName);
        modelAndView.addObject("user", userService.getUserCore(u_card));
        modelAndView.addObject("car", carService.getOneCar(b_code));
        return modelAndView;
	}
	
	//分页
	@ResponseBody
	@RequestMapping(value="/getPageCar",method=RequestMethod.GET)
    public ModelAndView getPageCar(HttpServletRequest request) throws Exception {
		String u_card = request.getParameter("u_card");
		String page=request.getParameter("page");
        if(page == null){
			page="1";
		}
		String viewName="queryCar";
        ModelAndView modelAndView = new ModelAndView(viewName); 
        
        //查询汽车的类型和品牌遍历在option上
        modelAndView.addObject("types", carService.queryType());
        modelAndView.addObject("marks", carService.queryMark());
        
		modelAndView.addObject("pageDate", carService.pageAll(Integer.parseInt(page)));
		modelAndView.addObject("user", userService.getUserCore(u_card));
		return modelAndView;
    }
	//按条件分页
	@ResponseBody
	@RequestMapping(value="/getPageCarByTj",method=RequestMethod.GET)
	public ModelAndView getPageCarByTj(HttpServletRequest request) throws Exception {
		String u_card = request.getParameter("u_card");
		String page=request.getParameter("page");
		if(page == null){
			page="1";
		}
		String tj=request.getParameter("tj");
		
		String viewName="queryCar";
		ModelAndView modelAndView = new ModelAndView(viewName); 
		
		//查询汽车的类型和品牌遍历在option上
		modelAndView.addObject("types", carService.queryType());
		modelAndView.addObject("marks", carService.queryMark());
		
		Page pageDate = carService.pageAllByTj(Integer.parseInt(page),tj);
		System.out.println("CarController-》按条件分页的pageDate:"+pageDate);
		
		modelAndView.addObject("pageDate",pageDate );
		
		
		modelAndView.addObject("user", userService.getUserCore(u_card));
		return modelAndView;
	}
	

}
