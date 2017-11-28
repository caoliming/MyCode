package cn.com.clm.beans;

import org.springframework.stereotype.Component;

@Component
public class Type {
	private Integer t_id;
	private String t_type;
	private String t_introduce;
	private String t_img;
	private String t_date;
	
	public Type() {
		// TODO Auto-generated constructor stub
	}

	public Integer getT_id() {
		return t_id;
	}

	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}

	public String getT_type() {
		return t_type;
	}

	public void setT_type(String t_type) {
		this.t_type = t_type;
	}

	public String getT_introduce() {
		return t_introduce;
	}

	public void setT_introduce(String t_introduce) {
		this.t_introduce = t_introduce;
	}

	public String getT_img() {
		return t_img;
	}

	public void setT_img(String t_img) {
		this.t_img = t_img;
	}

	public String getT_date() {
		return t_date;
	}

	public void setT_date(String t_date) {
		this.t_date = t_date;
	}

	@Override
	public String toString() {
		return "Type [t_id=" + t_id + ", t_type=" + t_type + ", t_introduce=" + t_introduce + ", t_img=" + t_img
				+ ", t_date=" + t_date + "]";
	}

	public Type(Integer t_id, String t_type, String t_introduce, String t_img, String t_date) {
		super();
		this.t_id = t_id;
		this.t_type = t_type;
		this.t_introduce = t_introduce;
		this.t_img = t_img;
		this.t_date = t_date;
	}

	public Type(String t_type, String t_introduce, String t_img, String t_date) {
		super();
		this.t_type = t_type;
		this.t_introduce = t_introduce;
		this.t_img = t_img;
		this.t_date = t_date;
	}
	
	
	

}
