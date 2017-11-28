package cn.com.clm.beans;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Page {
	private String sql;
	private int size;//每页显示的条数
	private List<Car> date;
	private int page;//当前页
	private int totalPage;//总页数
	
	public Page() {
	}
	
	public Page(String sql, int size, int page) {
		super();
		this.sql = sql;
		this.size = size;
		this.page = page;
	}

	public Page(String sql, int size, List<Car> date, int page, int totalPage) {
		super();
		this.sql = sql;
		this.size = size;
		this.date = date;
		this.page = page;
		this.totalPage = totalPage;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public List<Car> getDate() {
		return date;
	}

	public void setDate(List<Car> date) {
		this.date = date;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	@Override
	public String toString() {
		return "Page [sql=" + sql + ", size=" + size + ", date=" + date + ", page=" + page + ", totalPage=" + totalPage
				+ "]";
	}
	
	
}
