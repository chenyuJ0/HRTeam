package com.cn.hrsystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hrsystem.dao.EmployeeDao;
import com.cn.hrsystem.domain.Employee;
import com.cn.hrsystem.service.EmployeeService;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService{

	@Override
	public List<Employee> findAllDimission() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Employee> findAllChanger() {
		// TODO Auto-generated method stub
		return null;
	}



}
