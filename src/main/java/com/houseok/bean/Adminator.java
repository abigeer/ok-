package com.houseok.bean;
/**
 * 后台管理员实体类
 * @author 89146
 *
 */

import java.sql.Date;

public class Adminator {
	
	private Integer id;
	private String account;
	private String password;
	private String role;
	private Date creatTime;			//创建时间，字段：creat_time
	private Date changeTime;		//修改时间，字段：change_time
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	public Date getChangeTime() {
		return changeTime;
	}
	public void setChangeTime(Date changeTime) {
		this.changeTime = changeTime;
	}
	@Override
	public String toString() {
		return "Adminator [id=" + id + ", account=" + account + ", password=" + password + ", role=" + role
				+ ", creatTime=" + creatTime + ", changeTime=" + changeTime + "]";
	}
	

}
