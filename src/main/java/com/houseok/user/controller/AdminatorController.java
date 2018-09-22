package com.houseok.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.houseok.bean.Adminator;
import com.houseok.bean.House;
import com.houseok.bean.Page;
import com.houseok.bean.User;
import com.houseok.house.service.IHouseService;
import com.houseok.user.service.IAdminService;
import com.houseok.user.service.IUserService;
/**
 * 管理员前端控制器
 * @author 89146
 *
 */
@Controller
@RequestMapping("admin")
public class AdminatorController {
	
	@Autowired
	@Qualifier("adminService")
	private IAdminService adminService;
	
	@Autowired
	@Qualifier("userService")
	private IUserService userService;
	
	@Autowired
	@Qualifier("houseService")
	private IHouseService houseService;
	
	@RequestMapping("/adminlogin")
	public String toAdminLogin(){
		return "adminLogin";
	}
	
	@RequestMapping("doAdminLogin")
	@ResponseBody
	public String doAdminLogin(Adminator admin){
		/*
		 * 执行登陆
		 */
		boolean loginResult = adminService.checkAdmin(admin);
		if(loginResult){
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping("touserIndex")
	public ModelAndView toManageUser(int pageNum){
		/*
		 * 管理所有用户
		 */
		ModelAndView mv = new ModelAndView();
		Page<User> userPage = userService.selectAllUser(pageNum,10);
		System.out.println(userPage);
		mv.addObject("userPage",userPage);
		mv.setViewName("userGL");
		return mv;
	}
	
	@RequestMapping("/deleteuser")
	public ModelAndView deleteUser(int id, int pageNum){
		/*
		 * 删除用户
		 */
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageNum",pageNum);
		mv.setViewName("forward:touserIndex");
		adminService.deleteUserById(id);
		return mv;
	}
	
	@RequestMapping("/tohouseindex")
	public ModelAndView toHouseIndex(int pageNum){
		/*
		 * 前往房源管理页面
		 */
		ModelAndView mv = new ModelAndView();
		mv.setViewName("houseGL");
		Page<House> page = houseService.selectAllHouseWithPage(pageNum, 10);
		mv.addObject("page", page);
		return mv;
	}
	
	@RequestMapping("deletehouse")
	public ModelAndView deleteHouse(int id, int pageNum){
		/*
		 * 管理员删除房屋
		 */
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageNum",pageNum);
		mv.setViewName("forward:tohouseindex");
		houseService.deleteHouse(id);
		return mv;
	}
	
	@RequestMapping("adminpast")
	public ModelAndView adminPast(int id, int pageNum){
		/*
		 * 房屋通过管理员审核
		 */
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageNum",pageNum);
		mv.setViewName("forward:tohouseindex");
		houseService.houseStatePast(id);
		return mv;
	}

}
