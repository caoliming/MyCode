package cn.com.clm.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.thoughtworks.xstream.XStream;

import cn.com.clm.po.Image;
import cn.com.clm.po.ImageMessage;
import cn.com.clm.po.Music;
import cn.com.clm.po.MusicMessage;
import cn.com.clm.po.News;
import cn.com.clm.po.NewsMessage;
import cn.com.clm.po.TextMessage;
import net.sf.json.JSONObject;

public class MessageUtil {
	public static final String MESSAGE_MUSIC = "music";
	public static final String MESSAGE_TEXT="text";
	public static final String MESSAGE_NEWS="news";
	public static final String MESSAGE_IMAGE="image";
	public static final String MESSAGE_VOICE="voice";
	public static final String MESSAGE_VIDEO="video";
	public static final String MESSAGE_LINK="link";
	public static final String MESSAGE_LOCATION="location";
	public static final String MESSAGE_EVENT="event";
	public static final String MESSAGE_SUBSCRIBE="subscribe";
	public static final String MESSAGE_UNSUBSCRIBE="unsubscribe";
	public static final String MESSAGE_CLICK="CLICK";
	public static final String MESSAGE_VIEW="VIEW";
	public static final String MESSAGE_SCANCODE= "scancode_push";
	
	
	public static final String DT_AK="TQ2MVjZ2vrsGRG2hp6lDiYfTlW9ghlcK";
	
	
	
	/**
	 * xml转map
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws DocumentException
	 */
	public static Map<String,String> xmlToMap(HttpServletRequest request) throws IOException, DocumentException{
		Map<String,String> map = new HashMap<>();
		SAXReader reader = new SAXReader();
		InputStream in = request.getInputStream();
		Document doc = reader.read(in);
		Element root = doc.getRootElement();
		List<Element> list = root.elements();
		for(Element e:list){
			map.put(e.getName(), e.getText());
		}
		in.close();
		return map;
	}
	
	/**
	 * 将文本消息转化为xml
	 * @param textMessage
	 * @return
	 */
	public static String textMessageToXml(TextMessage textMessage){
		XStream xstream = new XStream();
		xstream.alias("xml", textMessage.getClass());
		return xstream.toXML(textMessage);
	}
	
	/**
	 * 图片消息转为xml
	 * @param imageMessage
	 * @return
	 */
	public static String imageMessageToXml(ImageMessage imageMessage){
		XStream xstream = new XStream();
		xstream.alias("xml", imageMessage.getClass());
		return xstream.toXML(imageMessage);
	}
	
	/**
	 * 音乐消息转为xml
	 * @param musicMessage
	 * @return
	 */
	public static String musicMessageToXml(MusicMessage musicMessage){
		XStream xstream = new XStream();
		xstream.alias("xml", musicMessage.getClass());
		return xstream.toXML(musicMessage);
	}
	
	/**
	 * 图文消息转换为xml
	 * @param newsMessage
	 * @return
	 */
	public static String newsMessageToXml(NewsMessage newsMessage){
		XStream xstream = new XStream();
		xstream.alias("xml", newsMessage.getClass());
		xstream.alias("item", new News().getClass());
		return xstream.toXML(newsMessage);
	}
	
	/**
	 * 图文消息的组装
	 * @param ToUserName
	 * @param FromUserName
	 * @return
	 */
	public static String initNewsMessage(String ToUserName,String FromUserName){
		String message = null;
		List<News> newsList = new ArrayList<>();
		NewsMessage newsMessage = new NewsMessage();
		News news = new News();
		
		news.setTitle("风行天下汽车租赁系统介绍");
		news.setDescription("主要针对于微信用户开放，遵守服务于用户的原则，为用户提供所需要的服务。");
		news.setPicUrl("http://car.tunnel.qydev.com/weixin/images/logo.jpg");
		news.setUrl("http://car.tunnel.qydev.com/carRental_fore/fore/login.jsp");
		newsList.add(news);
		
		newsMessage.setToUserName(FromUserName);
		newsMessage.setFromUserName(ToUserName);
		newsMessage.setCreateTime(new Date().getTime());
		newsMessage.setMsgType(MESSAGE_NEWS);
		newsMessage.setArticles(newsList);
		newsMessage.setArticleCount(newsList.size());
		
		message=newsMessageToXml(newsMessage);
		
		return message;
	}
	
	/*主菜单*/
	public static String menuText(){
		StringBuffer str = new StringBuffer();
		str.append("---主----菜----单---\n");
		str.append("1.风行天下汽车租赁系统介绍\n");
		str.append("2.租车流程介绍\n");
		str.append("3.积分兑换说明\n");
		str.append("4.天气预报\n");
		str.append("5.地图定位\n");
		str.append("6.系统LOGO\n");
		str.append("7.二维码关注\n");
		str.append("8.宣传片\n");
		str.append("9.我的音乐\n");
		str.append("10.翻译\n\n");
		str.append("回复 ？ 调出此菜单");
		return str.toString();
	}
	/*回复1*/
	public static String firstMenu(){
		StringBuffer str = new StringBuffer();
		str.append("该系统完成于2017年4月；主要针对于微信用户开放，遵守服务于用户的原则，为用户提供所需要的服务。");
		return str.toString();
	}
	/*回复2*/
	public static String secondMenu(){
		StringBuffer str = new StringBuffer();
		str.append("预约：登录（新用户注册）/按条件选车/预约/生成订单/支付订单/预约成功（可打印订单）\n");
		str.append("提车：进入实体店/提车/使用\n");
		str.append("还车：将汽车还至实体店/还车认证\n");
		return str.toString();
	}
	/*回复3*/
	public static String thredMenu(){
		StringBuffer str = new StringBuffer();
		str.append("积分兑换：\n");
		str.append("用户登录汽车租赁系统，查询自己的积分，可以兑换为现金存入自己的账户中，在下次租赁汽车是可以使用。\n（兑换公式：现金=积分*5%）");
		return str.toString();
	}
	/*翻译*/
	public static String fyMenu(){
		StringBuffer str = new StringBuffer();
		str.append("翻译菜单\n\n");
		str.append("使用示例：\n");
		str.append("翻译足球\n");
		str.append("翻译football\n");
		return str.toString();
	}
	
	/*查询天气1*/
	public static String tqMenu(String Content) throws NullPointerException, IOException{
		StringBuffer str = new StringBuffer();
		String cityId=CityId.getCityId(Content);
		if(null!=cityId){
			Map<String, Object> map = queryCityTqUtil.getTodayWeather1(cityId);
			str.append("查询结果1：\n");
			str.append("城市："+map.get("city")+"\n");
			str.append("温度："+map.get("temp")+"℃\n");
			str.append("风向："+map.get("WD")+"\n");
			str.append("风速："+map.get("WS")+"\n");
			str.append("湿度："+map.get("SD")+"\n");
			str.append("发布时间："+map.get("time")+"\n\n");	
			
			str.append("查询结果2：\n");
			Map<String, Object> map2 = queryCityTqUtil.getTodayWeather2(cityId);
			str.append("城市："+map2.get("city")+"\n");
			str.append("温度："+map2.get("temp1")+"~"+map2.get("temp2")+"\n");
			str.append("天气："+map2.get("weather")+"\n");
			str.append("发布时间："+map2.get("ptime"));	
			
			return str.toString();
		}
		return fourMenu();
	}
	/*查询天气2*/
	public static String fourMenu() throws NullPointerException, IOException{
		return "请回复（例：兰州天气）";
	}
	/*地图定位*/
	public static String DwMenu() throws NullPointerException, IOException{
		StringBuffer str = new StringBuffer();
		Map<String, Object> map = queryCityTqUtil.getDw();
		str.append("查询结果：\n");
		str.append("国家："+map.get("gj")+"\n");
		str.append("城市："+map.get("addressInfo")+"\n");
		str.append("街道："+map.get("street")+"\n");
		str.append("经度："+map.get("x")+"\n");
		str.append("纬度："+map.get("y")+"\n\n");
		
		/*String str1 = java.net.URLEncoder.encode(map.get("addressInfo").toString(),"UTF-8");
		String str2 = java.net.URLEncoder.encode(map.get("addressInfo").toString()+"相关周边搜索","UTF-8");*/
		String url ="http://api.map.baidu.com/marker?location="+map.get("x")+","+map.get("y")+"&output=html";
		
		str.append("点我："+url);
		return str.toString();
	}
	
	
	public static String initText(String ToUserName,String FromUserName,String Content){
		TextMessage text = new TextMessage();
		text.setFromUserName(ToUserName);
		text.setToUserName(FromUserName);
		text.setMsgType(MessageUtil.MESSAGE_TEXT);
		text.setCreateTime(new Date().getTime());
		text.setContent(Content);
		return MessageUtil.textMessageToXml(text);
	}
	
	//logo
	public static String initImage(String ToUserName,String FromUserName){
		String message=null;
		Image image=new Image();
		image.setMedia_id("JwgiL-7Cs1g36lboL35sXEGQKojsD9-0IVlQBNK6itB1Wx-vlD0TOrdo1k6s_Amk");
		ImageMessage imageMessage = new ImageMessage();
		imageMessage.setFromUserName(ToUserName);
		imageMessage.setToUserName(FromUserName);
		imageMessage.setMsgType(MESSAGE_IMAGE);
		imageMessage.setCreateTime(new Date().getTime());
		imageMessage.setImage(image);
		message = imageMessageToXml(imageMessage);
		return message;
	}
	
	//二维码关注
	public static String init2Image(String ToUserName,String FromUserName){
		String message=null;
		Image image=new Image();
		image.setMedia_id("rVrQN7EpyIGBpMFBJgCPZC2uLzRPTKrccCMvgYdB5B5sAsavscR42FK-Epd4JMi6");
		ImageMessage imageMessage = new ImageMessage();
		imageMessage.setFromUserName(ToUserName);
		imageMessage.setToUserName(FromUserName);
		imageMessage.setMsgType(MESSAGE_IMAGE);
		imageMessage.setCreateTime(new Date().getTime());
		imageMessage.setImage(image);
		message = imageMessageToXml(imageMessage);
		return message;
	}
	//视屏
	public static String initVideo(String ToUserName,String FromUserName){
		String message=null;
		Image image=new Image();
		image.setMedia_id("acIhhe728sHLSCqwC9C861--4Z_Cs3N2AZJzleMWogVJRaFYfa_pefi8jCJgtQqC");
		ImageMessage imageMessage = new ImageMessage();
		imageMessage.setFromUserName(ToUserName);
		imageMessage.setToUserName(FromUserName);
		imageMessage.setMsgType(MESSAGE_VIDEO);
		imageMessage.setCreateTime(new Date().getTime());
		imageMessage.setImage(image);
		message = imageMessageToXml(imageMessage);
		return message;
	}
	
	/* 组装音乐消息*/
	public static String initMusicMessage(String toUserName,String fromUserName){
		String message = null;
		Music music = new Music();
		music.setThumbMediaId("FGnd3o7l3hRXlYdyVSFUaZRUNRfAFbiYUuoyGuG6P1CVSBdsaskfVUuukZnTMt7l");
		music.setTitle("see you again");
		music.setDescription("享受速度与激情！");
		music.setMusicUrl("http://car.tunnel.qydev.com/weixin/resource/SeeYouAgain.mp3");
		music.setHQMusicUrl("http://car.tunnel.qydev.com/weixin/resource/SeeYouAgain.mp3");
		
		MusicMessage musicMessage = new MusicMessage();
		musicMessage.setFromUserName(toUserName);
		musicMessage.setToUserName(fromUserName);
		musicMessage.setMsgType(MESSAGE_MUSIC);
		musicMessage.setCreateTime(new Date().getTime());
		musicMessage.setMusic(music);
		message = musicMessageToXml(musicMessage);
		return message;
	}

	public static String tlMenu(String content) throws Exception {
		String APIKEY ="fb6b7bcfbe52fccdb7f5d752a3088f75";
        String INFO = URLEncoder.encode(content, "utf-8");//这里可以输入问题
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
        
        JSONObject  jasonObject = JSONObject.fromObject(sb.toString());
	    Map map = (Map)jasonObject;
	    String result =  map.getOrDefault("text", "").toString();
        
		return result;
	}

}
