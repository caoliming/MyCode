package cn.com.clm.services;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.com.clm.beans.Order;
import cn.com.clm.beans.OrderInfo;

@Repository
public interface OrderService {
	public void makeOrder(String orderList,String u_card);
	
	public List<Order> getOrders(String u_card);
	
	/*未支付的订单数量*/
	public int getNoPayOrder(String u_card);
	
	/*已支付的订单数量*/
	public int getPayOrder(String u_card);
	
	/*未购买保险的订单数量*/
	public int getNoBXOrder(String u_card);
	
	/*已购买保险的订单数量*/
	public int getBXOrder(String u_card);
	
	public OrderInfo getOrderInfo(String o_code);
	
	/*依据o_code 取消订单（已取消）,并设置汽车状态（Y：可租用）*/
	public void setOrderState(String o_state,String o_code);

	public List<Order> getOwnOrders(String o_code, String u_card);

	public List<Order> getOrdersByTj(String o_state, String u_card);
	
	

}
