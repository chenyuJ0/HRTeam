package com.cn.hrsystem.service;

import com.cn.hrsystem.domain.User;

public interface UserService {
	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	public User login(User user);
	
	/**
	 * 查询所有用户
	 * @return
	 */
	public int findAllUsers();
	
}
