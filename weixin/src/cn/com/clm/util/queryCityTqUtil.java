package cn.com.clm.util;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

public class queryCityTqUtil {
	

	/*获取定位*/
	public static Map<String, Object> getDw() throws IOException, NullPointerException {
		URL url = new URL("http://api.map.baidu.com/location/ip?ak="+MessageUtil.DT_AK+"&coor=bd09ll");
		URLConnection connectionData = url.openConnection();
		connectionData.setConnectTimeout(1000);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(
					connectionData.getInputStream(), "UTF-8"));
			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = br.readLine()) != null)
				sb.append(line);
			String datas = sb.toString();
			JSONObject jsonData = JSONObject.fromObject(datas);
			JSONObject content = jsonData.getJSONObject("content");
			
			map.put("gj", jsonData.getString("address").toString().substring(0, 2));
			map.put("street", content.getJSONObject("address_detail").get("street"));
			map.put("addressInfo", content.getString("address").toString());
			map.put("x", content.getJSONObject("point").getString("x"));
			map.put("y", content.getJSONObject("point").getString("y"));
			
		} catch (SocketTimeoutException e) {
			System.out.println("连接超时");
		} catch (FileNotFoundException e) {
			System.out.println("加载文件出错");
		}

		return map;

	}
	/*获取实时天气1*/
	public static Map<String, Object> getTodayWeather1(String Cityid)
			throws IOException, NullPointerException {
		// 连接中央气象台的API
		URL url = new URL("http://www.weather.com.cn/data/sk/" + Cityid
				+ ".html");
		URLConnection connectionData = url.openConnection();
		connectionData.setConnectTimeout(1000);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(
					connectionData.getInputStream(), "UTF-8"));
			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = br.readLine()) != null)
				sb.append(line);
			String datas = sb.toString();
			JSONObject jsonData = JSONObject.fromObject(datas);
			JSONObject info = jsonData.getJSONObject("weatherinfo");
			map.put("city", info.getString("city").toString());// 城市
			map.put("temp", info.getString("temp").toString());// 温度
			map.put("WD", info.getString("WD").toString());// 风向
			map.put("WS", info.getString("WS").toString());// 风速
			map.put("SD", info.getString("SD").toString());// 湿度
			map.put("time", info.getString("time").toString());// 发布时间
			
		} catch (SocketTimeoutException e) {
			System.out.println("连接超时");
		} catch (FileNotFoundException e) {
			System.out.println("加载文件出错");
		}
		
		return map;
		
	}
	
	
	/* 获取实时天气2*/
	public static Map<String, Object> getTodayWeather2(String Cityid)
			throws IOException, NullPointerException {
		// 连接中央气象台的API
		URL url = new URL("http://www.weather.com.cn/data/cityinfo/" + Cityid
				+ ".html");
		URLConnection connectionData = url.openConnection();
		connectionData.setConnectTimeout(1000);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(
					connectionData.getInputStream(), "UTF-8"));
			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = br.readLine()) != null)
				sb.append(line);
			String datas = sb.toString();
			JSONObject jsonData = JSONObject.fromObject(datas);
			JSONObject info = jsonData.getJSONObject("weatherinfo");
			map.put("city", info.getString("city").toString());// 城市
			map.put("temp1", info.getString("temp1").toString());// 最高温度
			map.put("temp2", info.getString("temp2").toString());// 最低温度
			map.put("weather", info.getString("weather").toString());//天气
			map.put("ptime", info.getString("ptime").toString());// 发布时间

		} catch (SocketTimeoutException e) {
			System.out.println("连接超时");
		} catch (FileNotFoundException e) {
			System.out.println("加载文件出错");
		}

		return map;

	}
	
	
	public static void main(String[] args) throws NullPointerException, IOException {
		System.out.println(queryCityTqUtil.getDw());
	}

}

