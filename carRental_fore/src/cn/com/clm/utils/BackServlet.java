package cn.com.clm.utils;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/BackServlet")
public class BackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        String r1_Code=request.getParameter("r1_Code");
        if("1".equals(r1_Code))
        {
            String hmac=request.getParameter("hmac");
            String r3_Amt=request.getParameter("r3_Amt");
            String r6_Order=request.getParameter("r6_Order");
            String rp_PayDate=request.getParameter("rp_PayDate");
            request.setAttribute("msg", "支付成功！");
            request.setAttribute("hmac",hmac );
            request.setAttribute("r6_Order",r6_Order );
            request.setAttribute("r3_Amt", r3_Amt);
            request.setAttribute("r_info", "风行天下汽车租赁");
            request.setAttribute("rp_PayDate", rp_PayDate);
            request.getRequestDispatcher("/views/paymentResult.jsp").forward(request, response);
        }else{
            request.setAttribute("msg", "支付失败!");
            request.getRequestDispatcher("/views/paymentResult.jsp").forward(request, response);
        }
    }
	
}
