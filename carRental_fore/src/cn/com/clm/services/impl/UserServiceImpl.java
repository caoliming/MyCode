package cn.com.clm.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.clm.beans.Message;
import cn.com.clm.beans.User;
import cn.com.clm.beans.UserPb;
import cn.com.clm.beans.UserRecode;
import cn.com.clm.daos.UserMapper;
import cn.com.clm.services.UserService;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	 /* 登陆验证 */
    public User checkLogin(String username, String password) {
        //根据用户名实例化用户对象
    	System.out.println("username:"+username);
        User user = userMapper.getUserByName(username);
        if (user != null && user.getU_psw().equals(password)) {
            return user;
        }
        return null;
    }
	@Override
	public User getUserCore(String u_card) {
		User user = userMapper.getUserCore(u_card);
		return user;
	}
	@Override
	public List<UserRecode> getUserRecode(String u_card) {
		List<UserRecode> userRecode = userMapper.getUserRecode(u_card);
		return userRecode;
	}
	@Override
	public void sendNote(Message message) {
		userMapper.sendNote(message);
	}
	@Override
	public void addPb( String u_card) {
		userMapper.addPb( u_card);
	}
	@Override
	public int registerUser(User user) {
		return userMapper.registerUser(user);
	}
	@Override
	public int registerUserPb(UserPb userPb) {
		return userMapper.registerUserPb(userPb);
	}
	@Override
	public void updateUserPass(String newPs, String u_card) {
		userMapper.updateUserPass(newPs,u_card);
	}
	@Override
	public void updateUserMoney(int addMon, String u_card) {
		userMapper.updateUserMoney(addMon,u_card);
	}
	@Override
	public void addMoneyRecode(String u_card, int addMon, String r_date) {
		userMapper.addMoneyRecode(u_card,addMon ,r_date);
	}
	@Override
	public void updateUserPb(int p_pd, String u_card) {
		userMapper.updateUserPb(p_pd ,u_card);
	}

}
