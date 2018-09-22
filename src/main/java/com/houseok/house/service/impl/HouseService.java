package com.houseok.house.service.impl;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.houseok.bean.House;
import com.houseok.bean.Page;
import com.houseok.house.dao.IHouseDao;
import com.houseok.house.service.IHouseService;
import com.houseok.utils.TimeUtils;
/**
 * 房源服务类
 * @author 89146
 *
 */
@Service("houseService")
public class HouseService implements IHouseService{
	
	@Autowired
	private IHouseDao houseDao;

	@Override
	public Page<House> selectAllHouseWithPage(int pageNum, int pageSize) {
		/*
		 * 查询所有房源并放回list,接收参数当前页码，每页显示的数据量
		 */
		int totalRecord = houseDao.selectTotalHouseRecord();
		//获得已知数据后初始化page
		Page<House> page = new Page<>(pageNum, pageSize, totalRecord);
		
		//获取page中的startIndex，即从第几条记录开始查
		int startIndex = page.getStartIndex();
		//查询该页数据
		page.setList(houseDao.selectPageHouse(startIndex, pageSize));
		
		return page;
	}
	
	

	@Override
	public boolean addHouseSource(House house) {
		/*
		 * 添加新房源，返回添加结果
		 */
		try {
			house.setCreatTime(TimeUtils.u2sDate());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int success = houseDao.addHouseSource(house);
		return success ==1?true:false;
	}



	@Override
	public House selectHouseById(int id) {
		/*
		 * 通过id查找房源
		 */
		House house = houseDao.selectHouseById(id);
		return house;
	}



	@Override
	public Page<House> selectHousesByMasterId(Integer id, int pageNum, int pageSize) {
		/*
		 * 通过房主id查询房源。怎么分页？通过order by排序后进行查询
		 */
		int totalRecord = houseDao.selectTotalMasterHouse(id);
		//获得已知数据后初始化page
		Page<House> page = new Page<>(pageNum, pageSize, totalRecord);
		
		//获取page中的startIndex，即从第几条记录开始查
		int startIndex = page.getStartIndex();
		//执行分页查询
		page.setList(houseDao.selectHousesByMasterId(id, startIndex, pageSize));
		return page;
	}



	@Override
	public void deleteHouse(int id) {
		houseDao.deleteHouseById(id);
	}



	@Override
	public void houseStatePast(int id) {
		/*
		 * 房屋通过管理员审核
		 */
		houseDao.updateHouseState(id,"2");
		
	}

}
