package com.houseok.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.houseok.bean.House;
import com.houseok.bean.User;
import com.houseok.house.service.IHouseService;
import com.houseok.user.service.IMasterService;

/**
 * 房主前端控制器类
 * @author 89146
 *
 */
@Controller
@RequestMapping("/master")
public class MasterController {
	
	@Autowired
	@Qualifier("masterService")
	private IMasterService masterService;
	
	@Autowired
	@Qualifier("houseService")
	private IHouseService houseService;
	
	@RequiresRoles("master")
	@RequestMapping("/addhouse")
	@ResponseBody
	public String addHouseSource(House house, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException{
		/*
		 * 发布房源
		 */
		User master = (User) session.getAttribute("user");
		house.setMaster(master);
		house.setHouseState("1");
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
			//遍历所有文件
			while(iter.hasNext()){
				MultipartFile file=multiRequest.getFile(iter.next().toString());
				if(file != null){
					System.out.println(file.getOriginalFilename());
					//构造路径
					//应用路径
//					String applicationPath = request.getSession().getServletContext().getRealPath("/");
					String applicationPath = "D:/workspace/eclipsejee/house/src/main/webapp/houseImg";
					StringBuilder nsb = new StringBuilder(applicationPath);
					nsb.append("/");
					nsb.append(master.getAccount());
					File userFile = new File(nsb.toString());
					if(!userFile.exists()){
						userFile.mkdirs();
					}
					nsb.append("/");
					nsb.append(file.getOriginalFilename());
					file.transferTo(new File(nsb.toString()));
					//将所有图片路径拼接
					if(sb.toString().equals("")){
						sb.append("houseImg/"+master.getAccount()+"/"+file.getOriginalFilename());
					}else{
						sb.append(',');
						sb.append("houseImg/"+master.getAccount()+"/"+file.getOriginalFilename());
					}
//					System.out.println(nsb.toString());
				}
			}
			house.setDescriptionImg(sb.toString());
		}
		//调用houseService
		boolean success = houseService.addHouseSource(house);
		if(!success){
			return "error";
		}
		return "ok";
	}
	

}
