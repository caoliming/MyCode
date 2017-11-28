package cn.com.clm.beans;

import org.springframework.stereotype.Component;

@Component
public class Biaozhi {
	private Integer b_id;
	private String b_name;
	private String b_introduce;
	private String b_img;
	private String b_date;
	public Integer getB_id() {
		return b_id;
	}
	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_introduce() {
		return b_introduce;
	}
	public void setB_introduce(String b_introduce) {
		this.b_introduce = b_introduce;
	}
	public String getB_img() {
		return b_img;
	}
	public void setB_img(String b_img) {
		this.b_img = b_img;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	@Override
	public String toString() {
		return "Biaozhi [b_id=" + b_id + ", b_name=" + b_name + ", b_introduce=" + b_introduce + ", b_img=" + b_img
				+ ", b_date=" + b_date + "]";
	}
	public Biaozhi(Integer b_id, String b_name, String b_introduce, String b_img, String b_date) {
		super();
		this.b_id = b_id;
		this.b_name = b_name;
		this.b_introduce = b_introduce;
		this.b_img = b_img;
		this.b_date = b_date;
	}
	
	public Biaozhi(String b_name, String b_introduce, String b_img, String b_date) {
		super();
		this.b_name = b_name;
		this.b_introduce = b_introduce;
		this.b_img = b_img;
		this.b_date = b_date;
	}
	
	public Biaozhi() {
		// TODO Auto-generated constructor stub
	}
}
