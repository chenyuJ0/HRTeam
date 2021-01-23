package com.cn.hrsystem.service;

import java.util.List;

import com.cn.hrsystem.domain.Notice;
import com.cn.hrsystem.domain.User;

//业务逻辑层实现的接口
public interface NoticeService {

	
	//查询所有公告信息
	public List<Notice> findAllNotice();
	
	//根据id查询user所有属性
	public User findUserById(int id);
	
	
	//添加公告
	public void addNotice(Notice notice);
	
	
	//修改公告
	public void updateNotice(Notice notice);
	
	
	//根据id删除公告
	public void deleteNotice(int id);
	
	
	//根据id查询公告信息
	public Notice findNoticeById(int id);
	
	
	//模糊查询
	public List<Notice> moHuSearch(Notice notice);
	
	
	
	//寻找状态为1的信息
	public Notice findNoticeState();
	
	//将所有状态码改为0
	public void updateNoticeStateZero();
	
	//根据id把状态码改为1
	public void updateNoticeStateOne(int id);
	
	
	
	
	
	
	
	
	
	
	
	
	
}
