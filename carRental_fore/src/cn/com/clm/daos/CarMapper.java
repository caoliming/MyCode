package cn.com.clm.daos;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.com.clm.beans.Biaozhi;
import cn.com.clm.beans.Car;
import cn.com.clm.beans.Type;

public interface CarMapper {
	public List<Car> getNewCar();
	
	public List<Car> getLowCar();
	
	public Car getOneCar(String b_code);
	
	/*分页*/
	@Select("SELECT COUNT(*) AS num FROM car c,car_img ci,biaozhi b,TYPE t WHERE c.b_code=ci.b_code AND c.b_id=b.b_id AND c.t_id=t.t_id")
	public int getTotal();
	public List<Car> getPage(int frist,int pageSize);
	
	/*条件分页*/
	public int getTotalByTj(Map<String,Object> condition);
	public List<Car> getPageByTj(Map<String,Object> conditionFz);

	@Select("SELECT * FROM biaozhi")
	public List<Biaozhi> queryMark();
	
	@Select("SELECT * FROM type")
	public List<Type> queryType();
	
	
	//设置汽车状态（Y：可租用，N：已租出，Z：已预约）
	@Update("UPDATE car SET state=#{0} WHERE b_code=#{1}")
	public void setCarState(String o_state,String b_code);
}
