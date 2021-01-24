package com.cn.hrsystem.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hrsystem.dao.UserDao;
import com.cn.hrsystem.domain.User;
import com.cn.hrsystem.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	
	/**
	 * 用户登录
	 */
	@Override
	public User login(User user) {
		return userDao.login(user);
	}

	/**
	 * 查询所有用户
	 */
	@Override
	public int findAllUsers() {
		return userDao.findAllUsers();
	}

}

