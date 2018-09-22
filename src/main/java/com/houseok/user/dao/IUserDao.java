package com.houseok.user.dao;

import java.util.List;

import com.houseok.bean.User;

/**
 * 用户持久类
 * @author 89146
 *
 */
public interface IUserDao {
	
	
	/**
	 * 创建新用户
	 */
	int creatNewUser(User user);
	
	/**
	 * 通过用户账户查询用户
	 */
	User selectUserByAccount(String account);

	/**
	 * 用户信息完善
	 */
	int updateUser(User user);

	/**
	 * 升级成为房主
	 * @param user
	 * @return
	 */
	int updateUserToMaster(User user);

	/**
	 * 通过用户id查询用户
	 * @param userId
	 * @return
	 */
	User selectUserById(Integer userId);

	/**
	 * 修改密码
	 * @param newPassword
	 * @param account
	 * @return
	 */
	int changePassword(String newPassword,String account);

	/**
	 * 用户修改头像
	 * @param headerPath
	 * @param account
	 * @return
	 */
	int updateHeader(String headerPath, String account);

	/**
	 * 查询用户总数
	 * @return
	 */
	int selectTotalUser();

	/**
	 * 查询所有用户
	 * @return
	 */
	List<User> selectAllUser(int startIndex, int pageSize);

	
	

}
