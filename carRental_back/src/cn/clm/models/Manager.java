package cn.clm.models;

public class Manager {
	private int id;
	private String name;
	private String psw;
	private String sex;
	private int age;
	private String card;
	private String address;
	private String phone;
	private String img;
	private String date;
	private String openid;
	@Override
	public String toString() {
		return "Manager [id=" + id + ", name=" + name + ", psw=" + psw + ", sex=" + sex + ", age=" + age + ", card="
				+ card + ", address=" + address + ", phone=" + phone + ", img=" + img + ", date=" + date + ", openid="
				+ openid + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPsw() {
		return psw;
	}
	public void setPsw(String psw) {
		this.psw = psw;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public Manager(int id, String name, String psw, String sex, int age, String card, String address, String phone,
			String img, String date, String openid) {
		super();
		this.id = id;
		this.name = name;
		this.psw = psw;
		this.sex = sex;
		this.age = age;
		this.card = card;
		this.address = address;
		this.phone = phone;
		this.img = img;
		this.date = date;
		this.openid = openid;
	}
	public Manager(String name, String psw, String sex, int age, String card, String address, String phone, String img,
			String date, String openid) {
		super();
		this.name = name;
		this.psw = psw;
		this.sex = sex;
		this.age = age;
		this.card = card;
		this.address = address;
		this.phone = phone;
		this.img = img;
		this.date = date;
		this.openid = openid;
	}
	public Manager(String name, String psw) {
		super();
		this.name = name;
		this.psw = psw;
	}

	
}
