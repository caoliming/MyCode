package cn.com.clm.services;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.com.clm.beans.Diqu;
import cn.com.clm.beans.Province;

@Repository
public interface ProvinceService {
	
	public List<Province> getProvince();

	public List<Diqu> getDq(String p_name);
	
	public int getD_id(String d_pname);
}
