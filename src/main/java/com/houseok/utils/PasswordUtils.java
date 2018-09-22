package com.houseok.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * 对密码进行MD5加密的工具类
 * @author 89146
 *
 */
public class PasswordUtils {

	public static String EcodePasswordByMD5(String password, String account){
		//使用md5加密
		String hashAlgorithmName = "MD5";
		//原始密码
		Object credentials = password;
		//通过用户名产生盐
		Object salt = ByteSource.Util.bytes(account);
		//加密次数
		int hashIterations = 1024;
		//调用shiro加密模块对用户密码进行盐值加密
		Object result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
		return result.toString();
	}
	
}
