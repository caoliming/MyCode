package cn.com.clm.daos;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.com.clm.beans.Order;
import cn.com.clm.beans.OrderInfo;

public interface OrderMapper {
	
	@Insert("INSERT INTO orderlist(o_code,u_card,u_jscard,b_code,b_price,start_date,end_date,days,allMoney,o_bx,d_id,o_state)VALUES(#{o_code},#{u_card},#{u_jscard},#{b_code},#{b_price},#{start_date},#{end_date},#{days},#{allMoney},#{o_bx},#{d_id},#{o_state})")
	public void makeOrder(Order order);
	
	@Select("SELECT * FROM orderlist o,diqu d WHERE o.d_id=d.d_id AND o.u_card=#{u_card} ORDER BY start_date DESC")
	public List<Order> getOrders(String u_card);
	
	/*userOrder 的统计*/
	/*未支付的订单数量*/
	@Select("SELECT COUNT(*) AS num FROM orderlist WHERE o_state='未支付' AND u_card=#{u_card}")
	public int getNoPayOrder(String u_card);
	
	/*已支付的订单数量*/
	@Select("SELECT COUNT(*) AS num FROM orderlist WHERE o_state='已支付' AND u_card=#{u_card}")
	public int getPayOrder(String u_card);
	
	/*未购买保险的订单数量*/
	@Select("SELECT COUNT(*) AS num FROM orderlist WHERE o_bx='未购买' AND u_card=#{u_card}")
	public int getNoBXOrder(String u_card);
	
	/*已购买保险的订单数量*/
	@Select("SELECT COUNT(*) AS num FROM orderlist WHERE o_bx='已购买' AND u_card=#{u_card}")
	public int getBXOrder(String u_card);
	
	public OrderInfo getOrderInfo(String o_code);
	
	/*依据o_code 设置 order 的状态*/
	@Update("UPDATE orderlist SET o_state=#{0} WHERE o_code=#{1}")
	public void setOrderState(String o_state,String o_code);
	
	/*依据o_code 查询汽车的b_code*/
	@Select("SELECT b_code FROM orderlist WHERE o_code=#{o_code}")
	public String getB_code(String o_code);

	@Select("SELECT * FROM orderlist o,diqu d WHERE o.d_id=d.d_id AND o.o_code=#{0} AND o.u_card=#{1} ORDER BY start_date DESC")
	public List<Order> getOwnOrders(String o_code, String u_card);

	@Select("SELECT * FROM orderlist o,diqu d WHERE o.d_id=d.d_id AND o.o_state LIKE #{0} AND o.u_card=#{1} ORDER BY start_date DESC")
	public List<Order> getOrdersByTj(String o_state, String u_card);
	
}
