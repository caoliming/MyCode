package cn.com.clm.utils;

import java.util.ResourceBundle;

public class getConfigInfo {
	
	private static ResourceBundle cache = null;
	static{
		try{
			cache = ResourceBundle.getBundle("merchantInfo");
		}catch(RuntimeException e){
			e.printStackTrace();
		}
		
	}
	
	public static String getValue(String key){
		return cache.getString(key);
	}
}
