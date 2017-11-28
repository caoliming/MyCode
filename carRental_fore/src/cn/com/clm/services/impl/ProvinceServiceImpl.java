package cn.com.clm.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.clm.beans.Diqu;
import cn.com.clm.beans.Province;
import cn.com.clm.daos.ProvinceMapper;
import cn.com.clm.services.ProvinceService;
@Service
public class ProvinceServiceImpl implements ProvinceService{
	@Autowired
	private ProvinceMapper provinceMapper;

	@Override
	public List<Province> getProvince() {
		return provinceMapper.getProvince();
	}

	@Override
	public List<Diqu> getDq(String p_name) {
		return provinceMapper.getDq(p_name);
	}

	@Override
	public int getD_id(String d_pname) {
		return provinceMapper.getD_id(d_pname);
	}

}
