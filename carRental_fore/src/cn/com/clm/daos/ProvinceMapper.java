package cn.com.clm.daos;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import cn.com.clm.beans.Diqu;
import cn.com.clm.beans.Province;

public interface ProvinceMapper {
	
	@Select("SELECT * FROM province")
	public List<Province> getProvince();
	
	@Select("SELECT * FROM province p,diqu d WHERE p.p_id=d.p_id AND p.p_name=#{p_name}")
	public List<Diqu> getDq(String p_name);
	
	@Select("SELECT d_id  FROM diqu WHERE d_pname=#{d_pname}")
	public int getD_id(String d_name);

}
