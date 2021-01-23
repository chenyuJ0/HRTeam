package com.cn.hrsystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hrsystem.dao.NoticeDao;
import com.cn.hrsystem.domain.Notice;
import com.cn.hrsystem.domain.User;
import com.cn.hrsystem.service.NoticeService;

//业务逻辑层
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;
	
	//查询所有公告信息
	@Override
	public List<Notice> findAllNotice() {
		List<Notice> list = noticeDao.findAllNotice();
		return list;
	}

	//根据id查询user所有属性
	@Override
	public User findUserById(int id) {
		User user = noticeDao.findUserById(id);
		return user;
	}

	//添加公告
	@Override
	public void addNotice(Notice notice) {
		noticeDao.addNotice(notice);
		
	}

	//修改公告
	@Override
	public void updateNotice(Notice notice) {
		noticeDao.updateNotice(notice);
		
	}

	//根据id删除公告
	@Override
	public void deleteNotice(int id) {
		noticeDao.deleteNotice(id);
		
	}

	@Override
	public Notice findNoticeById(int id) {
		Notice notice = noticeDao.findNoticeById(id);
		return notice;
	}

	@Override
	public List<Notice> moHuSearch(Notice notice) {
		List<Notice> list = noticeDao.moHuSearch(notice);
		return list;
	}
	
	
	
	
	
	//寻找状态为1的信息
	@Override
	public Notice findNoticeState() {
		Notice notice = noticeDao.findNoticeState();
		return notice;
	}

	//将所有状态码改为0
	@Override
	public void updateNoticeStateZero() {
		noticeDao.updateNoticeStateZero();
		
	}

	//根据id把状态码改为1
	@Override
	public void updateNoticeStateOne(int id) {
		noticeDao.updateNoticeStateOne(id);
		
	}

}
