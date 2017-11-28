package cn.clm.services;

import java.util.List;
import java.util.Map;

import cn.clm.models.Type;
import cn.clm.utils.DbUtil;

public class TypeService {
	private DbUtil db;
	private String sql;
	private List<Map<String,Object>> list;
	private int result;
	
	/*添加汽车类型*/
	public boolean addType(Type t) {
		db=new DbUtil();
		sql="INSERT INTO TYPE (t_type,t_introduce,t_img,t_date)VALUES (?,?,?,?)";
		result = db.update(sql,t.getT_type(),t.getT_introduce(),t.getT_img(),t.getT_date());
		return (result>0)? true:false;
	}
	
	/*全部查询*/
	public List<Map<String,Object>> queryAllType(){
		db = new DbUtil();
		sql = "SELECT * FROM type";
		list = db.query(sql);
		return list;
	}
	
	/*单个查询*/
	public List<Map<String,Object>> queryOneType(String type){
		db = new DbUtil();
		sql = "SELECT * FROM TYPE WHERE t_type=?";
		list = db.query(sql,type);
		return list;
	}

}
