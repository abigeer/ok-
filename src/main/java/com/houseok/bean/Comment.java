package com.houseok.bean;
/**
 * 房源评论实体类
 * @author 89146
 *
 */

import java.sql.Date;

public class Comment {
	
	private Integer id;
	private User user;				//评论用户,字段：user_id（多对一，多方关心一方）
	private String content;			//评论内容
	private Date creatTIme;		//评论时间
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreatTIme() {
		return creatTIme;
	}
	public void setCreatTIme(Date creatTIme) {
		this.creatTIme = creatTIme;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", user=" + user + ", content=" + content + ", creatTIme=" + creatTIme + "]";
	}
	
	

}
