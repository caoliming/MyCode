package cn.clm.listeners;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class LineSessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		Object obj=se.getSession().getServletContext().getAttribute("count");
		if(obj==null){
			se.getSession().getServletContext().setAttribute("count", 1);
		}else{
			se.getSession().getServletContext().setAttribute("count", Integer.parseInt(obj.toString())+1);
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		Object obj=se.getSession().getServletContext().getAttribute("count");
		if(obj!=null){
			int count=Integer.parseInt(obj.toString());
			if(count>=1){
				count--;
				se.getSession().getServletContext().setAttribute("count", count);
			}
		}
	}

}
