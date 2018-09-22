package com.houseok.bean;
/**
 * 订单实体类
 * @author 89146
 *
 */

import java.sql.Date;

public class Order {
	
	private Integer id;
	private User user;			//房客,字段user_id
	private User master;		//房主,字段master_id
	private House house;		//房子,字段house_id
	private String orderState;			//订单状态,字段：order_state
	private String orderNumber;		//订单编号；字段：order_number
	private String customerName;		//真实姓名，字段：customer_name
	private String identityNum;				//用户身份证号,字段：identity_num
	private String telephoneNum;			//用户手机号,字段：telephone_num
	private Date inTime;						//用户入住时间，字段：in_time
	private Date outTime;						//用户退房时间，字段：out_time
	private Date creatTime;					//下单时间,字段：creat_time
	private Date solveTime;					//交易完成时间,字段：sovle_time
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User getMaster() {
		return master;
	}
	public void setMaster(User master) {
		this.master = master;
	}
	public House getHouse() {
		return house;
	}
	public void setHouse(House house) {
		this.house = house;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getIdentityNum() {
		return identityNum;
	}
	public void setIdentityNum(String identityNum) {
		this.identityNum = identityNum;
	}
	public String getTelephoneNum() {
		return telephoneNum;
	}
	public void setTelephoneNum(String telephoneNum) {
		this.telephoneNum = telephoneNum;
	}
	public Date getInTime() {
		return inTime;
	}
	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}
	public Date getOutTime() {
		return outTime;
	}
	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	public Date getSolveTime() {
		return solveTime;
	}
	public void setSolveTime(Date solveTime) {
		this.solveTime = solveTime;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", user=" + user + ", master=" + master + ", house=" + house + ", orderState="
				+ orderState + ", orderNumber=" + orderNumber + ", customerName=" + customerName + ", identityNum="
				+ identityNum + ", telephoneNum=" + telephoneNum + ", inTime=" + inTime + ", outTime=" + outTime
				+ ", creatTime=" + creatTime + ", solveTime=" + solveTime + "]";
	}
	
	
	

}
