package com.cn.hrsystem.service;

import java.util.List;

import com.cn.hrsystem.domain.Contract;
import com.cn.hrsystem.domain.Employee;

public interface ContractService{
	
	//查找转正信息
	public List<Employee> findChange(Employee emp);	
	
	//查找离职信息
	public List<Employee> findDis(Employee emp);
	
	//查找合同预警
	public List<Contract> findContractWarnning(Employee emp);
	
	//查找所有未签订合同的员工信息
	public List<Employee> findAllUnsignedContracts(Employee employee);
	
	//查找所有已签订合同的员工
	public List<Employee> findSingnedContractEmployees();
	
	//根据id删除合同
	public void deleteContractById(Integer id);
		
	//编辑合同
	public void editContract(Contract contract);
		
	//签订合同
	public void addContract(Contract contract);
	
	//根据id查询合同
	public Employee findContractById(Integer id);
	
	//根据id查找员工和合同的信息
	public Employee findEmpAndConByEmpID(Integer EmpID);
	
	//根据id查找员工和合同的信息
	public Employee findEmpAndConByConID(Integer ConID);
	
	//查找所有已签订合同的员工
	public List<Employee> findAllCons(Employee emp);
	
	//查找所有合同数量
	public int findContractCounts();
	
	
}
