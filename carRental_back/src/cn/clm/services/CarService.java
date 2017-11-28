package cn.clm.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.clm.models.Car;
import cn.clm.models.CarImage;
import cn.clm.utils.DbUtil;
import cn.clm.utils.ImageFindUtil;

public class CarService {
	private DbUtil db;
	private String sql;
	private List<Map<String,Object>> list;
	private int result;
	private int result1;
	private int result2;
	
	/*添加汽车属性和图片*/
	public boolean addCar(Car c,CarImage ci) {
		db=new DbUtil();
		sql="INSERT INTO car(t_id,b_id,b_code,b_kuanshi,b_buydate,b_zuowei,b_chemen,b_ranliao,b_biansu,b_zuoyi,b_isdao,b_iswindow,b_introduce,b_price,state) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		result = db.update(sql,c.getT_id(),c.getB_id(),c.getB_code(),c.getB_kuanshi(),c.getB_buydate(),c.getB_zuowei(),c.getB_chemen(),c.getB_ranliao(),c.getB_biansu(),c.getB_zuoyi(),c.getB_isdao(),c.getB_iswindow(),c.getB_introduce(),c.getB_price(),c.getState());
		sql="INSERT INTO car_img(b_code,img1,img2,img3,img4)VALUES(?,?,?,?,?)";
		result1 = db.update(sql,ci.getB_code(),ci.getImg1(),ci.getImg2(),ci.getImg3(),ci.getImg4());
		
		
		
		return (result>0&&result1>0)? true:false;
	}

	public List<Map<String, Object>> queryAllCar() {
		db=new DbUtil();
		sql = "SELECT c_id,t.t_type,b.b_name,c.b_code,b_buydate,b_zuowei,b_chemen,b_ranliao,b_biansu,b_zuoyi,b_isdao,b_iswindow,c.b_introduce,b_price,state,img1,img2,img3,img4 FROM car c,car_img ci,TYPE t,biaozhi b WHERE c.b_code=ci.b_code AND c.b_id=b.b_id AND c.t_id=t.t_id";
		list = db.query(sql);
		return list;
	}

	public List<Map<String, Object>> queryOneCar(String code) {
		db=new DbUtil();
		sql = "SELECT c_id,t.t_type,t.t_img,b.b_name,b.b_img,c.b_code,b_buydate,b_zuowei,b_chemen,b_ranliao,b_biansu,b_zuoyi,b_isdao,b_iswindow,c.b_introduce,b_price,state,img1,img2,img3,img4 FROM car c,car_img ci,TYPE t,biaozhi b WHERE c.b_code=ci.b_code AND c.b_id=b.b_id AND c.t_id=t.t_id AND c.b_code=?";
		list = db.query(sql,code);
		return list;
	}
	
	//可用
	public int getKyCar(){
		db =new DbUtil();
		sql="SELECT * FROM car WHERE state='Y'";
		result=db.query(sql).size();
		return result;
	}
	//已预约
	public int getYyCar() {
		db =new DbUtil();
		sql="SELECT * FROM car WHERE state='N'";
		result=db.query(sql).size();
		return result;
	}
	//已租出
	public int getYzCar() {
		db =new DbUtil();
		sql="SELECT * FROM car WHERE state='Z'";
		result=db.query(sql).size();
		return result;
	}
	//<80
	public int[] getPrice(){
		int a[] = new int[5];
		db =new DbUtil();
		//<80
		sql="SELECT COUNT(*) AS num FROM car WHERE b_price<80";
		a[0]=Integer.parseInt(db.query(sql).get(0).getOrDefault("num", 0).toString()) ;
		//80-110
		sql="SELECT COUNT(*) AS num FROM car WHERE b_price>=80 AND b_price<110";
		a[1]=Integer.parseInt(db.query(sql).get(0).getOrDefault("num", 0).toString()) ;
		//110-140
		sql="SELECT COUNT(*) AS num FROM car WHERE b_price>=110 AND b_price<140";
		a[2]=Integer.parseInt(db.query(sql).get(0).getOrDefault("num", 0).toString()) ;
		//140-170
		sql="SELECT COUNT(*) AS num FROM car WHERE b_price>=140 AND b_price<170";
		a[3]=Integer.parseInt(db.query(sql).get(0).getOrDefault("num", 0).toString()) ;
		//>170
		sql="SELECT COUNT(*) AS num FROM car WHERE b_price>=170";
		a[4]=Integer.parseInt(db.query(sql).get(0).getOrDefault("num", 0).toString()) ;
		
		return a;
		
	}
	
	//品牌统计
	public List<Map<String,Object>> getMarkNum(){
		db =new DbUtil();
		sql="SELECT b.b_name,COUNT(*) AS num FROM car c,biaozhi b WHERE c.b_id=b.b_id GROUP BY b.b_name";
		list = db.query(sql);  
		return list;
	}
	
	//类型统计
	public List<Map<String,Object>> getTypeNum() {
		db =new DbUtil();
		sql="SELECT t.t_type,COUNT(*) AS num FROM car c,TYPE t WHERE c.t_id=t.t_id GROUP BY t.t_type";
		list = db.query(sql);  
		return list;
	}
	
	//数据库所有图片生成对应指纹，并将相对应的指纹图片查找出来（传入源finger，获得一个List<Map<String,object>>）
	public List<Map<String,Object>> findFinger(String finger){
		List<String> imgFinger = new ArrayList<String>();
		List<Map<String,Object>> allImg = queryAllCar();
		String path = "G:\\javaee_workspace\\apache-tomcat-8.0.24\\webapps\\car_img\\";
		for(int i=0;i<allImg.size();i++){
			String code = allImg.get(i).getOrDefault("b_code", "").toString();
			String img1 = allImg.get(i).getOrDefault("img1", "").toString();
			String img2 = allImg.get(i).getOrDefault("img2", "").toString();
			String img3 = allImg.get(i).getOrDefault("img3", "").toString();
			String img4 = allImg.get(i).getOrDefault("img4", "").toString();
			String imgFinger1 = ImageFindUtil.produceFingerPrint(path+img1);
			
			System.out.println("imgFinger1:"+imgFinger1);
			String imgFinger2 = ImageFindUtil.produceFingerPrint(path+img2);
			System.out.println("imgFinger2:"+imgFinger2);
			String imgFinger3 = ImageFindUtil.produceFingerPrint(path+img3);
			System.out.println("imgFinger3:"+imgFinger3);
			String imgFinger4 = ImageFindUtil.produceFingerPrint(path+img4);
			System.out.println("imgFinger4:"+imgFinger4);
			
			int h1 = ImageFindUtil.hammingDistance(finger, imgFinger1);
			int h2 = ImageFindUtil.hammingDistance(finger, imgFinger2);
			int h3 = ImageFindUtil.hammingDistance(finger, imgFinger3);
			int h4 = ImageFindUtil.hammingDistance(finger, imgFinger4);
			
			/*Hamming distance小于5，说明图片相似，为0时是同一张图片，大于10时差距很大*/
			if(h1<5||h2<5||h3<5||h4<5){
				imgFinger.add(code);
			}
		}
		
		System.out.println("imgFinger:"+imgFinger);
		
	
		
		
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		Map<String,Object> map=new HashMap<String,Object>();
		for(int i = 0;i<imgFinger.size();i++){
			map=queryOneCar(imgFinger.get(i)).get(0);
			list.add(map);
		}
		
		return list;
		
	}

}
