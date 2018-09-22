package com.houseok.order.dao;

import com.houseok.bean.Order;

/**
 * 订单持久
 * @author 89146
 *
 */
public interface IOrderDao {

	/**
	 * 添加新订单
	 * @param order
	 * @return
	 */
	int addnewOrder(Order order);

}
