package cn.clm.services;

import java.util.Map;
import cn.clm.models.SystemSet;
import cn.clm.utils.DbUtil;

public class SystemService {
	private DbUtil db;
	private String sql;
	private Map<String,Object> map;
	private int result;
	
	public int updateSystemSet(SystemSet set){
		db = new DbUtil();
		sql="UPDATE systemset SET s_name=?,s_logo=?,s_video=? WHERE s_id=1";
		result = db.update(sql, set.getName(),set.getLogo(),set.getXcVideo());
		return result;
	}

	public Map<String, Object> getSystemSet() {
		db = new DbUtil();
		sql="SELECT * FROM systemset";
		map = db.query(sql).get(0);
		return map;
	}
	
	public String getIndex(){
		db = new DbUtil();
		int userNum = db.query("SELECT * FROM user").size();
		String pb = db.query("SELECT SUM(p_pd) AS pb FROM user_pb").get(0).getOrDefault("pb", "").toString();
		int orderNum = db.query("SELECT * FROM orderlist").size();
		String allMoney = db.query("SELECT SUM(allMoney) AS allMoney FROM orderlist").get(0).getOrDefault("allMoney", "").toString();
		return userNum+"-"+pb+"-"+orderNum+"-"+allMoney;
	}

}
