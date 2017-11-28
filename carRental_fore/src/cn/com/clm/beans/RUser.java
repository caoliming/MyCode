package cn.com.clm.beans;

public class RUser {
	private String u_name;
	private String u_sex;
	private String u_date;
	private String u_card;
	private String u_jscard;
	private String u_address;
	private String u_pass;
	private String u_phone;
	private String u_img;
	@Override
	public String toString() {
		return "RUser [u_name=" + u_name + ", u_sex=" + u_sex + ", u_date=" + u_date + ", u_card=" + u_card
				+ ", u_jscard=" + u_jscard + ", u_address=" + u_address + ", u_pass=" + u_pass + ", u_phone=" + u_phone
				+ ", u_img=" + u_img + "]";
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_sex() {
		return u_sex;
	}
	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}
	public String getU_date() {
		return u_date;
	}
	public void setU_date(String u_date) {
		this.u_date = u_date;
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
	public String getU_address() {
		return u_address;
	}
	public void setU_address(String u_address) {
		this.u_address = u_address;
	}
	public String getU_pass() {
		return u_pass;
	}
	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getU_img() {
		return u_img;
	}
	public void setU_img(String u_img) {
		this.u_img = u_img;
	}
	public RUser(String u_name, String u_sex, String u_date, String u_card, String u_jscard, String u_address,
			String u_pass, String u_phone, String u_img) {
		super();
		this.u_name = u_name;
		this.u_sex = u_sex;
		this.u_date = u_date;
		this.u_card = u_card;
		this.u_jscard = u_jscard;
		this.u_address = u_address;
		this.u_pass = u_pass;
		this.u_phone = u_phone;
		this.u_img = u_img;
	}
	
	public RUser() {
		// TODO Auto-generated constructor stub
	}

}
