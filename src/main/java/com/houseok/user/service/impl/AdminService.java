package com.houseok.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.houseok.bean.Adminator;
import com.houseok.user.dao.IAdminDao;
import com.houseok.user.service.IAdminService;
/**
 * 管理员服务类
 * @author 89146
 *
 */
@Service("adminService")
public class AdminService implements IAdminService {

	@Autowired
	private IAdminDao adminDao;
	
	@Override
	public boolean checkAdmin(Adminator admin) {
		
		//调用dao查询管理员
		Adminator ad = adminDao.selectAdminatorByAccount(admin.getAccount());
		if(ad == null){
			return false;
		}
		if(admin.getPassword().equals(ad.getPassword())){
			return true;
		}
		return false;
	}

	@Override
	public void deleteUserById(int id) {
		adminDao.deleteUserById(id);
	}

}
