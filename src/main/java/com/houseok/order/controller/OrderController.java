package com.houseok.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.houseok.bean.House;
import com.houseok.bean.Order;
import com.houseok.bean.User;
import com.houseok.house.service.IHouseService;
import com.houseok.order.service.IOrderService;

/**
 * 订单前端控制器
 * @author 89146
 *
 */
@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	@Qualifier("orderService")
	private IOrderService orderService;
	
	@Autowired
	@Qualifier("houseService")
	private IHouseService houseService;
	
	@RequestMapping("creatorder")
	public ModelAndView creatOrder(int id,HttpSession session){
		/*
		 * 填写订单
		 */
		session.setAttribute("houseId", id);
		System.out.println(session.getAttribute("houseId"));
		ModelAndView mv = new ModelAndView();
		mv.setViewName("order");
		House house = houseService.selectHouseById(id);
		mv.addObject("house", house);
		System.out.println(house);
		return mv;
	}

	@RequestMapping("neworder")
	@ResponseBody
	public String doCreatOrder(Order order,HttpSession session){
		/*
		 * 生成订单
		 */
		int houseId = (int) session.getAttribute("houseId");
		User user = (User) session.getAttribute("user");
		order.setUser(user);
		
		House house = houseService.selectHouseById(houseId);
		
		User master = new User();
		master.setId(house.getMaster().getId());
		order.setMaster(master);
		
		order.setHouse(house);
		System.out.println(order);
		boolean orderResult = orderService.addOrder(order);
		if(orderResult){
			return "success";
		}
		return "fail";
	}
}
