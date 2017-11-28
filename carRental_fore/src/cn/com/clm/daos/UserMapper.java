package cn.com.clm.daos;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.com.clm.beans.Message;
import cn.com.clm.beans.User;
import cn.com.clm.beans.UserPb;
import cn.com.clm.beans.UserRecode;

public interface UserMapper {
	public User getUserByName(String username);//登录
	
	public User getUserCore(String u_card);//获得用户详情
	
	@Select("SELECT * FROM user_recode WHERE u_card=#{u_card}")
	public List<UserRecode> getUserRecode(String u_card);//获取积分
	
	@Insert("INSERT INTO message(u_card,m_info,m_date)VALUES(#{u_card},#{m_info},#{m_date})")
	public void sendNote(Message message);//添加留言
	
	@Update("UPDATE user_pb SET p_pd=p_pd+1 WHERE u_card=#{u_card}")
	public void addPb(String u_card);//添加1积分

	@Insert("INSERT INTO USER(u_name,u_psw,u_sex,u_age,u_card,u_address,u_phone,u_img,u_jscard,u_date)VALUES(#{u_name},#{u_psw},#{u_sex},#{u_age},#{u_card},#{u_address},#{u_phone},#{u_img},#{u_jscard},#{u_date})")
	public int registerUser(User user);

	@Insert("INSERT INTO user_pb(u_card,p_pd,p_money)VALUES(#{u_card},#{p_pd},#{p_money})")
	public int registerUserPb(UserPb userPb);

	@Update("UPDATE USER SET u_psw=#{0} WHERE u_card=#{1}")
	public void updateUserPass(String newPs, String u_card);

	/*依据身份证号，充值时:*/
	/* user_pb：p_money，p_pd;*/
	@Update("UPDATE user_pb SET p_money=p_money+#{0},p_pd=p_pd+#{0}*0.05 WHERE u_card=#{1}")
	public void updateUserMoney(int addMon, String u_card);

	/*添加充值记录*/
    /*user_recode：u_card，p_money，r_date*/
	@Insert("INSERT INTO user_recode(u_card,r_money,r_date)VALUES(#{0},#{1},#{2})")
	public void addMoneyRecode(String u_card, int addMon, String r_date);

	/*兑换积分*/
	/*p_pd,p_money*/
	@Update("UPDATE user_pb SET p_pd=p_pd-#{0},p_money=p_money+#{0}*0.05 WHERE u_card=#{1}")
	public void updateUserPb(int p_pd, String u_card);
	
	

}
