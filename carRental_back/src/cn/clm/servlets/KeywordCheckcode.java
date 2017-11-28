package cn.clm.servlets;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/KeywordCheckcode")
public class KeywordCheckcode extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "No-cache");
		response.setDateHeader("Expires", 0);
		//制定生成响应的图片
		response.setContentType("image/jpeg");
		int width = 270;
		int height = 50;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
		Graphics g = image.getGraphics();
		Random random = new Random();
		g.setColor(new Color(0xCCCCCC));
		
		for(int i=0;i<150;i++){
			int x = random.nextInt(width-1);
			int y = random.nextInt(height-1);
			int x1 = random.nextInt(3)+1;
			int y1 = random.nextInt(6)+1;
			g.drawLine(x, y, x+x1,y+y1);
		}
		
		String str = request.getParameter("number");
		String sRand = "";
		String randomPosition = ",";
		int strLength = str.length();
		int r=0,i=0;
		while(i<4){
			r = random.nextInt(strLength-1);
			if(randomPosition.indexOf(","+r+",")==-1){
				randomPosition += String.valueOf(r)+",";
				i++;
			}
		}
		
		String colorValue = "";
		Color color = Color.RED;
		switch (random.nextInt(3)) {
		case 0:
			colorValue = "红色";
			color = Color.RED;
			break;
		case 1:
			colorValue = "白色";
			color = Color.WHITE;
			break;
		case 2:
			colorValue = "蓝色";
			color = Color.BLUE;
			break;
		}
		for(int j=0;j<strLength;j++){
			if(randomPosition.indexOf(","+String.valueOf(j)+",")==-1){
				g.setFont(new Font("楷体", Font.BOLD, 22));
				g.setColor(new Color(0x009900));
			}else{
				g.setFont(new Font("楷体", Font.BOLD, 24));
				g.setColor(color);
				sRand += str.substring(j,j+1);
			}
			g.drawString(str.substring(j,j+1), width/(strLength)*j+3, 20);
		}
		
		g.setFont(new Font("宋体", Font.PLAIN, 13));
		g.setColor(Color.WHITE);
		g.drawString("请输入上面字符串中【"+colorValue+"】的大号文字！", 3, 40);
		
		request.getSession().setAttribute("randCheckCode", sRand);
		System.out.println("sRand:"+sRand);
		g.dispose();
		ImageIO.write(image, "JPEG", response.getOutputStream());
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
