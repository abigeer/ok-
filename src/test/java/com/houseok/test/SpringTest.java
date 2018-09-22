package com.houseok.test;



import java.text.ParseException;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.houseok.bean.House;
import com.houseok.bean.Page;
import com.houseok.bean.User;
import com.houseok.house.dao.IHouseDao;
import com.houseok.house.service.IHouseService;
import com.houseok.user.dao.IUserDao;
import com.houseok.user.service.IUserService;
import com.houseok.utils.TimeUtils;
import com.mysql.jdbc.TimeUtil;

import junit.framework.TestCase;
//多个文件使用{}
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration
(locations = {"classpath:spring/spring-base.xml", "classpath*:spring/spring-shiro.xml"})
public class SpringTest extends TestCase {


//	ApplicationContext ac = new 
//			ClassPathXmlApplicationContext("classpath:spring/spring-base.xml","classpath:spring/spring-shiro.xml");
	@Autowired
	private IUserDao dao;
	
	@Autowired
	private IHouseDao houseDao;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IHouseService houseService;
	
//	@Test
//	public void testSpring(){
////		account, password, role, email, province, city, creat_time, avatar, sex
//		User user = new User();
//		user.setAccount("zzy3");
//		user.setPassword("zzy123");
//		user.setRole("customer");
//		user.setEmail("891465170@qq.com");
//		user.setProvince("湖北");
//		user.setCity("武汉");
//		user.setAvatar("/user");
//		user.setSex("male");
//		
//		SimpleDateFormat sdf =  
//		        new SimpleDateFormat("yyyy-MM-dd");  
//		       String time = "2018-8-24";  
//		
//		try {
//			Date utildate = sdf.parse(time);
//			java.sql.Date sqldate = new java.sql.Date(utildate.getTime());
//			user.setCreatTime(sqldate);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		int result = dao.creatNewUser(user);
//		
//		System.out.println(user.getId());
//		
//	}
	@Test
	public void test2(){
//		User user = dao.selectUserByAccount("zzy3");
//		System.out.println(user);
//		//测试更新信息
//		User user = new User();
//		user.setId(5);
//		user.setProvince("湖北");
//		user.setCity("武汉");
//		user.setAvatar("/user");
//		user.setEmail("891465179@qq.com");
//		try {
//			user.setChangeTime(TimeUtils.u2sDate());
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
////		int result = dao.updateUser(user);
//		int result = dao.updateUserToMaster(user);
//		System.out.println(result);
	}
	
	@Test
	public void test3(){
//		User user = dao.selectUserByAccount("zzy3");
//		User master = houseDao.selectMasterById(5);
//		System.out.println(master);
//		System.out.println(dao.updateUserToMaster(user));
//		boolean tomaster = userService.uptoMaster(user);
//		System.out.println(tomaster);
//		House house = new House();
//		User master = new User(); master.setId(5);
//		house.setMaster(master);
//		house.setHouseState("1"); //1待审核
//		house.setHouseType("1");
//		house.setPrice(600.0);
//		house.setPositionProvince("湖北");
//		house.setPositionCity("武汉");
//		house.setPositionDistrict("汉口区");
//		house.setPositionStreet("江夏路");
//		house.setAddress("汉口火车站对面");
//		house.setHouseDescription("装修很nice");
//		house.setDescriptionImg("/house");
////		try {
////			house.setCreatTime(TimeUtils.u2sDate());
////		} catch (ParseException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		}
//		System.out.println(house);
////		int result = houseDao.addHouseSource(house);
//		boolean result = houseService.addHouseSource(house);
//		System.out.println(result);
//		List<House> houses = houseDao.selectPageHouse(0, 1);
//		int totalHouse = houseDao.selectTotalHouseRecord();
//		System.out.println(houses);
//		System.out.println(totalHouse);
//		User user = dao.selectUserById(14);
//		System.out.println(user);
		House house = houseService.selectHouseById(1);
//		House house = houseDao.selectHouseById(1);
		System.out.println(house);
		//测试修改密码
//		boolean changeResult = userService.changePassword("cs123", "ceshi4");
//		System.out.println(changeResult);
		//测试旧密码是否正确
//		boolean oldResult = userService.comfirmOldPassword("1234", "ceshi4");
//		System.out.println(oldResult);
//		System.out.println(houseDao.selectTotalMasterHouse(21));
//		Page<House> page = houseService.selectHousesByMasterId(21, 1, 8);
//		System.out.println(page);
//		List<User> users = dao.selectAllUser(0, 10);
//		System.out.println(users);
//		Page<User> page = userService.selectAllUser(1, 10);
//		int count = dao.selectTotalUser();
//		System.out.println(count);
		houseDao.updateHouseState(8, "2");
	}

}
