package cn.clm.services;

import java.util.List;
import java.util.Map;

import cn.clm.daos.BiaoZhiDao;
import cn.clm.models.Biaozhi;
import cn.clm.utils.DbUtil;

public class BiaoZhiSercice implements BiaoZhiDao{
	private DbUtil db;
	private String sql;
	private List<Map<String,Object>> list;
	private int result;
	
	/*添加汽车标志*/
	public boolean addMark(Biaozhi bz) {
		db=new DbUtil();
		sql="INSERT INTO biaozhi (b_name,b_introduce,b_img,b_date) VALUES (?,?,?,?)";
		result = db.update(sql,bz.getB_name(),bz.getB_introduce(),bz.getB_img(),bz.getB_date());
		return (result>0)? true:false;
	}
	
	/*全部查询*/
	public List<Map<String,Object>> queryAllMark(){
		db = new DbUtil();
		sql = "SELECT * FROM biaozhi";
		list = db.query(sql);
		return list;
	}
	
	/*全部单个*/
	public List<Map<String,Object>> queryOneMark(String mark){
		db = new DbUtil();
		sql = "SELECT * FROM biaozhi WHERE b_name=?";
		list = db.query(sql,mark);
		return list;
	}
	
	
	
	

}
