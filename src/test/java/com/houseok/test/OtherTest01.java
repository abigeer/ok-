package com.houseok.test;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.houseok.utils.TimeUtils;

public class OtherTest01 {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
//		fail("Not yet implemented");
		Date utildate = new Date();
		SimpleDateFormat sdf =  
		        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		System.out.println(sdf.format(utildate));
		try {
			utildate = sdf.parse(sdf.format(utildate));
			java.sql.Date sqldate = new java.sql.Date(utildate.getTime());
			System.out.println(sdf.format(sqldate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void test2(){
//		java.sql.Date date = new java.sql.Date();
		try {
			System.out.println(TimeUtils.u2sDate());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
