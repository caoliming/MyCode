package cn.clm.services;

import java.util.List;
import java.util.Map;

import cn.clm.utils.DbUtil;

public class MessageService {
	private DbUtil db;
	private String sql;
	private List<Map<String,Object>> list;
	private int result;
	
	public List<Map<String,Object>> queryMessage(){
		db = new DbUtil();
		sql="SELECT m.m_id,u.u_card,u.u_name,u.u_phone,u.u_img,m.m_info,u.u_jscard,m.m_return,m.m_date FROM USER u,message m WHERE u.u_card=m.u_card";
		list = db.query(sql);
		return list;
	}
	
	public int backMessage(String m_id,String backContent){
		db = new DbUtil();
		sql="UPDATE message SET m_return=? WHERE m_id=?";
		result = db.update(sql, backContent,m_id);
		return result;
	}

	public List<Map<String, Object>> queryMessageByInfo(String info) {
		db = new DbUtil();
		sql="SELECT m.m_id,u.u_card,u.u_name,u.u_phone,u.u_img,m.m_info,u.u_jscard,m.m_return,m.m_date FROM USER u,message m WHERE u.u_card=m.u_card AND m_info LIKE ?";
		list = db.query(sql,"%"+info+"%");
		return list;
	}

}
