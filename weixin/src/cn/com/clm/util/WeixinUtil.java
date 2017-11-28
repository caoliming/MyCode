package cn.com.clm.util;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import cn.com.clm.menu.Button;
import cn.com.clm.menu.ClickButton;
import cn.com.clm.menu.Menu;
import cn.com.clm.menu.ViewButton;
import cn.com.clm.po.AccessToken;
import cn.com.clm.trans.Data;
import cn.com.clm.trans.Parts;
import cn.com.clm.trans.Symbols;
import cn.com.clm.trans.TransResult;
import net.sf.json.JSONObject;

public class WeixinUtil {
	
	private static final String UPLOAD_URL="http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";
	private static final String CREATE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
	
	
	private static final String APPID="wx53f30cbf0072c3af";
	private static final String APPSECRET="adbcebd699fd268f36c35bee72b87edc";
	private static final String ACCESS_TOKEN_URL="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	
	public static String upload(String filePath, String accessToken,String type) throws IOException, NoSuchAlgorithmException, NoSuchProviderException, KeyManagementException {
		File file = new File(filePath);
		if (!file.exists() || !file.isFile()) {
			throw new IOException("文件不存在!");
		}

		String url = UPLOAD_URL.replace("ACCESS_TOKEN", accessToken).replace("TYPE",type);
		
		URL urlObj = new URL(url);
		//连接
		HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();

		con.setRequestMethod("POST"); 
		con.setDoInput(true);
		con.setDoOutput(true);
		con.setUseCaches(false); 

		//设置请求头信息
		con.setRequestProperty("Connection", "Keep-Alive");
		con.setRequestProperty("Charset", "UTF-8");

		//设置边界
		String BOUNDARY = "----------" + System.currentTimeMillis();
		con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);

		StringBuilder sb = new StringBuilder();
		sb.append("--");
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"file\";filename=\"" + file.getName() + "\"\r\n");
		sb.append("Content-Type:application/octet-stream\r\n\r\n");

		byte[] head = sb.toString().getBytes("utf-8");

		//获得输出流
		OutputStream out = new DataOutputStream(con.getOutputStream());
		//输出表头
		out.write(head);

		//文件正文部分
		//把文件已流文件的方式 推入到url中
		DataInputStream in = new DataInputStream(new FileInputStream(file));
		int bytes = 0;
		byte[] bufferOut = new byte[1024];
		while ((bytes = in.read(bufferOut)) != -1) {
			out.write(bufferOut, 0, bytes);
		}
		in.close();

		//结尾部分
		byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");//定义最后数据分隔线

		out.write(foot);

		out.flush();
		out.close();

		StringBuffer buffer = new StringBuffer();
		BufferedReader reader = null;
		String result = null;
		try {
			//定义BufferedReader输入流来读取URL的响应
			reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			if (result == null) {
				result = buffer.toString();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				reader.close();
			}
		}

		JSONObject jsonObj = JSONObject.fromObject(result);
		System.out.println(jsonObj);
		String typeName = "media_id";
		if(!"image".equals(type)){
			typeName = type + "_media_id";
		}
		String mediaId = jsonObj.getString(typeName);
		return mediaId;
	}
		
		
		
	
	public static JSONObject doGetStr(String url){
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpGet httpGet = new HttpGet(url);
		JSONObject jsonObject = null;
		try {
			HttpResponse httpResponse = httpClient.execute(httpGet);
			HttpEntity entity =  httpResponse.getEntity();
			if(null != entity){
				String result = EntityUtils.toString(entity,"UTF-8");
				jsonObject = JSONObject.fromObject(result);
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	public static JSONObject doPostStr(String url,String outStr){
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpPost httpPost = new HttpPost(url);
		JSONObject jsonObject = null;
		try {
			httpPost.setEntity(new StringEntity(outStr, "UTF-8"));
			HttpResponse httpResponse = httpClient.execute(httpPost);
			String result = EntityUtils.toString(httpResponse.getEntity(),"UTF-8");
			jsonObject = JSONObject.fromObject(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	public static AccessToken getAccessToken(){
		AccessToken accessToken = new AccessToken();
		String url=ACCESS_TOKEN_URL.replace("APPID", APPID).replace("APPSECRET", APPSECRET);
		JSONObject jsonObject = doGetStr(url);
		if(null!=jsonObject){
			accessToken.setToken(jsonObject.getString("access_token"));
			accessToken.setExpiresIn(jsonObject.getInt("expires_in"));
		}
		return accessToken;
	}
	
	/**
	 * 组装菜单
	 * @return
	 */
	public static Menu initMenu(){
		Menu menu = new Menu();
		ClickButton button11 = new ClickButton();
		button11.setName("菜单");
		button11.setType("click");
		button11.setKey("11");
		
		ViewButton button21 = new ViewButton();
		button21.setName("系统登录");
		button21.setType("view");
		button21.setUrl("http://car.tunnel.qydev.com/carRental_fore/fore/login.jsp");
		
		ClickButton button31 = new ClickButton();
		button31.setName("扫一扫");
		button31.setType("scancode_push");
		button31.setKey("31");
		
		ViewButton button32 = new ViewButton();
		button32.setName("搜索");
		button32.setType("view");
		button32.setUrl("http://www.baidu.com");
		
		ViewButton button33 = new ViewButton();
		button33.setName("视屏");
		button33.setType("view");
		button33.setUrl("http://www.iqiyi.com");
		
		ViewButton button35 = new ViewButton();
		button35.setName("音乐");
		button35.setType("view");
		button35.setUrl("http://music.qq.com");
		
		ClickButton button34 = new ClickButton();
		button34.setName("我的位置");
		button34.setType("location_select");
		button34.setKey("32");
		
		Button button = new Button();
		button.setName("其他");
		button.setSub_button(new Button[]{button31,button32,button33,button35,button34});
		
		menu.setButton(new Button[]{button11,button21,button});
		return menu;
	}
	
	public static int createMenu(String token,String menu) throws ParseException, IOException{
		int result = 0;
		String url = CREATE_MENU_URL.replace("ACCESS_TOKEN", token);
		JSONObject jsonObject = doPostStr(url, menu);
		if(jsonObject != null){
			result = jsonObject.getInt("errcode");
		}
		return result;
	}



	/*翻译方法*/
	public static String translate(String word) throws UnsupportedEncodingException {
		String APP_ID = "20170410000044518";
		String SECURITY_KEY = "idzngC1NxXpPzHytAjgq";
		//String gbkStr = new String(unicodeStr.getBytes("ISO8859-1"), "GBK"); 
		TransApi api = new TransApi(APP_ID, SECURITY_KEY);
        String result = api.getTransResult(word, "auto", "auto") ;
        
        /*格式转换*/
        JSONObject  jasonObject = JSONObject.fromObject(result);
	    Map map = (Map)jasonObject;
	    String trans_result =  map.getOrDefault("trans_result", "").toString().replace("[", "").replace("]", "");
	    System.out.println(trans_result);
	    JSONObject  jasonObject1 = JSONObject.fromObject(trans_result);
	    Map map1 = (Map)jasonObject1;
	    String src =  map1.getOrDefault("src", "").toString();
	    String res =  map1.getOrDefault("dst", "").toString();
        String rest = src+":"+res;
        
		return rest;
	}
	
	
}
