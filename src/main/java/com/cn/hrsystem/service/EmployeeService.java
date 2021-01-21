package com.cn.hrsystem.service;

import java.util.List;

import com.cn.hrsystem.domain.Employee;

public interface EmployeeService {
	//查找所有离职信息
	public List<Employee> findAllDimission();
	
	//查找转正信息
	public List<Employee> findAllChanger();
	
	//根据id查找用户
	//public List
}
