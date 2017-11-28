package cn.com.clm.beans;

import org.springframework.stereotype.Component;

@Component
public class UserPb {
	@Override
	public String toString() {
		return "UserPb [p_id=" + p_id + ", u_card=" + u_card + ", p_pd=" + p_pd + ", p_money=" + p_money + "]";
	}
	private int p_id;
	private String u_card;
	private int p_pd; //积分
	private int p_money; //余额
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getU_card() {
		return u_card;
	}
	public void setU_card(String u_card) {
		this.u_card = u_card;
	}
	public int getP_pd() {
		return p_pd;
	}
	public void setP_pd(int p_pd) {
		this.p_pd = p_pd;
	}
	public int getP_money() {
		return p_money;
	}
	public void setP_money(int p_money) {
		this.p_money = p_money;
	}
	public UserPb(int p_id, String u_card, int p_pd, int p_money) {
		super();
		this.p_id = p_id;
		this.u_card = u_card;
		this.p_pd = p_pd;
		this.p_money = p_money;
	}
	public UserPb() {
		// TODO Auto-generated constructor stub
	}
	public UserPb(String u_card, int p_pd, int p_money) {
		super();
		this.u_card = u_card;
		this.p_pd = p_pd;
		this.p_money = p_money;
	}
	
	

}
