package com.houseok.user.dao;

import com.houseok.bean.Adminator;

/**
 * 管理员持久层接口
 * @author 89146
 *
 */
public interface IAdminDao {

	/**
	 * 通过账号查询管理员
	 * @param account
	 * @return
	 */
	Adminator selectAdminatorByAccount(String account);

	/**
	 * 删除用户
	 * @param id
	 */
	void deleteUserById(int id);

}
