package com.houseok.bean;
/**
 * 房源信息实体
 * @author 89146
 *
 */

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;


public class House {
	
	private Integer id;
	private User master;		//房主，字段：master_id
	private String houseState;		//房源状态，字段：house_state
	private String houseType;		//房源类型，字段：house_type
	private Double price;				//房源价格
	private Double area;				//房屋面积
	private String positionProvince;		//房源所属省份,字段：position_province
	private String positionCity;				//房源城市，字段：position_city
	private String positionDistrict;			//房源行政区，字段：position_district
	private String positionStreet;			//房源街道，字段：position_street
	private String address;					//房源详细地址，字段：address
	private String houseDescription;				//房源描述，字段：house_description
	private String descriptionImg;					//房源描述图片，字段：description_img
	private Date creatTime;							//房源发布时间，字段：creat_time
	private Date changeTime;						//房源信息修改时间,字段：change_time
	private ArrayList<Comment> comments;		//房源评论信息（一对多，一方关心多方）
	private String[] imgArray;						//房源图片路径数组
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public User getMaster() {
		return master;
	}
	public void setMaster(User master) {
		this.master = master;
	}
	public String getHouseState() {
		return houseState;
	}
	public void setHouseState(String houseState) {
		this.houseState = houseState;
	}
	public String getHouseType() {
		return houseType;
	}
	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getArea() {
		return area;
	}
	public void setArea(Double area) {
		this.area = area;
	}
	public String getPositionProvince() {
		return positionProvince;
	}
	public void setPositionProvince(String positionProvince) {
		this.positionProvince = positionProvince;
	}
	public String getPositionCity() {
		return positionCity;
	}
	public void setPositionCity(String positionCity) {
		this.positionCity = positionCity;
	}
	public String getPositionDistrict() {
		return positionDistrict;
	}
	public void setPositionDistrict(String positionDistrict) {
		this.positionDistrict = positionDistrict;
	}
	public String getPositionStreet() {
		return positionStreet;
	}
	public void setPositionStreet(String positionStreet) {
		this.positionStreet = positionStreet;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHouseDescription() {
		return houseDescription;
	}
	public void setHouseDescription(String houseDescription) {
		this.houseDescription = houseDescription;
	}
	public String getDescriptionImg() {
		return descriptionImg;
	}
	public void setDescriptionImg(String descriptionImg) {
		this.descriptionImg = descriptionImg;
	}
	public ArrayList<Comment> getComments() {
		return comments;
	}
	public void setComments(ArrayList<Comment> comments) {
		this.comments = comments;
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
	
	public String[] getImgArray() {
		return imgArray;
	}
	public void setImgArray(String[] imgArray) {
		String[] img = new String[imgArray.length-1];
		for(int i = 1; i<imgArray.length; i++){
			img[i-1] = imgArray[i];
		}
		this.imgArray = img;
	}
	@Override
	public String toString() {
		return "House [id=" + id + ", master=" + master + ", houseState=" + houseState + ", houseType=" + houseType
				+ ", price=" + price + ", area=" + area + ", positionProvince=" + positionProvince + ", positionCity="
				+ positionCity + ", positionDistrict=" + positionDistrict + ", positionStreet=" + positionStreet
				+ ", address=" + address + ", houseDescription=" + houseDescription + ", descriptionImg="
				+ descriptionImg + ", creatTime=" + creatTime + ", changeTime=" + changeTime + ", comments=" + comments
				+ ", imgArray=" + Arrays.toString(imgArray) + "]";
	}
	
	
	
}
