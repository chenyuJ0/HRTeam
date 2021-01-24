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
	 * ��ҳ��ѯ����Ա����Ϣ�������û���������ģ����ѯԱ����Ϣ
	 */
	@Override
	public List<Employee> findEmpsByCondition(Employee employee) {
		return employeeDao.findEmpsByCondition(employee);
	}

	/**
	 * ����Ա��id��ѯԱ����Ϣ
	 */
	@Override
	public Employee findEmpById(int id) {
		return employeeDao.findEmpById(id);
	}

	/**
	 * �޸�Ա����Ϣ
	 */
	@Override
	public void updateEmp(Employee employee) {
		employeeDao.updateEmp(employee);
	}

	/**
	 * ���Ա��
	 */
	@Override
	public void addEmp(Employee employee) {
		// 1�������ݿ��в�ѯ������Ա����¼������Ա�����
		String maxJobnum = employeeDao.findMaxJobnum();
		// 2������Ա�������Ч���ֲ���ȡ��
		Integer num = Integer.valueOf(maxJobnum);
		// 3���ڵ�ǰ��������Ա����Ż����ϼ�1����������һ�����
		String jobnum = String.format("%05d", num+1);
		employee.setJobnum(jobnum);
		
		employeeDao.addEmp(employee);
	}

	/**
	 * Ա��ת��
	 */
	@Override
	public void changeWorkMessage(Employee employee) {
		employeeDao.changeWorkMessage(employee);
	}

	/**
	 * Ա����ְ
	 */
	@Override
	public void dimission(Employee employee) {
		employeeDao.dimission(employee);
	}

	/**
	 * ǰ̨ɾ��Ա��ʱ���޸ĸ�Ա����deletestatus
	 */
	@Override
	public void modifiedDeletestatus(Employee employee) {
		employeeDao.modifiedDeletestatus(employee);
	}

	@Override
	public int findEmpCounts() {
		int emps = employeeDao.findEmpCounts();
		return emps;
	}

}
