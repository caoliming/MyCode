package clm.wx.auth.util;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import net.sf.json.JSONObject;

public class Authutil {
	public static final String APPID="wx53f30cbf0072c3af";
	public static final String APPSECRET="adbcebd699fd268f36c35bee72b87edc";
	
	
	public static JSONObject doGet(String url) throws ClientProtocolException, IOException{
		JSONObject jsonObject = null;
		DefaultHttpClient client = new DefaultHttpClient();
		HttpGet httpGet = new HttpGet(url);
		HttpResponse response = client.execute(httpGet);
		HttpEntity entity = response.getEntity();
		if(null != entity){
			String result = EntityUtils.toString(entity); 
			jsonObject = JSONObject.fromObject(result);
		}
		httpGet.releaseConnection();
		return jsonObject;
	}

}
