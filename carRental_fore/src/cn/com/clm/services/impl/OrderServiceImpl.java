package cn.com.clm.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.clm.beans.Order;
import cn.com.clm.beans.OrderInfo;
import cn.com.clm.daos.OrderMapper;
import cn.com.clm.services.CarService;
import cn.com.clm.services.OrderService;
import cn.com.clm.services.ProvinceService;
import cn.com.clm.services.UserService;
import cn.com.clm.utils.MoneyUtil;
import cn.com.clm.utils.dateUtil;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private UserService userService;
	@Autowired
	private CarService carService;
	@Autowired
	private ProvinceService provinceServince;
	@Autowired
	private OrderMapper orderMapper;

	@Override
	public void makeOrder(String orderList, String u_card) {
		String u_jscard = userService.getUserCore(u_card).getU_jscard();
		String []order = orderList.split("!");
		String b_code = order[0];
		double b_price = carService.getOneCar(b_code).getB_price();
		String startDate = order[1];
		String endDate = order[2];
		int days = (int)dateUtil.getDaySub(startDate, endDate);
		double allMoney = MoneyUtil.getAllMoney(days, b_price);
		String tcdd = order[3];
		System.out.println("tcdd:"+tcdd);
		int d_id = provinceServince.getD_id(tcdd);
		String biaoxian = order[4];
		if("已购买".equals(biaoxian)){
			allMoney+=35.0;
		}
		String o_state="未支付";
		String o_code=order[5];
		
		Order orderlist = new Order(o_code,u_card, u_jscard, b_code, b_price, startDate, endDate, days, allMoney, biaoxian, d_id, o_state);
		orderMapper.makeOrder(orderlist);
		
		//设置汽车为已预约(Z：已预约)
		carService.setCarState("Z",b_code);
	}

	//依据u_card获取订单
	@Override
	public List<Order> getOrders(String u_card) {
		return orderMapper.getOrders(u_card);
	}
	

	@Override
	public int getNoPayOrder(String u_card) {
		return orderMapper.getNoPayOrder(u_card);
	}

	@Override
	public int getPayOrder(String u_card) {
		return orderMapper.getPayOrder(u_card);
	}

	@Override
	public int getNoBXOrder(String u_card) {
		return orderMapper.getNoBXOrder(u_card);
	}

	@Override
	public int getBXOrder(String u_card) {
		return orderMapper.getBXOrder(u_card);
	}

	@Override
	public OrderInfo getOrderInfo(String o_code) {
		return orderMapper.getOrderInfo(o_code);
	}

	/*依据o_code 取消订单（已取消）,并设置汽车状态（Y：可租用）*/
	@Override
	public void setOrderState(String o_state, String o_code) {
		orderMapper.setOrderState(o_state, o_code);
		
		/*依据o_code查询car 的b_code*/
		String b_code = orderMapper.getB_code(o_code);
		/*依据b_code 修改汽车的状态为-》可租用*/
		carService.setCarState("Y", b_code);
	}

	@Override
	public List<Order> getOwnOrders(String o_code, String u_card) {
		return orderMapper.getOwnOrders(o_code, u_card);
	}

	@Override
	public List<Order> getOrdersByTj(String o_state, String u_card) {
		return orderMapper.getOrdersByTj(o_state, u_card);
	}

}
