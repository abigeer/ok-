package com.houseok.bean;
/**
 * 分页的bean，用于分页
 * 使用泛型类，使其他bean都可使用
 * @author 89146
 *
 */

import java.util.List;

public class Page<T> {
	
	//已知数据
	private int pageNum;		//当前页码，从前端通过request传递过来
	private int pageSize;		//每页显示的数据量，自定义
	private int totalRecord;	//数据总量
	
	//需要计算的数据
	private int totalPage;			//总页数,可以通过totalRecord和pageSize计算得出
	//页面列表开始索引,即从数据库的第几行开始拿数据,有了startIndex和pageSize
	//就知道数据库查询的limit语句的两个数据了，就可以获取到每页需要显示的数据了
	private int startIndex;
	
	//每页要显示的数据放在list中
	private List<T> list;
	
	//分页显示的页数，不如在页面上显示2，3，4，5，6start就是2，end就是6
	private int start;
	private int end;
	
	//通过pageNum,pageSize,totalRecord计算出totalpage和startIndex
	//构造函数只传递已知数据，pageNum,pageSIze,totalRecord
	public Page(int pageNum, int pageSize, int totalRecord){
		
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.totalRecord = totalRecord;
		
		//计算总页数
		if(totalRecord%pageSize == 0){
			//每个页面都显示pageSize条数据
			this.totalPage = totalRecord/pageSize;
		}else{
			//最后一页显示数据条数小于pageSize
			this.totalPage = totalRecord/pageSize+1;
		}
		//计算“开始索引”
		this.startIndex = (pageNum - 1)*pageSize;
		//页面列表显示几页
		this.start = 1;
		this.end = 6;
		
		//显示页数的算法
		if(totalPage <= 5){
			//如果总页数小于6，那么end就是总页数值
			this.end = this.totalPage;
		}else{
			//如果总页面数大于6，要根据当前页，来判断start和end值
			this.start = pageNum - 2;
			this.end = pageNum + 3;
			
			//如果经上面计算页面索引不合法，调整页面索引
			if(start < 0){
				this.start = 1;
				this.end = 6;
			}
			if(end > this.totalPage){
				this.end  = totalPage;
				this.start = end - 6;
			}
		}
	}

	//getter/setter
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "Page [pageNum=" + pageNum + ", pageSize=" + pageSize + ", totalRecord=" + totalRecord + ", totalPage="
				+ totalPage + ", startIndex=" + startIndex + ", list=" + list + ", start=" + start + ", end=" + end
				+ "]";
	}
	
	
	
}
