package com.houseok.order.service;

import com.houseok.bean.Order;

/**
 * 订单服务接口
 * @author 89146
 *
 */
public interface IOrderService {

	/**
	 * 添加新订单
	 * @param order
	 * @return
	 */
	boolean addOrder(Order order);

}
