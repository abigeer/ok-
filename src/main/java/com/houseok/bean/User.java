package com.houseok.bean;

import java.sql.Date;

/**
 * 用户实体类
 * @author 89146
 *
 */
public class User {
	
	private Integer id;
	private String account;
	private String password;
	private String avatar;		//用户头像路径
	private String sex;
	private String role;
	private String telephoneNum;		//用户手机,字段：telephone_num
	private String email;
	private String identityNum;		//用户身份证号，字段identity_num
	private String province;
	private String city;
	private String district;
	private Date creatTime;		//用户注册时间，字段：creat_time，mysql中date和Java中那个类型date对应
	private Date changeTime;	//用户信息最后一次改变时间，字段：change_time
	
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
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getTelephoneNum() {
		return telephoneNum;
	}
	public void setTelephoneNum(String telephoneNum) {
		this.telephoneNum = telephoneNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIdentityNum() {
		return identityNum;
	}
	public void setIdentityNum(String identityNum) {
		this.identityNum = identityNum;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
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
		return "User [id=" + id + ", account=" + account + ", password=" + password + ", avatar=" + avatar + ", sex="
				+ sex + ", role=" + role + ", telephoneNum=" + telephoneNum + ", email=" + email + ", identityNum="
				+ identityNum + ", province=" + province + ", city=" + city + ", district=" + district + ", creatTime="
				+ creatTime + ", changeTIme=" + changeTime + "]";
	}
	

}
