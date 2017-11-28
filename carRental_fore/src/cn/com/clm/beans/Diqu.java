package cn.com.clm.beans;

import org.springframework.stereotype.Component;

@Component
public class Diqu {
	private Integer d_id;
	private Integer p_id;
	private String d_name;
	private String d_pname;
	public Integer getD_id() {
		return d_id;
	}
	public void setD_id(Integer d_id) {
		this.d_id = d_id;
	}
	public Integer getP_id() {
		return p_id;
	}
	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_pname() {
		return d_pname;
	}
	public void setD_pname(String d_pname) {
		this.d_pname = d_pname;
	}
	public Diqu(Integer d_id, Integer p_id, String d_name, String d_pname) {
		super();
		this.d_id = d_id;
		this.p_id = p_id;
		this.d_name = d_name;
		this.d_pname = d_pname;
	}
	@Override
	public String toString() {
		return "Diqu [d_id=" + d_id + ", p_id=" + p_id + ", d_name=" + d_name + ", d_pname=" + d_pname + "]";
	}
	
	public Diqu() {
		// TODO Auto-generated constructor stub
	}
}
