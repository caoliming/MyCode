package cn.com.clm.beans;

import org.springframework.stereotype.Component;

@Component
public class UserRecode {//用户充值记录表
	@Override
	public String toString() {
		return "UserRecode [r_id=" + r_id + ", u_card=" + u_card + ", r_money=" + r_money + ", r_date=" + r_date + "]";
	}
	private int r_id;
	private String u_card;
	private int r_money;
	private String r_date;
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public String getU_card() {
		return u_card;
	}
	public void setU_card(String u_card) {
		this.u_card = u_card;
	}
	public int getR_money() {
		return r_money;
	}
	public void setR_money(int r_money) {
		this.r_money = r_money;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public UserRecode(int r_id, String u_card, int r_money, String r_date) {
		super();
		this.r_id = r_id;
		this.u_card = u_card;
		this.r_money = r_money;
		this.r_date = r_date;
	}
	public UserRecode() {
		// TODO Auto-generated constructor stub
	}

}
