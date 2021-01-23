package com.cn.hrsystem.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.cn.hrsystem.domain.User;

@Repository
public interface UserDao {
	/**
	 * ��¼ʱͨ���û����������ѯ�û���Ϣ
	 * @param user
	 * @return
	 */
	@Select("select * from user where username=#{username} and password=#{password}")
	public User login(User user);
	
	/**
	 * ͨ��id��ѯ�û���Ϣ
	 * @param id
	 * @return
	 */
	@Select("select * from user where id=#{id }")
	public User findUserById(int id);
}
