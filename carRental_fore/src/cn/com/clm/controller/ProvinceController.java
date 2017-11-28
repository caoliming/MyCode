package cn.com.clm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import cn.com.clm.beans.Diqu;
import cn.com.clm.beans.Province;
import cn.com.clm.services.ProvinceService;

@Controller
@SessionAttributes("user")
@Scope("prototype")
@RequestMapping("/province")
public class ProvinceController {
	@Autowired
	private ProvinceService provinceService;
	
	/*查询省份*/
	@ResponseBody  
	@RequestMapping(value="/getProvince", method=RequestMethod.POST)  
	public List<Province> findProvince(){  
	    List<Province> provinces = provinceService.getProvince();
	    System.out.println("provinces:"+provinces);
	    return provinces;
	}  
	
	/*依据省份查询城市店铺*/
	@ResponseBody  
	@RequestMapping(value="/getDf", method=RequestMethod.POST)  
	public List<Diqu> findDf(HttpServletRequest request) throws Exception { 
		String province = request.getParameter("province");
		List<Diqu> dqs = provinceService.getDq(province);
		System.out.println("dqs:"+dqs);
		return dqs;
	}  
	

}
