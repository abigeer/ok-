package com.houseok.user.service.impl;

import java.text.ParseException;
import java.sql.Date;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.houseok.bean.Page;
import com.houseok.bean.User;
import com.houseok.user.dao.IUserDao;
import com.houseok.user.service.IUserService;
import com.houseok.utils.PasswordUtils;
import com.houseok.utils.TimeUtils;
/**
 * 用户服务类
 * @author 89146
 *
 */
@Service("userService")
public class UserServiceImp implements IUserService {
	
	@Autowired
	private IUserDao userDao;
	
	
	@Override
	public boolean checkNewUser(String account) {
		/*
		 * 检查新注册用户是否存在
		 */
		if(userDao.selectUserByAccount(account) == null){
			//用户名没有被使用过
			return true;
		}
		return false;
	}

	@Override
	public boolean userRegist(User user) {
		/**
		 * 用户注册服务
		 */
		
		//设置默认角色
		user.setRole("customer");
		//设置默认头像
		user.setAvatar("/useravatar/avatar1.png");
		//设置用户创建时间
		Date creatTime;
		try {
			creatTime = TimeUtils.u2sDate();
			user.setCreatTime(creatTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//使用md5加密
		String hashAlgorithmName = "MD5";
		//原始密码
		Object credentials = user.getPassword();
		//通过用户名产生盐
		Object salt = ByteSource.Util.bytes(user.getAccount());
		//加密次数
		int hashIterations = 1024;
		//调用shiro加密模块对用户密码进行盐值加密
		Object result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
		user.setPassword(result.toString());
		System.out.println(result);
		int success = userDao.creatNewUser(user);
		//将用户密码改为原始密码，以便注册成功直接通过shiro验证登陆
		user.setPassword((String)credentials);
		//这里返回插入成功后用户的id，是否有问题？
		return success == 1?true:false;
	}

	@Override
	public boolean updateUser(User user) {
		/*
		 * 用于信息完善服务
		 */
		try {
			user.setChangeTime(TimeUtils.u2sDate());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int success = userDao.updateUser(user);
		
		return success == 1?true : false;
	}

	@Override
	public boolean uptoMaster(User user) {
		/*
		 * 升级成为房主
		 */
		try {
			user.setChangeTime(TimeUtils.u2sDate());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int success = userDao.updateUserToMaster(user);
		return success == 1?true : false;
	}

	@Override
	public User selectUserById(Integer userId) {
		/*
		 * 通过id查询用户
		 */
		User user = userDao.selectUserById(userId);
		return user;
	}

	@Override
	public boolean comfirmOldPassword(String oldPassword, String principal) {
		/*
		 * 判断旧密码正确性
		 */
		User user = userDao.selectUserByAccount(principal);
		//对旧密码进行MD5盐值加密
		if(PasswordUtils.EcodePasswordByMD5
				(oldPassword, principal).equals(user.getPassword())){
			return true;
		}
		return false;
	}

	@Override
	public boolean changePassword(String newPassword, String account) {
		/*
		 * 修改密码
		 */
		newPassword = PasswordUtils.EcodePasswordByMD5(newPassword, account);
		int changeResult = userDao.changePassword(newPassword, account);
		
		return changeResult==1?true:false;
	}

	@Override
	public boolean updateHeader(String headerPath, String account) {
		int updataResult = userDao.updateHeader(headerPath, account);
		return updataResult==1?true:false;
	}

	@Override
	public Page<User> selectAllUser(int pageNum, int pageSize) {
		/*
		 * 查询所有用户
		 */
		int totalUser = userDao.selectTotalUser();
		Page<User> page = new Page<>(pageNum, pageSize, totalUser);
		int startIndex = page.getStartIndex();
		page.setList(userDao.selectAllUser(startIndex, pageSize));
		return page;
	}

	


}
