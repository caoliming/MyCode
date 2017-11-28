package cn.com.clm.beans;

import org.springframework.stereotype.Component;

@Component
public class CarImage {
	private Integer i_id;
	private String b_code;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	public Integer getI_id() {
		return i_id;
	}
	public void setI_id(Integer i_id) {
		this.i_id = i_id;
	}
	public String getB_code() {
		return b_code;
	}
	public void setB_code(String b_code) {
		this.b_code = b_code;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getImg4() {
		return img4;
	}
	public void setImg4(String img4) {
		this.img4 = img4;
	}
	@Override
	public String toString() {
		return "CarImage [i_id=" + i_id + ", b_code=" + b_code + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3
				+ ", img4=" + img4 + "]";
	}
	public CarImage(Integer i_id, String b_code, String img1, String img2, String img3, String img4) {
		super();
		this.i_id = i_id;
		this.b_code = b_code;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
	}
	
	public CarImage(String b_code, String img1, String img2, String img3, String img4) {
		super();
		this.b_code = b_code;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
	}
	
	public CarImage() {
		// TODO Auto-generated constructor stub
	}
	

}
