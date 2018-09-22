package com.houseok.house.controller;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.houseok.bean.House;
import com.houseok.bean.Page;
import com.houseok.house.service.IHouseService;

/**
 * 房源前端控制器
 * @author 89146
 *
 */
@Controller
@RequestMapping("/house")
public class HouseController {
	
	@Autowired
	@Qualifier("houseService")
	private IHouseService houseService;
	
	@RequestMapping("/index")
	public ModelAndView toHouseSource(int pageNum){
		/*
		 * 查询到房源list，跳转到房源页面index.jsp
		 */
		ModelAndView mv = new ModelAndView();
		//查询数据库，获取房源
		Page<House> page = houseService.selectAllHouseWithPage(pageNum, 12);
		System.out.println(page);
		mv.addObject("page", page);
		mv.setViewName("index");
		return mv;
	}
	
	@RequiresAuthentication
	@RequestMapping("/detail")
	public ModelAndView toHouseDetail(int id){
		/*
		 * 跳转到房源详情
		 */
		ModelAndView mv = new ModelAndView();
		//调用service通过id查询房源
		House house = houseService.selectHouseById(id);
		house.setImgArray(house.getDescriptionImg().split(","));
		System.out.println(house);
		mv.addObject("house", house);
		mv.setViewName("houseDetail");
		return mv;
	}
	
	@RequestMapping("/about")
	public String toAbout(){
		/*
		 * 关于我们页面
		 */
		return "about";
	}
	

}
