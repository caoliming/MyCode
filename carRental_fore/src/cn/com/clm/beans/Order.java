package cn.com.clm.beans;

import org.springframework.stereotype.Component;

@Component
public class Order {
	private Integer o_id; //ＩＤ
	private String o_code;//订单号
	private String u_card;//身份证
	private String u_jscard;//驾驶证
	private String b_code;//汽车车牌
	private double b_price;//单价
	private String start_date;//开始日期
	private String end_date;//结束日期
	private Integer days;//总天数
	private double allMoney;//总金额
	private String o_bx;//是否购买35元保险
	private Integer d_id; //取车地点
	private String o_state;//订单状态（已支付，未支付，*已取消，*已提车，*已还车）
	
	@Override
	public String toString() {
		return "Order [o_id=" + o_id + ", o_code=" + o_code + ", u_card=" + u_card + ", u_jscard=" + u_jscard
				+ ", b_code=" + b_code + ", b_price=" + b_price + ", start_date=" + start_date + ", end_date="
				+ end_date + ", days=" + days + ", allMoney=" + allMoney + ", o_bx=" + o_bx + ", d_id=" + d_id
				+ ", o_state=" + o_state + "]";
	}

	public Order(String o_code, String u_card, String u_jscard, String b_code, double b_price, String start_date,
			String end_date, Integer days, double allMoney, String o_bx, Integer d_id, String o_state) {
		super();
		this.o_code = o_code;
		this.u_card = u_card;
		this.u_jscard = u_jscard;
		this.b_code = b_code;
		this.b_price = b_price;
		this.start_date = start_date;
		this.end_date = end_date;
		this.days = days;
		this.allMoney = allMoney;
		this.o_bx = o_bx;
		this.d_id = d_id;
		this.o_state = o_state;
	}

	public Integer getO_id() {
		return o_id;
	}

	public void setO_id(Integer o_id) {
		this.o_id = o_id;
	}

	public String getO_code() {
		return o_code;
	}

	public void setO_code(String o_code) {
		this.o_code = o_code;
	}

	public String getU_card() {
		return u_card;
	}

	public void setU_card(String u_card) {
		this.u_card = u_card;
	}

	public String getU_jscard() {
		return u_jscard;
	}

	public void setU_jscard(String u_jscard) {
		this.u_jscard = u_jscard;
	}

	public String getB_code() {
		return b_code;
	}

	public void setB_code(String b_code) {
		this.b_code = b_code;
	}

	public double getB_price() {
		return b_price;
	}

	public void setB_price(double b_price) {
		this.b_price = b_price;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public Integer getDays() {
		return days;
	}

	public void setDays(Integer days) {
		this.days = days;
	}

	public double getAllMoney() {
		return allMoney;
	}

	public void setAllMoney(double allMoney) {
		this.allMoney = allMoney;
	}

	public String getO_bx() {
		return o_bx;
	}

	public void setO_bx(String o_bx) {
		this.o_bx = o_bx;
	}

	public Integer getD_id() {
		return d_id;
	}

	public void setD_id(Integer d_id) {
		this.d_id = d_id;
	}

	public String getO_state() {
		return o_state;
	}

	public void setO_state(String o_state) {
		this.o_state = o_state;
	}

	public Order() {
		// TODO Auto-generated constructor stub
	}

}
