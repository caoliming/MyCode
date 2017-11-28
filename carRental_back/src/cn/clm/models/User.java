package cn.clm.models;

public class User {
	private int id;
	private String u_name;
	private String u_psw;
	private String u_sex;
	private int u_age;
	private String u_card;
	private String u_address;
	private String u_phone;
	private String u_img;
	private String u_jscard;
	private String u_date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getU_name() {
		return u_name;
	}
	public User(String u_name, String u_psw, String u_sex, int age, String u_card, String u_address, String u_phone,
			String u_img, String u_jscard, String u_date) {
		super();
		this.u_name = u_name;
		this.u_psw = u_psw;
		this.u_sex = u_sex;
		this.u_age = age;
		this.u_card = u_card;
		this.u_address = u_address;
		this.u_phone = u_phone;
		this.u_img = u_img;
		this.u_jscard = u_jscard;
		this.u_date = u_date;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_psw() {
		return u_psw;
	}
	public void setU_psw(String u_psw) {
		this.u_psw = u_psw;
	}
	public String getU_sex() {
		return u_sex;
	}
	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}
	public int getAge() {
		return u_age;
	}
	public void setAge(int age) {
		this.u_age = age;
	}
	public String getU_card() {
		return u_card;
	}
	public void setU_card(String u_card) {
		this.u_card = u_card;
	}
	public String getU_address() {
		return u_address;
	}
	public void setU_address(String u_address) {
		this.u_address = u_address;
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
	public String getU_jscard() {
		return u_jscard;
	}
	public void setU_jscard(String u_jscard) {
		this.u_jscard = u_jscard;
	}
	public String getU_date() {
		return u_date;
	}
	public void setU_date(String u_date) {
		this.u_date = u_date;
	}
	public User(String u_name, String u_psw) {
		super();
		this.u_name = u_name;
		this.u_psw = u_psw;
	}
	public User(int id, String u_name, String u_psw, String u_sex, int age, String u_card, String u_address,
			String u_phone, String u_img, String u_jscard, String u_date) {
		super();
		this.id = id;
		this.u_name = u_name;
		this.u_psw = u_psw;
		this.u_sex = u_sex;
		this.u_age = age;
		this.u_card = u_card;
		this.u_address = u_address;
		this.u_phone = u_phone;
		this.u_img = u_img;
		this.u_jscard = u_jscard;
		this.u_date = u_date;
	}
	public User() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", u_name=" + u_name + ", u_psw=" + u_psw + ", u_sex=" + u_sex + ", age=" + u_age
				+ ", u_card=" + u_card + ", u_address=" + u_address + ", u_phone=" + u_phone + ", u_img=" + u_img
				+ ", u_jscard=" + u_jscard + ", u_date=" + u_date 
				+ "]";
	}
	
}
