package com.houseok.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间处理工具类
 * @author 89146
 *
 */
public class TimeUtils {
	
	public static java.sql.Date u2sDate() throws ParseException{
		
		Date utilDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		utilDate = sdf.parse(sdf.format(utilDate));
		return new java.sql.Date(utilDate.getTime());
		
	}

}
