package cn.com.clm.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.Part;

public class HttpUtils {
	public static String  fileUpload(Part part,String parent) throws IOException{
		String imageName="";
		/*获取原始文件名称*/
		String realName=part.getSubmittedFileName();
		if("".equals(realName)){
			realName = "default.png";
			return realName;
		}
		/*System.out.println("werqw"+realName);*/
		/*使用工具类生成一个随机的文件名称*/
		imageName=FileHelper.generateFileName(realName);
		if(part!=null){
			FileOutputStream out=null;
			InputStream in=null;
			try{
				File file=new File(parent,imageName);
				if(!file.exists()){
					file.createNewFile();
				}
				in=part.getInputStream();
				out=new FileOutputStream(file);
				byte [] cache=new byte[255];
				int length=0;
				while((length=in.read(cache))!=-1){
					out.write(cache, 0, length);
				}
			}catch(Exception e){
				
			}finally{
				if(in!=null){
					in.close();
				}
				if(out!=null){
					out.close();
				}
			}
		}
		return imageName;
	}
	public static String  fileUpload2(String realName,String parent) throws IOException{
		String imageName="";
		/*获取原始文件名称*/
		if("".equals(realName)){
			realName = "default.png";
			return realName;
		}
		/*System.out.println("werqw"+realName);*/
		/*使用工具类生成一个随机的文件名称*/
		imageName=FileHelper.generateFileName(realName);
			FileOutputStream out=null;
			InputStream in=null;
			try{
				File file=new File(parent,imageName);
				if(!file.exists()){
					file.createNewFile();
				}
				in=((Part) file).getInputStream();
				out=new FileOutputStream(file);
				byte [] cache=new byte[255];
				int length=0;
				while((length=in.read(cache))!=-1){
					out.write(cache, 0, length);
				}
			}catch(Exception e){
				
			}finally{
				if(in!=null){
					in.close();
				}
				if(out!=null){
					out.close();
				}
			}
		
		return imageName;
	}
}
