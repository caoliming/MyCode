package cn.com.clm.services;


import java.util.List;

import org.springframework.stereotype.Repository;

import cn.com.clm.beans.Biaozhi;
import cn.com.clm.beans.Car;
import cn.com.clm.beans.Page;
import cn.com.clm.beans.Type;

@Repository
public interface CarService {
	public List<Car> getNewCar();
	
	public List<Car> getLowCar();
	
	public Car getOneCar(String b_code);
	
	public void setCarState(String o_state,String b_code);
	
	public Page pageAll(int page);
	
	public List<Biaozhi> queryMark();
	
	public List<Type> queryType();

	public Page pageAllByTj(int page, String tj);

}
