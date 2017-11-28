package cn.clm.services;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.clm.models.Page;
import cn.clm.utils.DbUtil;
import cn.clm.utils.dateUtil;

public class userService {
	private DbUtil db;
	private String sql;
	private List<Map<String,Object>> list;
	private int result;
	
	
	/*分页方法*/
	private Page pageModel;
	private int size=2;
	public Page pageAll(int page) {
		db=new DbUtil();
		sql="SELECT * FROM USER u,user_pb up WHERE u.u_card=up.u_card";
		pageModel = new Page(sql, size, page);
		//计算总记录数
		int total=db.query(sql).size();
		//计算总页数
		int totalPage=0;
		if(total%pageModel.getSize()==0){
			totalPage=total/pageModel.getSize();
		}else{
			totalPage=total/pageModel.getSize()+1;
		}
		pageModel.setTotalPage(totalPage);
		//执行分页
		sql="SELECT * FROM USER u,user_pb up WHERE u.u_card=up.u_card limit ?,? ";
		int frist = (pageModel.getPage()-1)*pageModel.getSize();
		list=db.query(sql, frist,pageModel.getSize());
		//存储数据
		pageModel.setDate(list);
		return pageModel;
	}
	
	public Page pageByND(int page, String name, String date) {
		db=new DbUtil();
		int total=0;
		if(name!=""&&date==""){
			sql="SELECT * FROM USER u,user_pb up WHERE u.u_card=up.u_card AND u_name=?";
			pageModel = new Page(sql, size, page);
			total=db.query(sql,name).size();
		}else if(name==""&&date!=""){
			sql="SELECT * FROM USER u,user_pb up WHERE u.u_card=up.u_card AND u_date=?";
			pageModel = new Page(sql, size, page);
			total=db.query(sql,date).size();
		}else{
			sql="SELECT * FROM USER u,user_pb up WHERE u.u_card=up.u_card AND u_name=? AND u_date=?";
			pageModel = new Page(sql, size, page);
			total=db.query(sql,name,date).size();
		}
		//计算总页数
		int totalPage=0;
		int frist=0;
		if(total%pageModel.getSize()==0){
			totalPage=total/pageModel.getSize();
		}else{
			totalPage=total/pageModel.getSize()+1;
		}
		pageModel.setTotalPage(totalPage);
		
		if(name!=""&&date==""){
			sql="SELECT * FROM USER u,user_pb up WHERE u.u_card=up.u_card AND u_name=? limit ?,?";
			frist= (pageModel.getPage()-1)*pageModel.getSize();
			list=db.query(sql,name, frist,pageModel.getSize());
		}else if(name==""&&date!=""){
			sql="SELECT * FROM USER u,user_pb up WHERE u.u_card=up.u_card AND u_date=? limit ?,?";
			frist= (pageModel.getPage()-1)*pageModel.getSize();
			list=db.query(sql,date, frist,pageModel.getSize());
		}else{
			sql="SELECT * FROM USER u,user_pb up WHERE u.u_card=up.u_card AND u_name=? AND u_date=? limit ?,?";
			frist= (pageModel.getPage()-1)*pageModel.getSize();
			list=db.query(sql,name,date, frist,pageModel.getSize());
		}
		
		//存储数据
		pageModel.setDate(list);
		return pageModel;
	}
	
	
	/*登记统计的方法*/
	/*全部*/
	public Map<String, Integer> getUserTj(){
		Map<String, Integer> m  = new HashMap<String, Integer>();
		db=new DbUtil();
		sql="SELECT * FROM USER";
		list=db.query(sql);
		int pt=0,qt=0,hj=0,bj=0,zs=0;
		for(int i=0;i<list.size();i++){
			String result = list.get(i).getOrDefault("u_date", "").toString();
			String currentDate = new Date().toLocaleString().substring(0, 9);
			int dateNum = (int) dateUtil.getDaySub(result,currentDate);
			if(dateNum<180){
				pt++;
			}else if(180<=dateNum&&dateNum<360){
				qt++;
			}else if(360<=dateNum&&dateNum<720){
				hj++;
			}else if(720<=dateNum&&dateNum<1080){
				bj++;
			}else{
				zs++;
			}
		}
		m.put("所有用户", list.size());
		m.put("普通用户", pt);
		m.put("青铜用户", qt);
		m.put("黄金用户", hj);
		m.put("白金用户", bj);
		m.put("钻石用户", zs);
		return m;
		
	}
	
	

}
