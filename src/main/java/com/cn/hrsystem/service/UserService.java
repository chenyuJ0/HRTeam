package com.cn.hrsystem.service;

import com.cn.hrsystem.domain.User;

public interface UserService {
	/**
	 * �û���¼
	 * @param user
	 * @return
	 */
	public User login(User user);
	
	/**
	 * ��ѯ�����û�
	 * @return
	 */
	public int findAllUsers();
	
}
