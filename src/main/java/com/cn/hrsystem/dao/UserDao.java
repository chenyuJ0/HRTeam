package com.cn.hrsystem.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.cn.hrsystem.domain.User;

@Repository
public interface UserDao {
	/**
	 * 登录时通过用户名和密码查询用户信息
	 * @param user
	 * @return
	 */
	@Select("select * from user where username=#{username} and password=#{password}")
	public User login(User user);
	
	/**
	 * 通过id查询用户信息
	 * @param id
	 * @return
	 */
	@Select("select * from user where id=#{id }")
	public User findUserById(int id);
	
	/**
	 * 查询所有用户
	 * @return
	 */
	@Select("select count(id) from user")
	public int findAllUsers();
}
