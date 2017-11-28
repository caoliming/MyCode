package cn.clm.models;

public class SystemSet {
	private int id;
	private String name;
	private String logo;
	private String xcVideo;
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
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getXcVideo() {
		return xcVideo;
	}
	public void setXcVideo(String xcVideo) {
		this.xcVideo = xcVideo;
	}
	@Override
	public String toString() {
		return "SystemSet [id=" + id + ", name=" + name + ", logo=" + logo + ", xcVideo=" + xcVideo + "]";
	}
	public SystemSet(String name, String logo, String xcVideo) {
		super();
		this.name = name;
		this.logo = logo;
		this.xcVideo = xcVideo;
	}
	public SystemSet(int id, String name, String logo, String xcVideo) {
		super();
		this.id = id;
		this.name = name;
		this.logo = logo;
		this.xcVideo = xcVideo;
	}
	public SystemSet() {
		// TODO Auto-generated constructor stub
	}

}
