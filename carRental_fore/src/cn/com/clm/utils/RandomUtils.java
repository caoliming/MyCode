package cn.com.clm.utils;

import java.util.Date;
import java.util.Random;

public class  RandomUtils{
	public  static String genRandomNum(){
		final int maxt=63;
		int i;
		int count = 0;
		char[] str={'a','b','c','d','e','f','g','h','i',
				'j','k','l','m','n','o','p','q','s','t',
				'u','v','w','x','y','z','0','1','2','3',
				'4','5','6','7','8','9','$'};
		StringBuffer pwd = new StringBuffer("");
		Random r = new Random();
		while(count<10){
			i=Math.abs( r.nextInt(maxt));
			if(i>0&&i<str.length){
				pwd.append(str[i]);
				count++;
			}
			
		}
		System.out.println(new Date().getTime());
		return pwd.toString()+"0"+new Date().getTime();
	}	

}
