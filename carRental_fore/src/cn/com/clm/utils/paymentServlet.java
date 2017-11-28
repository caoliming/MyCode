package cn.com.clm.utils;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/paymentServlet")
public class paymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("GBK");
		
		String orderId = request.getParameter("orderId");
		String amount = "0.01";
		
		String pd_FrpId = request.getParameter("pd_FrpId");
		String p1_MerId = getConfigInfo.getValue("p1_MerId");
		String keyValue = getConfigInfo.getValue("keyValue");
		String merchantCallbackURL = getConfigInfo.getValue("merchantCallbackURL");
		
		String messageType="Buy";
		String currency="CNY";
		String productDesc="";
		String productCat="";
		String productId="";
		String addressFlag="0";
		String sMctProperties="";
		String pr_NeedResponse="0";
		
		String md5Hmac = paymentUtil.buildHmac(messageType, p1_MerId, orderId, 
				amount, currency, productId, productCat, productDesc, merchantCallbackURL, addressFlag, sMctProperties,
				pd_FrpId, pr_NeedResponse,keyValue);
		
		request.setAttribute("messageType", messageType);
		request.setAttribute("p1_MerId", p1_MerId);
		request.setAttribute("orderId", orderId);
		request.setAttribute("amount", amount);
		request.setAttribute("currency", currency);
		request.setAttribute("productId", productId);
		request.setAttribute("productCat", productCat);
		request.setAttribute("productDesc", productDesc);
		request.setAttribute("merchantCallbackURL", merchantCallbackURL);
		request.setAttribute("addressFlag", addressFlag);
		request.setAttribute("sMctProperties", sMctProperties);
		request.setAttribute("pd_FrpId", pd_FrpId);
		request.setAttribute("pr_NeedResponse", pr_NeedResponse);
		request.setAttribute("md5Hmac", md5Hmac);
		
		request.getRequestDispatcher("/WEB-INF/page/connection.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
