package cn.clm.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.clm.utils.DbUtil;

public class OrderService {
	private DbUtil db;
	private String sql;
	private List<Map<String,Object>> list;
	private Map<String,Object> map;
	private int result;
	
	/*查询所有的订单*/
	public List<Map<String,Object>> getAllOrder(){
		db = new DbUtil();
		sql="SELECT * FROM orderlist";
		list = db.query(sql);
		return list;
	}
	
	/*依据状态查询订单*/
	public List<Map<String,Object>> getPayOrder(String o_state){
		db = new DbUtil();
		sql="SELECT * FROM orderlist WHERE o_state LIKE ?";
		list = db.query(sql,o_state);
		return list;
	}
	
	/*查询5种订单的数量*/
	//订单状态（已支付，未支付，*已取消，*已提车，*已还车）
	public Map<String,Integer> getOrderStateNum(){
		Map<String,Integer> map = new HashMap<>();
		db = new DbUtil();
		sql = "SELECT * FROM orderlist WHERE o_state='已支付'";
		int r1 = db.query(sql).size()>0? db.query(sql).size():0;
		map.put("已支付", r1);
		
		sql = "SELECT * FROM orderlist WHERE o_state='未支付'";
		int r2 = db.query(sql).size()>0? db.query(sql).size():0;
		map.put("未支付", r2);
		
		sql = "SELECT * FROM orderlist WHERE o_state='已取消'";
		int r3 = db.query(sql).size()>0? db.query(sql).size():0;
		map.put("已取消", r3);
		
		sql = "SELECT * FROM orderlist WHERE o_state='已提车'";
		int r4 = db.query(sql).size()>0? db.query(sql).size():0;
		map.put("已提车", r4);
		
		sql = "SELECT * FROM orderlist WHERE o_state='已还车'";
		int r5 = db.query(sql).size()>0? db.query(sql).size():0;
		map.put("已还车", r5);
		
		return map;
	}
	
	/*依据订单号/提车时间查询订单*/
	public  List<Map<String,Object>> getOrderByTj(String o_code,String satrtDate){
		db = new DbUtil();
		if(o_code!="" && satrtDate==""){
			sql="SELECT * FROM orderlist WHERE o_code=?";
			list = db.query(sql, o_code);
		}else if(o_code=="" && satrtDate!=""){
			sql="SELECT * FROM orderlist WHERE start_date=?";
			list = db.query(sql, satrtDate);
		}else{
			sql="SELECT * FROM orderlist WHERE o_code=? AND start_date=?";
			list = db.query(sql, o_code,satrtDate);
		}
		return list;
	}

	/*依据o_code查询订单详情*/
	public Map<String, Object> getOrderDetil(String o_code) {
		db = new DbUtil();
		sql = "SELECT o.o_code,o.b_price,o.start_date,o.end_date,o.days,o.allMoney,o.o_bx,o.o_state,d.d_pname,u.*,ci.* FROM diqu d,orderlist o,USER u,car_img ci WHERE o.d_id=d.d_id AND o.u_card=u.u_card AND o.b_code=ci.b_code AND o.o_code=?";
		map = db.query(sql, o_code).get(0);
		return map;
	}
	
	/*依据订单o_code修改订单状态*/
	public void updateOrderState(String c_state,String o_state,String o_code){
		db = new DbUtil();
		sql = "UPDATE car c,orderlist o SET c.state=?,o.o_state=? WHERE o.b_code=c.b_code AND o.o_code=?";
		db.update(sql, c_state,o_state,o_code);
	}

	/*返回一个数组*/
	public int[] getOrderAllNum() {
		db = new DbUtil();
		int []num = new int[5];
		String []o_state = {"未支付","已取消","已提车","已还车","已支付"};
		sql = "SELECT * FROM orderlist WHERE o_state=?";
		for(int i=0;i<5;i++){
			num[i] = db.query(sql,o_state[i])==null? 0 : db.query(sql,o_state[i]).size();
		}
		return num;
	}

	public int[] getOrderNumBySate(String o_state) {
		db = new DbUtil();
		int []num = new int[12];
		if("全部".equals(o_state)){
			for(int i=1;i<13;i++){
				if(i<10){
					sql = "SELECT * FROM orderlist WHERE start_date LIKE '2017-0"+i+"%'";
					num[i-1] = db.query(sql)==null? 0:db.query(sql).size();
				}else{
					sql = "SELECT * FROM orderlist WHERE start_date LIKE '2017-"+i+"%'";
					num[i-1] = db.query(sql)==null? 0:db.query(sql).size();
				}
			}
		}else{
			for(int i=1;i<13;i++){
				if(i<10){
					sql = "SELECT * FROM orderlist WHERE o_state=? AND start_date LIKE '2017-0"+i+"%'";
					num[i-1] = db.query(sql,o_state)==null? 0:db.query(sql,o_state).size();
				}else{
					sql = "SELECT * FROM orderlist WHERE o_state=? AND start_date LIKE '2017-"+i+"%'";
					num[i-1] = db.query(sql,o_state)==null? 0:db.query(sql,o_state).size();
				}
			}
		}
		return num;
	}
	
	

}
