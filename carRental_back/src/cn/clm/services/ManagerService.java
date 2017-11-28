package cn.clm.services;

import java.util.List;
import java.util.Map;

import cn.clm.models.Manager;
import cn.clm.utils.DbUtil;

public class ManagerService {
	private DbUtil db;
	private String sql;
	private List<Map<String,Object>> list;
	private Map<String,Object> map;
	private int result;
	
	public Map<String,Object> login(Manager manager){
		db = new DbUtil();
		sql = "SELECT * FROM manager WHERE m_name=? AND m_psw=?";
		map = db.query(sql, manager.getName(),manager.getPsw())==null? null:db.query(sql, manager.getName(),manager.getPsw()).get(0);
		return map;
	}

	public void updatePass(String pass, String m_card) {
		db = new DbUtil();
		sql = "UPDATE manager SET m_psw=? WHERE m_card=?";
		db.update(sql, pass,m_card);
	}

	public void updateManager(String info, String m_card) {
		String []manager = info.split("-");
		db = new DbUtil();
		sql = "UPDATE manager SET m_name=?,m_age=?,m_phone=?,m_card=? WHERE m_card=?";
		db.update(sql, manager[0], manager[1], manager[2], manager[3], m_card);
	}

}
