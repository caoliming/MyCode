package clm.wx.auth.servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clm.wx.auth.util.Authutil;

@WebServlet("/wxlogin")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String backUrl = "http://car.tunnel.qydev.com/WxAuth/callBack";
		String url = "https://open.weixin.qq.com/connect/oauth2/authorize?"
				+ "appid="+Authutil.APPID
				+ "&redirect_uri="+URLEncoder.encode(backUrl)
				+ "&response_type=code"
				+ "&scope=snsapi_userinfo"
				+ "&state=STATE#wechat_redirect";
		resp.sendRedirect(url);
	}
}
