package clm.pc.auth.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clm.wx.auth.util.Authutil;
import clm.wx.auth.util.DbUtil;
import net.sf.json.JSONObject;

@WebServlet("/callBack")
public class CallBackSerclet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String code = req.getParameter("code");
		String url = "https://api.weixin.qq.com/sns/oauth2/access_token?"
				+ "appid="+Authutil.APPID
				+ "&secret="+Authutil.APPSECRET
				+ "&code="+code
				+ "&grant_type=authorization_code";
		JSONObject jsonObject = Authutil.doGet(url);
		String openid = jsonObject.getString("openid");
		String access_token = jsonObject.getString("access_token");
		String infoUrl ="https://api.weixin.qq.com/sns/userinfo?"
				+ "access_token="+access_token
				+ "&openid="+openid
				+ "&lang=zh_CN";
		JSONObject userInfo = Authutil.doGet(infoUrl);
		System.out.println(userInfo);
		
		//使用微信用户信息直接登录，无需绑定
		//req.setAttribute("info", userInfo);
		//req.getRequestDispatcher("/index1.jsp").forward(req, resp);
		
		
		//2.
		String nickName = getNickName(openid);
		if(!"".equals(nickName)){//绑定成功
			req.setAttribute("nickName", nickName);
			req.getRequestDispatcher("/index2.jsp").forward(req, resp);
		}else{//未绑定
			req.setAttribute("openid", openid);
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
		}
	}
	
	public String getNickName(String openid){
		DbUtil db = new DbUtil();
		String sql="SELECT NICKNAME FROM USER WHERE OPENID=?";
		String nickName = db.query(sql, openid).size()==0?"":db.query(sql, openid).get(0).getOrDefault("NICKNAME", "").toString();
		return nickName;
	}
	
	public int updateUser(String openid,String account,String password){
		DbUtil db = new DbUtil();
		String sql="UPDATE USER SET OPENID=? WHERE ACCOUNT=? AND PASSWORD=?";
		int temp = db.update(sql, openid,account,password);
		return temp;
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String account = req.getParameter("account");
		String password = req.getParameter("password");
		String openid = req.getParameter("openid");
		
		int temp = updateUser(openid, account, password);
		if(temp>0){
			System.out.println("绑定成功！");
		}else{
			System.out.println("绑定s失败！");
		}
	
	}
}
