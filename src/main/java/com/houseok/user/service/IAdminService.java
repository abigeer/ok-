package com.houseok.user.service;

import com.houseok.bean.Adminator;

/**
 * 管理员服务接口
 * @author 89146
 *
 */
public interface IAdminService {

	boolean checkAdmin(Adminator admin);

	/**
	 * 删除用户
	 * @param id
	 */
	void deleteUserById(int id);

}
