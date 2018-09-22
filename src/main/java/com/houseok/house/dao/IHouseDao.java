package com.houseok.house.dao;

import java.util.List;

import com.houseok.bean.House;

/**
 * 房源模块dao接口
 * @author 89146
 *
 */
public interface IHouseDao {
	
	/**
	 * 查询所有房源并返回List
	 * @return
	 */
	List<House> selectAllHouse();
	
	/**
	 * 通过id查询房源
	 * @param id
	 * @return
	 */
	House selectHouseById(int id);

	/**
	 * 添加房源
	 * @param house
	 * @return
	 */
	int addHouseSource(House house);

	/**
	 * 查询房源记录总数值
	 * @return
	 */
	int selectTotalHouseRecord();

	/**
	 * 查询一页房源数据
	 * @param startIndex
	 * @param pageSize
	 * @return
	 */
	List<House> selectPageHouse(int startIndex, int pageSize);

	/**
	 * 通过房主id查询房源
	 * @return
	 */
	List<House> selectHousesByMasterId(int id, int startIndex, int pageSize);

	/**
	 * 通过房主id查询房主所有房源数
	 * @param id
	 * @return
	 */
	int selectTotalMasterHouse(Integer id);

	/**
	 * 删除房源
	 * @param id
	 */
	void deleteHouseById(int id);

	void updateHouseState(int id, String houseState);
	
//	//测试关联查询的子查询
//	User selectMasterById(int id);
	
	

}
