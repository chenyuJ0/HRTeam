package com.cn.hrsystem.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cn.hrsystem.domain.Contract;
import com.cn.hrsystem.domain.Employee;
@Repository
public interface ContractDao {
	
	//查找转正信息
	public List<Employee> findChange(Employee emp);
	
	//查找离职信息
	public List<Employee> findDis(Employee emp);
	
	//添加合同
	public void addContract(Contract contract);
	
	//根据id删除合同
	public void deleteContractById(Integer id);
	
	//修改合同
	public void updateContract(Contract contract);
	
	//查找已签订合同
	public List<Employee> findAllCons(Employee emp);
	
	//根据合同id查找合同
	public Contract findContractById(Integer id);
	
	//查找合同预警
	public List<Contract> findContractWarning(Employee emp);
	
	//查找没有签订合同的
	public List<Employee> findUnsigendEmps(Employee emp);
	
	//根据员工id查找员工和合同的信息
	public Employee findEmpAndConByEmpId(Integer EmpID);
	
	//根据合同id查找员工和合同的信息
	public Employee findEmpAndConByConId(Integer ConID);
	
	//查找合同总数
	public int findContractCounts();
	
}
