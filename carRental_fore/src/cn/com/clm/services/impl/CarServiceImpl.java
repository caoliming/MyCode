package cn.com.clm.services.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.clm.beans.Biaozhi;
import cn.com.clm.beans.Car;
import cn.com.clm.beans.Page;
import cn.com.clm.beans.Type;
import cn.com.clm.daos.CarMapper;
import cn.com.clm.services.CarService;
@Service
public class CarServiceImpl implements CarService{
	@Autowired
	private CarMapper carMapper;
	@Autowired
	private Page pageModel;
	private List<Car> list;
	

	@Override
	public List<Car> getNewCar() {
		List<Car> newCar = carMapper.getNewCar();
		return newCar;
	}

	@Override
	public List<Car> getLowCar() {
		List<Car> lowCar = carMapper.getLowCar();
		return lowCar;
	}

	@Override
	public Car getOneCar(String b_code) {
		Car car = carMapper.getOneCar(b_code);
		return car;
	}
	
	@Override
	public List<Biaozhi> queryMark() {
		return carMapper.queryMark();
	}
	
	@Override
	public List<Type> queryType() {
		return carMapper.queryType();
	}

	private int pageSize=6;
	@Override
	public Page pageAll(int page) {
		pageModel.setPage(page);
		pageModel.setSize(pageSize);
		int total = carMapper.getTotal();
		int totalPage=0;
		if(total%pageSize==0){
			totalPage=total/pageSize;
		}else{
			totalPage=total/pageSize+1;
		}
		pageModel.setTotalPage(totalPage);
		
		int frist = (page-1)*pageSize;
		list=carMapper.getPage(frist,pageSize);
		System.out.println("frist:"+frist+"-pageSize:"+pageSize);
		//存储数据
		pageModel.setDate(list);
		return pageModel;
	}

	/*按条件分页的方法*/
	@Override
	public Page pageAllByTj(int page, String tj) {
		pageModel.setPage(page);
		pageModel.setSize(pageSize);
		/*获取条件*/
		String str_tj[] = tj.split("!");
		Map<String,Object> Condition = new HashMap<>();
		Condition.put("t_id", str_tj[0]);
		Condition.put("b_code", str_tj[1]);
		Condition.put("b_id", str_tj[2]);
		Condition.put("kuanshi", str_tj[3]);
		Condition.put("ranliao", str_tj[4]);
		Condition.put("biansu", str_tj[5]);
		Condition.put("zuoyi", str_tj[6]);
		Condition.put("isdao", str_tj[7]);
		Condition.put("iswindow", str_tj[8]);
		Condition.put("b_date", str_tj[9]);
		Condition.put("zuowei", str_tj[10]);
		Condition.put("price1", str_tj[11]);
		Condition.put("chemen", str_tj[12]);
		Condition.put("price2", str_tj[13]);
		
		System.out.println("CarServiceImpl->Condition:"+Condition);
		
		int total = carMapper.getTotalByTj(Condition);
		System.out.println("CarServiceImpl->total:"+total);
		
		int totalPage=0;
		if(total%pageSize==0){
			totalPage=total/pageSize;
		}else{
			totalPage=total/pageSize+1;
		}
		pageModel.setTotalPage(totalPage);
		
		int first = (page-1)*pageSize;
		
		Map<String,Object> ConditionFz = new HashMap<>();
		ConditionFz.put("t_id", str_tj[0]);
		ConditionFz.put("b_code", str_tj[1]);
		ConditionFz.put("b_id", str_tj[2]);
		ConditionFz.put("kuanshi", str_tj[3]);
		ConditionFz.put("ranliao", str_tj[4]);
		ConditionFz.put("biansu", str_tj[5]);
		ConditionFz.put("zuoyi", str_tj[6]);
		ConditionFz.put("isdao", str_tj[7]);
		ConditionFz.put("iswindow", str_tj[8]);
		ConditionFz.put("b_date", str_tj[9]);
		ConditionFz.put("zuowei", str_tj[10]);
		ConditionFz.put("price1", str_tj[11]);
		ConditionFz.put("chemen", str_tj[12]);
		ConditionFz.put("price2", str_tj[13]);
		ConditionFz.put("first", first);
		ConditionFz.put("pageSize", pageSize);
		
		list=carMapper.getPageByTj(ConditionFz);
		
		//存储数据
		pageModel.setDate(list);
		return pageModel;
	}

	//设置汽车状态为已预约
	@Override
	public void setCarState(String o_state,String b_code) {
		carMapper.setCarState(o_state,b_code);
	}

}
