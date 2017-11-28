package cn.com.clm.utils;

import java.text.ParseException;
import java.util.Date;

public class dateUtil {
	/*传入两个字符串日期(2016-06-08)，求差值*/
	public static long getDaySub(String beginDateStr,String endDateStr)
    {
        long day=0;
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");    
        Date beginDate=null;
        Date endDate=null;
        try{
            beginDate = format.parse(beginDateStr);
            endDate= format.parse(endDateStr);    
            day=(endDate.getTime()-beginDate.getTime())/(24*60*60*1000);    
        } catch (ParseException e){
            e.printStackTrace();
        }   
        return day;
    }

	public static int getYearSub(String beginDateStr,String endDateStr)
	{   
		int begin = Integer.parseInt(beginDateStr.split("-")[0]);
		int end = Integer.parseInt(endDateStr.split("-")[0]);
		return end-begin;
	}
	
}
