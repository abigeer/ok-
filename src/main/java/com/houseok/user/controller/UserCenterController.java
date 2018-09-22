package com.houseok.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.houseok.bean.House;
import com.houseok.bean.Page;
import com.houseok.bean.User;
import com.houseok.house.service.IHouseService;
import com.houseok.user.service.IMasterService;
import com.houseok.user.service.IUserService;

/**
 * 用户中心控制器
 * @author 89146
 *
 */
@Controller
@RequestMapping("/center")
public class UserCenterController {
	
	@Autowired
	@Qualifier("userService")
	private IUserService userService;
	
	@Autowired
	@Qualifier("masterService")
	private IMasterService masterService;
	
	@Autowired
	@Qualifier("houseService")
	private IHouseService houseService;
	
	@RequiresAuthentication
	@RequestMapping("/toUserCenter")
	public String toUserCenter(){
		/*
		 * 进入个人中心页面
		 */
		return "userCenter";
	}
	
	@RequiresAuthentication
	@RequestMapping("myInfo")
	public String toMyInfo(){
		/*
		 * 进入个人信息页面
		 */
		return "my_info";
	}
	
	@RequiresAuthentication
	@RequestMapping("changeHeader")
	public String changeHeader(){
		/*
		 * 修改头像页面
		 */
		return "make_head";
	}
	
	@RequestMapping("/dochangeheader")
	@ResponseBody
	public String doChangeHeader(HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException{
		/*
		 * 执行修改用户图像
		 */
		//获取当前用户
		String account = (String)SecurityUtils.getSubject().getPrincipal();
		System.out.println(account);
		//将当前上下文初始交给MultipartResolver
		CommonsMultipartResolver multipartResolver = new 
				CommonsMultipartResolver(request.getSession().getServletContext());
		//检查form中是否有enctype="multipart/form-data"
		if(multipartResolver.isMultipart(request)){
			//将request变成多部分request
			MultipartRequest multiRequest = (MultipartRequest)request;
			//获取multipartRequest中所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			StringBuilder sb = new StringBuilder();
			while(iter.hasNext()){
				MultipartFile file=multiRequest.getFile(iter.next().toString());
				if(file != null){
					System.out.println(file.getOriginalFilename());
					String applicationPath = "D:/workspace/eclipsejee/house/src/main/webapp/useravatar";
					StringBuilder nsb = new StringBuilder(applicationPath);
					nsb.append("/");
					nsb.append(account);
					File userFile = new File(nsb.toString());
					if(!userFile.exists()){
						userFile.mkdirs();
					}
					nsb.append("/");
					nsb.append(file.getOriginalFilename());
					file.transferTo(new File(nsb.toString()));
					sb.append("/useravatar/"+account+"/"+file.getOriginalFilename());
				}
			}
			//调用service层修改用户图像
			if(!sb.toString().equals("")){
				boolean headerResult = userService.updateHeader(sb.toString(), account);
				User user = (User)session.getAttribute("user");
				user.setAvatar(sb.toString());
				if(headerResult){
					return "success";
				}else {
					return "fail";
				}
			}else{
				return "noImg";
			}
		}
		return "fail";
	}
	
	@RequiresAuthentication
	@RequestMapping("identityProve")
	public String identityProve(){
		/*
		 *	用户认证页面 
		 */
		return "identity_prove";
	}
	
	@RequiresAuthentication
	@RequestMapping("toMaster")
	public String toChange2Master(){
		/*
		 * 成为房主页面
		 */
		return "toMaster";
	}
	
	@RequiresAuthentication
	@RequestMapping("changePassword")
	public String changePassword(){
		/*
		 * 修改密码页面
		 */
		return "make_password";
	}
	
	@RequestMapping("/dochangepassword")
	@ResponseBody
	public String doChangePassword(@RequestParam("oldpassword") String oldPassword
			, @RequestParam("newpassword") String newPassword){
		/*
		 * 执行修改密码
		 */
		Subject currentUser = SecurityUtils.getSubject();
		String account = (String)currentUser.getPrincipal();
		//判断旧密码正确性
		boolean oldpasswordResult = userService.comfirmOldPassword(oldPassword,account);
		if(oldpasswordResult){
			//旧密码正确
			//执行修改密码
			boolean changeResult = userService.changePassword(newPassword, account);
			if(changeResult){
				//修改成功
				return "success";
			}else{
				return "fail";
			}
		}
		return "passwordError";
	}
	
	@RequiresAuthentication
	@RequestMapping("myOrder")
	public String myOrder(){
		/*
		 * 用户（customer）订单中心
		 */
		return "customerOrder";
	}
	
	@RequiresAuthentication
	@RequestMapping("/uptomaster")
	@ResponseBody
	public String upToMaster(User masterInfo, HttpSession session){
		/*
		 * 执行升级成为房主的业务逻辑，使用Ajax进行异步提交
		 */
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		System.out.println(masterInfo);
		//验证表单信息后封装到user中
		user.setTelephoneNum(masterInfo.getTelephoneNum());
		user.setEmail(masterInfo.getEmail());
		user.setIdentityNum(masterInfo.getIdentityNum());
		user.setProvince(masterInfo.getProvince());
		user.setCity(masterInfo.getCity());
		user.setDistrict(masterInfo.getDistrict());
		
		boolean result = userService.uptoMaster(user);
		System.out.println(result);
		if(result){
			user.setRole("master");
			return "success";
		}
		return "fail";
	}
	
	@RequiresAuthentication
	@RequestMapping("/toUpdateInfo")
	public String toUpdateInfo(){
		/*
		 * 转到完善信息页面，
		 */
		return "";
	}
	
	@RequiresAuthentication
	@RequestMapping("/updateInfo")
	@ResponseBody
	public String updateInfo(){
		/*
		 *ajax异步更新用户信息 
		 */
		return "";
	}
	
	@RequiresRoles("master")
	@RequestMapping("/toCreatHouse")
	public String toCreatHouse(){
		/*
		 * 跳转到发布房源页面
		 */
		return "creatHouse";
	}
	
	@RequiresRoles("master")
	@RequestMapping("/creatHouseSource")
	public String creatHouseSource(House house){
		/*
		 * ajax异步验证提交创建房源
		 */
		//检测房源信息
		
		//调用service创建房源
		boolean creatResult = houseService.addHouseSource(house);
		if(creatResult){
			return "success";
		}
		return "fail";
	}
	
	@RequiresRoles("master")
	@RequestMapping("/manageMyHouseSource")
	public ModelAndView manageMyHouseSource(int pageNum,HttpSession session){
		/*
		 * 管理我发布的房源
		 */
		ModelAndView mv = new ModelAndView();
		//通过用户id查询到所有房源
		User user = (User)session.getAttribute("user");
		System.out.println(user);
		//分页查询
		Page<House> masterHouses = houseService.selectHousesByMasterId(user.getId(), pageNum,5);
		System.out.println(masterHouses);
		mv.addObject("masterHouses", masterHouses);
		mv.setViewName("mastHouse");
		return mv;
	}
	
	@RequestMapping("deleteHouse")
	public ModelAndView deleteHouse(int id, int pageNum){
		/*
		 * 房主删除房源
		 */
		System.out.println(id);
		System.out.println(pageNum);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageNum", pageNum);
		mv.setViewName("forward:manageMyHouseSource");
		houseService.deleteHouse(id);
		return mv;
	}
	
	@RequiresRoles("master")
	@RequestMapping("/lookMyHouseSource")
	public String lookMyHouseSource(){
		/*
		 * 查看房源详情
		 */
		return "";
	}
	
	
	//接下来是房主改变房源信息
	
}
