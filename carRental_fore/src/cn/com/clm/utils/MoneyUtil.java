package cn.com.clm.utils;

public class MoneyUtil {
	
	public static double getAllMoney(int days,double price){
		double allPrice = 0;
		if(days < 7){
			allPrice = days * price * 0.9 ;
		}else if(days < 28){
			allPrice = days * price * 0.8 ;
		}else if(days < 100){
			allPrice = days * price * 0.7 ;
		}else if(days < 200){
			allPrice = days * price * 0.6 ;
		}else{
			allPrice = days * price * 0.5 ;
		}
		return allPrice;
	}

}
