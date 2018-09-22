package com.houseok.house.service;

import java.util.List;

import com.houseok.bean.House;
import com.houseok.bean.Page;

/**
 * 房源服务接口
 * @author 89146
 *
 */
public interface IHouseService {

	/**
	 * 查询所有房源
	 * @return 返回房源列表
	 */
	Page<House> selectAllHouseWithPage(int pageNum, int pageSize);

	/**
	 * 添加新房源
	 * @param house
	 * @return
	 */
	boolean addHouseSource(House house);

	/**
	 * 通过id查找房源
	 * @return House
	 */
	House selectHouseById(int id);

	/**
	 * 通过房主id查询房源
	 * @return
	 */
	Page<House> selectHousesByMasterId(Integer id, int pageNum, int pageSize);

	/**
	 * 房主删除房源
	 * @param id
	 */
	void deleteHouse(int id);

	/**
	 * 房屋通过管理员审核
	 * @param id
	 */
	void houseStatePast(int id);

}
