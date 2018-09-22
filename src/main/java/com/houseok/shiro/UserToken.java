package com.houseok.shiro;

import org.apache.shiro.authc.HostAuthenticationToken;
import org.apache.shiro.authc.RememberMeAuthenticationToken;

public class UserToken implements HostAuthenticationToken, RememberMeAuthenticationToken {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//用户名
	private String username;
	
	//用户密码
	private char[] password;
	
	//是否记住我，默认值false
	private boolean rememberMe = false;
	
	//主机名称或ip
	private String host;
	
	//用户角色
	private String userRole;
	
	//用户id
	private Integer userId;
	
	/**
	 * 默认构造方法
	 */
	public UserToken() {
	}
	
	//构造方法
	
	public UserToken(final String username, final char[] password,
			final boolean rememberMe, final String host, final String userRole,Integer userId) {
		super();
		this.username = username;
		this.password = password;
		this.rememberMe = rememberMe;
		this.host = host;
		this.userRole = userRole;
		this.userId = userId;
	}
	
	public UserToken(final String username, final String password,
			final boolean rememberMe, final String host, final String userRole){
		this(username, password != null ? password.toCharArray() : null,
				rememberMe, host, userRole, null);
	}
	
	public UserToken(final String username, final String password){
		this(username, password != null ? password.toCharArray() : null,
				false, null, null, null);
	}
	
	public UserToken(final String username, final String password, final String userRole){
		this(username, password != null ? password.toCharArray() : null,
				false, null, userRole, null);
	}
	
	
	//getter/setter
	
	@Override
	public Object getPrincipal() {
		return getUsername();
	}
	
	@Override
	public Object getCredentials() {
		return getPassword();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public char[] getPassword() {
		return password;
	}

	public void setPassword(char[] password) {
		this.password = password;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public void setRememberMe(boolean rememberMe) {
		this.rememberMe = rememberMe;
	}
	
	@Override
	public boolean isRememberMe() {
		return rememberMe;
	}

	@Override
	public String getHost() {
		return host;
	}
	
	public void setHost(String host) {
		this.host = host;
	}
	
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	/**
	 * 清除数据
	 * 密码如果不为空，设置成0x00
	 */
    public void clear() {
        this.username = null;
        this.host = null;
        this.rememberMe = false;
        this.userRole = null;
        this.userId = null;
        if (this.password != null) {
            for (int i = 0; i < password.length; i++) {
                this.password[i] = 0x00;
            }
            this.password = null;
        }
    }
	
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getName());
        sb.append(" - ");
        sb.append(username);
        sb.append(userRole);
        sb.append(userId);
        sb.append(", rememberMe=").append(rememberMe);
        if (host != null) {
            sb.append(" (").append(host).append(")");
        }
        return sb.toString();
    }

}
