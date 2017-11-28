package cn.com.clm.services;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.com.clm.beans.Message;
import cn.com.clm.beans.User;
import cn.com.clm.beans.UserPb;
import cn.com.clm.beans.UserRecode;

@Repository
public interface UserService {
	
	// 通过用户名及密码核查用户登录
    public User checkLogin(String username, String password);
    
    public User getUserCore(String u_card);
    
    public List<UserRecode> getUserRecode(String u_card);
    
    public void sendNote(Message message);
    
    public void addPb(String u_card);

	public int registerUser(User user);

	public int registerUserPb(UserPb userPb);

	public void updateUserPass(String newPs, String u_card);

	public void updateUserMoney(int addMon, String u_card);

	public void addMoneyRecode(String u_card, int addMon, String r_date);

	public void updateUserPb(int p_pd, String u_card);

}
