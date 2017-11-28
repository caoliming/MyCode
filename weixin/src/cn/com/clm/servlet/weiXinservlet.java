package cn.com.clm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.dom4j.DocumentException;
import cn.com.clm.util.CheckUtil;
import cn.com.clm.util.MessageUtil;
import cn.com.clm.util.WeixinUtil;

@WebServlet("/wx.do")
public class weiXinservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String signature = request.getParameter("signature");
		String timestamp = request.getParameter("timestamp");
		String nonce = request.getParameter("nonce");
		String echostr = request.getParameter("echostr");
		
		PrintWriter out = response.getWriter();
		if(CheckUtil.checkSignature(signature, timestamp, nonce)){
			out.print(echostr);
		}
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		try {
			Map<String,String> map = MessageUtil.xmlToMap(request);
			String ToUserName = map.get("ToUserName");
			String FromUserName = map.get("FromUserName");
			String MsgType = map.get("MsgType");
			String Content = map.get("Content");
			
			
			String message=null;
			if(MessageUtil.MESSAGE_TEXT.equals(MsgType)){
				if("1".equals(Content)){
					/*message = MessageUtil.initText(ToUserName, FromUserName, MessageUtil.firstMenu());*/
					message = MessageUtil.initNewsMessage(ToUserName, FromUserName);
				}else if("2".equals(Content)){
					message = MessageUtil.initText(ToUserName, FromUserName, MessageUtil.secondMenu());
				}else if("3".equals(Content)){
					message = MessageUtil.initText(ToUserName, FromUserName, MessageUtil.thredMenu());
				}else if("4".equals(Content)){
					message = MessageUtil.initText(ToUserName, FromUserName, MessageUtil.fourMenu());
				}else if("5".equals(Content)){/*地图定位*/
					message = MessageUtil.initText(ToUserName, FromUserName, MessageUtil.DwMenu());
				}else if("6".equals(Content)){
					message = MessageUtil.initImage(ToUserName, FromUserName);
				}else if("7".equals(Content)){
					message = MessageUtil.init2Image(ToUserName, FromUserName);
				}else if("8".equals(Content)){
					message = MessageUtil.initVideo(ToUserName, FromUserName);
				}else if("9".equals(Content)){
					message = MessageUtil.initMusicMessage(ToUserName, FromUserName);
				}else if("10".equals(Content)){
					message = MessageUtil.initText(ToUserName, FromUserName, MessageUtil.fyMenu());
				}else if(Content.contains("翻译")){
					String word = Content.replaceAll("翻译", "").trim();
					if("".equals(word)){
						message = MessageUtil.initText(ToUserName, FromUserName, MessageUtil.fyMenu());
					}else{
						message = MessageUtil.initText(ToUserName, FromUserName, WeixinUtil.translate(word));
					}
				}else if("?".equals(Content)||"？".equals(Content)){
					message = MessageUtil.initText(ToUserName, FromUserName, MessageUtil.menuText());
				}else if(Content.contains("天气")){
					String tj = Content.replaceAll("天气", "").trim();
					message = MessageUtil.initText(ToUserName, FromUserName, MessageUtil.tqMenu(tj));
				}else{
					message = MessageUtil.initText(ToUserName, FromUserName, MessageUtil.tlMenu(Content));
				}
				
			}else if(MessageUtil.MESSAGE_EVENT.equals(MsgType)){
				String eventType = map.get("Event");
				if(MessageUtil.MESSAGE_SUBSCRIBE.equals(eventType)){
					message = MessageUtil.initText(ToUserName, FromUserName, MessageUtil.menuText());
				}else if(MessageUtil.MESSAGE_CLICK.equals(eventType)){
					message = MessageUtil.initText(ToUserName, FromUserName, MessageUtil.menuText());
				}else if(MessageUtil.MESSAGE_VIEW.equals(eventType)){
					String url = map.get("EventKey");
					message = MessageUtil.initText(ToUserName, FromUserName, url);
				}else if(MessageUtil.MESSAGE_SCANCODE.equals(eventType)){
					String url = map.get("EventKey");
					message = MessageUtil.initText(ToUserName, FromUserName, url);
				}
			}else if(MessageUtil.MESSAGE_LOCATION.equals(MsgType)){
				String label = map.get("Label");
				message = MessageUtil.initText(ToUserName, FromUserName, label);
			}
			
			System.out.println("message:"+message);
			
			out.print(message);
			
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
		
		
	}

}
