package cn.com.clm.utils;

public class paymentUtil {
	
	public static String buildHmac(String p0_Cmd,String p1_MerId,
			String p2_Order,String p3_Amt,String p4_Cur,String p5_Pid,String p6_Pcat,
			String p7_Pdesc,String p8_Url,String p9_SAF,String pa_MP,String pd_FrpId,
			String pr_NeedResponse,String keyValue){
		StringBuffer sValue = new StringBuffer();
		sValue.append(p0_Cmd);
		sValue.append(p1_MerId);
		sValue.append(p2_Order);
		sValue.append(p3_Amt);
		sValue.append(p4_Cur);
		sValue.append(p5_Pid);
		sValue.append(p6_Pcat);
		sValue.append(p7_Pdesc);
		sValue.append(p8_Url);
		sValue.append(p9_SAF);
		sValue.append(pa_MP);
		sValue.append(pd_FrpId);
		sValue.append(pr_NeedResponse);
		
		String sNewString = md5Util.hmacSign(sValue.toString(),keyValue);
		return sNewString;
		
		
	}

}
