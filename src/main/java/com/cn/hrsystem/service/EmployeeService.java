package com.cn.hrsystem.service;

import java.util.List;

import com.cn.hrsystem.domain.Employee;

public interface EmployeeService {
	/**
	 * 分页查询所有员工信息、根据用户输入条件模糊查询员工信息
	 * 
	 * @return
	 */
	public List<Employee> findEmpsByCondition(Employee employee);

	/**
	 * 根据员工id查询员工信息
	 * 
	 * @param id
	 * @return
	 */
	public Employee findEmpById(int id);

	/**
	 * 修改员工信息
	 * 
	 * @param employee
	 */
	public void updateEmp(Employee employee);

	/**
	 * 添加员工
	 * 
	 * @param employee
	 */
	public void addEmp(Employee employee);

	/**
	 * 员工转正
	 * 
	 * @param employee
	 */
	public void changeWorkMessage(Employee employee);

	/**
	 * 员工离职
	 * 
	 * @param employee
	 */
	public void dimission(Employee employee);
	
	/**
	 * 前台删除员工时，修改该员工的deletestatus
	 * 
	 * @param employee
	 */
	public void modifiedDeletestatus(Employee employee);

}
