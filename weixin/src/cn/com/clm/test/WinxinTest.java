package cn.com.clm.test;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.Map;

import cn.com.clm.po.AccessToken;
import cn.com.clm.util.MessageUtil;
import cn.com.clm.util.TransApi;
import cn.com.clm.util.WeixinUtil;
import net.sf.json.JSON;
import net.sf.json.JSONObject;

public class WinxinTest {
	private static final String APP_ID = "20170410000044518";
    private static final String SECURITY_KEY = "idzngC1NxXpPzHytAjgq";
	public static void main(String[] args) throws KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException, UnsupportedEncodingException, IOException {
		try {
			AccessToken accessToken =WeixinUtil.getAccessToken();
			System.out.println("票据："+accessToken.getToken());
			System.out.println("有效时间："+accessToken.getExpiresIn());
			
			/*String path="D:/a_roure/fxtxqczu.mp4";
			String mediaId= WeixinUtil.upload(path, accessToken.getToken(), "video");
			System.out.println("mediaId:"+mediaId);*/
			
			
			String menu = JSONObject.fromObject(WeixinUtil.initMenu()).toString();
			int res = WeixinUtil.createMenu(accessToken.getToken(), menu);
			if(res==0){
				System.out.println("菜单创建成功");
			}else{
				System.out.println(res);
			}
			
			/*TransApi api = new TransApi(APP_ID, SECURITY_KEY);
			String query = "足球";
	        System.out.println(api.getTransResult(query, "auto", "en") );*/
			/*String word="football";
			String APP_ID = "20170410000044518";
			String SECURITY_KEY = "idzngC1NxXpPzHytAjgq";
			//String gbkStr = new String(unicodeStr.getBytes("ISO8859-1"), "GBK"); 
			TransApi api = new TransApi(APP_ID, SECURITY_KEY);
	        String result = api.getTransResult(word, "auto", "auto") ;
		    System.out.println("result："+result); 
		    
		    JSONObject  jasonObject = JSONObject.fromObject(result);
		    Map map = (Map)jasonObject;
		    String trans_result =  map.getOrDefault("trans_result", "").toString().replace("[", "").replace("]", "");
		    System.out.println(trans_result);
		    JSONObject  jasonObject1 = JSONObject.fromObject(trans_result);
		    Map map1 = (Map)jasonObject1;
		    String res =  map1.getOrDefault("dst", "").toString();
		    String src =  map1.getOrDefault("src", "").toString();
		    
		    
		    System.out.println(res);*/
			
			//String text="你好！";
			//String url="http://www.tuling123.com/openapi/api?key=fb6b7bcfbe52fccdb7f5d752a3088f75&info="+text+"&userid=1234567";
			
			/*String APIKEY ="fb6b7bcfbe52fccdb7f5d752a3088f75";
	        String INFO = URLEncoder.encode("你好!", "utf-8");//这里可以输入问题
	        String getURL = "http://www.tuling123.com/openapi/api?key=" + APIKEY + "&info=" + INFO;
	        URL getUrl = new URL(getURL);
	        HttpURLConnection connection = (HttpURLConnection) getUrl.openConnection();
	        connection.connect();

	        // 取得输入流，并使用Reader读取
	        BufferedReader reader = new BufferedReader(new InputStreamReader( connection.getInputStream(), "utf-8"));
	        StringBuffer sb = new StringBuffer();
	        String line = "";
	        while ((line = reader.readLine()) != null) {
	            sb.append(line);
	        }
	        reader.close();
	        // 断开连接
	        connection.disconnect();
			System.out.println("sb"+sb);*/
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
