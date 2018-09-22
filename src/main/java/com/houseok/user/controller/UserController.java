package com.houseok.user.controller;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.houseok.bean.User;
import com.houseok.shiro.UserToken;
import com.houseok.user.service.IUserService;

/**
 * 用户注册的处理器
 * @author 89146
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	@Qualifier("userService")		
	private IUserService userService;		//通过IOC注解注入
	
	
	@RequestMapping("/userRegist")
	public String userRegist(){
		/*
		 * rastfull风格跳转到登陆界面
		 */
		return "userRegist";
	}
	
	@RequestMapping("/userLogin")
	public String userLogin(){
		return "userLogin";
	}
	
	@RequestMapping("/doUserRegist")
	@ResponseBody
	public String doUserRegist(User user,HttpSession session){
		/**
		 * 用户注册，使用ajax异步验证，注册成功后ajax继续访问
		 * 登陆，进行自动登陆
		 */
		System.out.println("进入注册逻辑");
		//验证用户信息
		//用户名是否已经被使用
		boolean userExist = userService.checkNewUser(user.getAccount());
		System.out.println(userExist);
		if(userExist){		//如果用户名没有被使用过
			boolean result = userService.userRegist(user);
			if(result){
				//用户注册成功
				String loginResult = doUserLogin(user.getAccount(), user.getPassword(), session);
				if(loginResult == "success"){
					//注册并登陆认证成功
					return loginResult;
				}else{
					//注册成功，自动登陆失败，提示前去登陆！
					return "loginFail";
				}
			}else{
				//用户注册失败，提示“请重试”。
				return "registFail";
			}
		}else{
			return "userExist";
		}
	}
	
//	@RequestMapping("/doUserRegist2Login")
//	public ModelAndView doUserLogin2Regist(String account, String password, HttpSession session){
//		/**
//		 * 注册成功后直接完成登陆
//		 */
//		ModelAndView mv = new ModelAndView();
//		System.out.println("注册成功后直接登陆");
//		//获取当前用户
//		Subject currentUser = SecurityUtils.getSubject();
//		//进行用户认证
//		if(true){		//无论是否认证执行登陆都重新认证
//			//将用户的账户和密码封装成token
//			UserToken token = new UserToken(account, password);
//			//设置rememberme
//			token.setRememberMe(true);
//			//执行登陆
//			try {
//				System.out.println("shiro登陆验证");
//				currentUser.login(token);
//				User user = userService.selectUserById(token.getUserId());
//				//将用户存入session
//				session.setAttribute("user", user);
//				mv.addObject("pageNum", 1);
//				mv.setViewName("forward:/house/index?pageNum=1");
//			} catch (AuthenticationException ae) {		//如果这里出现错误如何处理？
//				ae.printStackTrace();
//			}
//		}
//		return mv;
//	}
	
	@RequestMapping("/doUserLogin")
	@ResponseBody
	public String doUserLogin(String account, String password, HttpSession session){
		/**
		 * 用户从前端页面登陆,登陆成功到房源HouseController,/house/index
		 */
		
		//获取当前用户
		Subject currentUser = SecurityUtils.getSubject();
		//进行用户认证
//		boolean isAuthen = currentUser.isAuthenticated();
//		System.out.println(isAuthen);
//		currentUser.logout();
		if(true){		//执行登陆时无论是否已经认证都重新认证
			//将用户的账户和密码封装成token
			UserToken token = new UserToken(account, password);
			//设置rememberme
			token.setRememberMe(true);
			//执行登陆
			try {
				currentUser.login(token);
				System.out.println("id登陆token:"+token.getUserId());
				//通过token里的id查询用户
				User user = userService.selectUserById(token.getUserId());
				System.out.println(user);
				//认证登陆是要给用户查询角色和其他信息，将用户存入session
				session.setAttribute("user", user);
			} catch (UnknownAccountException uae) {		//如果这里出现错误如何处理？
				//用户不存在
				return "uae";
			}catch(IncorrectCredentialsException ice){
				//用户密码错误
				return "ice";
			}
		}
		return "success";
	}
	
	@RequiresAuthentication
	@RequestMapping("/logout")
	public ModelAndView logout(){
		/*
		 * 退出登陆
		 */
		ModelAndView mv = new ModelAndView();
		//shiro退出
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		mv.addObject("pageNum", 1);
		mv.setViewName("redirect:/house/index");
		//退登后返回首页
		return mv;
	}
	
	@RequestMapping("/toRelogin")
	public String toReLogin(){
		/*
		 * 返回重新登陆
		 */
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return "userLogin";
	}
	
	
	
	
}
