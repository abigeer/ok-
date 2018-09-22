package com.houseok.user.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.houseok.bean.User;
import com.houseok.shiro.UserToken;
import com.houseok.user.dao.IUserDao;
/**
 * 用户的Realm类用于授权和认证,在IOC容器中配置，并配置给SecurityManager
 * @author 89146
 *
 */
public class UserRealm extends AuthorizingRealm{
	
	@Autowired
	private IUserDao userDao;

	//进行授权的方法
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		String account = (String)principalCollection.getPrimaryPrincipal();
//		System.out.println(account);
		User user = userDao.selectUserByAccount(account);
		System.out.println("authorization:"+user);
		info.addRole(user.getRole());
		return info;
	}

	//进行认证方法
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		
		//这里的token是从controller中传递过来的，UserNameandPasswordToke
		//类型转换
		UserToken upToken = (UserToken)token;
		//获取用户名
		String account = upToken.getUsername();
		//查询数据库，根据结果抛出指定异常
		User user = userDao.selectUserByAccount(account);
		System.out.println(user);
		//用户不存在异常
		if(user==null){
			throw new UnknownAccountException("用户不存在");
		}else{
			//设置用户id
			upToken.setUserId(user.getId());
			//设置用户角色
			upToken.setUserRole(user.getRole());
		}
		//其他异常
		
		//拿取从数据库中查询到的账户名和密码用于登陆认证匹配
		//1.用户账户（身份）
		Object principal = user.getAccount();
		//2.用户密码
		Object credentials = user.getPassword();
		//3.本Realm名
		String realmName = getName();
		//4.盐值（和注册机密时盐值一致）
		ByteSource salt = ByteSource.Util.bytes(account);
		
		//返回认证信息SimpleAuthenticationInfo
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo
				(principal, credentials, salt, realmName);
		
		return info;
	}

}
