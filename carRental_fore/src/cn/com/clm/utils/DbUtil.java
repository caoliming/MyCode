package cn.com.clm.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DbUtil {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/*private String url="jdbc:mysql://localhost:3306/student";
	private String user="root";
	private String password="201310538";*/
	
	/*加载驱动
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("加载驱动出现异常");
			e.printStackTrace();
		}
	}*/
	
	/*获取连接*/
	private Connection getConn (){
		try {
			//conn=DriverManager.getConnection(url, user, password);
			/*利用配置文件获取连接*/
			conn=DriverManager.getConnection("proxool.xml-car");
		} catch (SQLException e) {
			System.out.println("获取连接出现异常");
			e.printStackTrace();
		}
		return conn;
	}
	
	/*更新方法*/
	public int update(String sql,Object...objects ){
		try {
			ps=getConn().prepareStatement(sql);
			for(int i=0;i<objects.length;i++){
				ps.setObject(i+1, objects[i]);
			}
			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("更新方法出现异常");
			e.printStackTrace();
		}finally{
			release();
		}
		return -1;
	}
	
	/*查询方法*/
	public List<Map<String ,Object>> query(String sql,Object...objects ){
		List<Map<String ,Object>> list = new ArrayList<>();
		try {
			ps=getConn().prepareStatement(sql);
			for(int i=0;i<objects.length;i++){
				ps.setObject(i+1, objects[i]);
			}
			rs=ps.executeQuery();
			ResultSetMetaData rsmd=rs.getMetaData();/*获得结果集结构化对象*/
			while(rs.next()){
				Map<String ,Object> map = new HashMap<>();
				for(int i=0;i<rsmd.getColumnCount();i++){
					String key=rsmd.getColumnName(i+1);
					Object value=rs.getObject(key);
					map.put(key, value);
				}
				list.add(map);
			}
			return list;
		} catch (SQLException e) {
			System.out.println("查询方法出现异常");
			e.printStackTrace();
		}finally{
			release();
		}
		return null;
	}
	
	/*释放资源*/
	private void release(){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("关闭结果集对象出现异常");
				e.printStackTrace();
			}
		}
		if(ps!=null){
			try {
				ps.close();
			} catch (SQLException e) {
				System.out.println("关闭预处理语句对象出现异常");
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("关闭连接出现异常");
				e.printStackTrace();
			}
		}
	}

	/*��ý������¼��*/
	public int getRecords(String sql){
		sql = "select count(*) as num from ("+sql+") as t";
		return Integer.parseInt(query(sql).get(0).get("num").toString());
	}
	
}
