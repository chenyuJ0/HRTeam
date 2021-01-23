package com.cn.hrsystem.domain;

import java.io.Serializable;
import java.util.Date;

public class Notice implements Serializable{
	private int id;//表的主键
	private String title;//公告的标题
	private String context;//公告的内容
	private Date create_date;//公告的创建日期
	private Date lastModifiled;//公告最后一次修改的时间
	private int user_id;//外键引用主键，对应创建公告的用户
	
	private int state;
	
	private User user;

	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notice(int id, String title, String context, Date create_date, Date lastModifiled, int user_id, int state,
			User user) {
		super();
		this.id = id;
		this.title = title;
		this.context = context;
		this.create_date = create_date;
		this.lastModifiled = lastModifiled;
		this.user_id = user_id;
		this.state = state;
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getLastModifiled() {
		return lastModifiled;
	}

	public void setLastModifiled(Date lastModifiled) {
		this.lastModifiled = lastModifiled;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Notice [id=" + id + ", title=" + title + ", context=" + context + ", create_date=" + create_date
				+ ", lastModifiled=" + lastModifiled + ", user_id=" + user_id + ", state=" + state + ", user=" + user
				+ "]";
	}
	
	
	
	

}
