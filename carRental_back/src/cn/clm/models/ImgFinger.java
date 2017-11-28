package cn.clm.models;

public class ImgFinger {
	private String code;
	private String i1;
	private String i2;
	private String i3;
	private String i4;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getI1() {
		return i1;
	}
	public void setI1(String i1) {
		this.i1 = i1;
	}
	public String getI2() {
		return i2;
	}
	public void setI2(String i2) {
		this.i2 = i2;
	}
	public String getI3() {
		return i3;
	}
	public void setI3(String i3) {
		this.i3 = i3;
	}
	public String getI4() {
		return i4;
	}
	public void setI4(String i4) {
		this.i4 = i4;
	}
	@Override
	public String toString() {
		return "ImgFinger [code=" + code + ", i1=" + i1 + ", i2=" + i2 + ", i3=" + i3 + ", i4=" + i4 + "]";
	}
	public ImgFinger(String code, String i1, String i2, String i3, String i4) {
		super();
		this.code = code;
		this.i1 = i1;
		this.i2 = i2;
		this.i3 = i3;
		this.i4 = i4;
	}
	
	
	

}
