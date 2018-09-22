package com.houseok.user.service;


import com.houseok.bean.Page;
import com.houseok.bean.User;

/**
 * 用户服务接口
 * @author 89146
 *
 */
public interface IUserService {
	
	/**
	 * 注册用户检查
	 * @param user
	 * @return
	 */
	boolean checkNewUser(String account);
	
	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	boolean userRegist(User user);

	/**
	 * 用户信息更新
	 * @param user
	 * @return
	 */
	boolean updateUser(User user);

	/**
	 * 更新成为房主
	 * @param user
	 * @return
	 */
	boolean uptoMaster(User user);

	/**
	 * 通过id查询用户
	 * @param userId
	 * @return
	 */
	User selectUserById(Integer userId);

	/**
	 * 通过shiro获取的用户principal查询用户判断旧密码正确性
	 * @param oldPassword
	 * @param principal
	 * @return
	 */
	boolean comfirmOldPassword(String oldPassword, String principal);

	/**
	 * 修改密码
	 * @param oldPassword
	 * @param account
	 * @return
	 */
	boolean changePassword(String newPassword, String account);

	/**
	 * 
	 * @param string
	 * @param account
	 * @return
	 */
	boolean updateHeader(String headerPath, String account);

	/**
	 * 查询所有用户
	 * @return
	 */
	Page<User> selectAllUser(int pageNum, int pageSize);
	
}
