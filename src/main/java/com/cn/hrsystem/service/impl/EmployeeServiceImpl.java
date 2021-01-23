package com.cn.hrsystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hrsystem.dao.EmployeeDao;
import com.cn.hrsystem.domain.Employee;
import com.cn.hrsystem.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private EmployeeDao employeeDao;

	/**
	 * 分页查询所有员工信息、根据用户输入条件模糊查询员工信息
	 */
	@Override
	public List<Employee> findEmpsByCondition(Employee employee) {
		return employeeDao.findEmpsByCondition(employee);
	}

	/**
	 * 根据员工id查询员工信息
	 */
	@Override
	public Employee findEmpById(int id) {
		return employeeDao.findEmpById(id);
	}

	/**
	 * 修改员工信息
	 */
	@Override
	public void updateEmp(Employee employee) {
		employeeDao.updateEmp(employee);
	}

	/**
	 * 添加员工
	 */
	@Override
	public void addEmp(Employee employee) {
		// 1、从数据库中查询出现有员工记录中最大的员工编号
		String maxJobnum = employeeDao.findMaxJobnum();
		// 2、将此员工编号有效数字部分取出
		Integer num = Integer.valueOf(maxJobnum);
		// 3、在当前查出的最大员工编号基础上加1，来生成下一个编号
		String jobnum = String.format("%05d", num+1);
		employee.setJobnum(jobnum);
		
		employeeDao.addEmp(employee);
	}

	/**
	 * 员工转正
	 */
	@Override
	public void changeWorkMessage(Employee employee) {
		employeeDao.changeWorkMessage(employee);
	}

	/**
	 * 员工离职
	 */
	@Override
	public void dimission(Employee employee) {
		employeeDao.dimission(employee);
	}

	/**
	 * 前台删除员工时，修改该员工的deletestatus
	 */
	@Override
	public void modifiedDeletestatus(Employee employee) {
		employeeDao.modifiedDeletestatus(employee);
	}

}
