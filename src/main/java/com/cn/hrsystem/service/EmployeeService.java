package com.cn.hrsystem.service;

import java.util.List;

import com.cn.hrsystem.domain.Employee;

public interface EmployeeService {
	/**
	 * ��ҳ��ѯ����Ա����Ϣ�������û���������ģ����ѯԱ����Ϣ
	 * 
	 * @return
	 */
	public List<Employee> findEmpsByCondition(Employee employee);

	/**
	 * ����Ա��id��ѯԱ����Ϣ
	 * 
	 * @param id
	 * @return
	 */
	public Employee findEmpById(int id);

	/**
	 * �޸�Ա����Ϣ
	 * 
	 * @param employee
	 */
	public void updateEmp(Employee employee);

	/**
	 * ���Ա��
	 * 
	 * @param employee
	 */
	public void addEmp(Employee employee);

	/**
	 * Ա��ת��
	 * 
	 * @param employee
	 */
	public void changeWorkMessage(Employee employee);

	/**
	 * Ա����ְ
	 * 
	 * @param employee
	 */
	public void dimission(Employee employee);
	
	/**
	 * ǰ̨ɾ��Ա��ʱ���޸ĸ�Ա����deletestatus
	 * 
	 * @param employee
	 */
	public void modifiedDeletestatus(Employee employee);

}
