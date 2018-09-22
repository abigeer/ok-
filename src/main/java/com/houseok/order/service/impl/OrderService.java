package com.houseok.order.service.impl;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.houseok.bean.Order;
import com.houseok.order.dao.IOrderDao;
import com.houseok.order.service.IOrderService;
import com.houseok.utils.TimeUtils;
/**
 * 订单服务类
 * @author 89146
 *
 */
@Service("orderService")
public class OrderService implements IOrderService {
	
	@Autowired
	private IOrderDao orderDao;

	@Override
	public boolean addOrder(Order order) {
		/*
		 * 添加新订单
		 */
		try {
			order.setCreatTime(TimeUtils.u2sDate());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		order.setOrderState("1");
		order.setOrderNumber(order.getCreatTime().toString());
		int result = orderDao.addnewOrder(order);
		return result==1?true:false;
	}

}
