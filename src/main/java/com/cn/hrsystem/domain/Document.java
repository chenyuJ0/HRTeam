package com.cn.hrsystem.domain;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Document implements Serializable{
	private int id;//表的主键
	private String filename;//文件名
	private String remark;//文件的真实路径
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date create_date;//文件的创建日期
	private String description;//关于该文件的描述
	private String name;//这里我改成了通过文件名查询得到有一个username
	private int user_id;//创建该公告的用户
	public Document() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "Document [id=" + id + ", filename=" + filename + ", remark=" + remark + ", create_date=" + create_date
				+ ", description=" + description + ", name=" + name + ", user_id=" + user_id + "]";
	}
	

	

	
	
}
