package com.cn.hrsystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hrsystem.dao.ContractDao;
import com.cn.hrsystem.domain.Contract;
import com.cn.hrsystem.domain.Employee;
import com.cn.hrsystem.service.ContractService;

@Service("contractService")
public class ContractServiceImpl implements ContractService{
	@Autowired
	private ContractDao contractDao;

	public void setContractDao(ContractDao contractDao) {
		this.contractDao = contractDao;
	}

	@Override
	public List<Contract> findContractWarnning(Employee emp) {
		List<Contract> list = contractDao.findContractWarning(emp);
		return list;
	}

	//查找所用没签定合同的
	@Override
	public List<Employee> findAllUnsignedContracts(Employee emp) {
		List<Employee> list = contractDao.findUnsigendEmps(emp);
		return list;
	}

	@Override
	public List<Employee> findSingnedContractEmployees() {
		// TODO Auto-generated method stub
		return null;
	}

	//根据id删除合同
	@Override
	public void deleteContractById(Integer id) {
		Contract contract = contractDao.findContractById(id);
		if(contract != null) {
			contractDao.deleteContractById(id);
		}
	}

	@Override
	public void editContract(Contract contract) {
		// TODO Auto-generated method stub
		
	}

	//添加合同
	@Override
	public void addContract(Contract contract) {
		contractDao.addContract(contract);
		
	}

	//根据id查找合同
	@Override
	public Employee findContractById(Integer id) {
		return null;
	}

	//查找所有已签订合同
	@Override
	public List<Employee> findAllCons(Employee emp) {
		List<Employee> list = contractDao.findAllCons(emp);
		return list;
	}

	@Override
	//查找转正信息
	public List<Employee> findChange(Employee emp) {
		List<Employee> list = contractDao.findChange(emp);
		return list;
	}


	@Override
	//查找离职信息
	public List<Employee> findDis(Employee emp) {
		List<Employee> list = contractDao.findDis(emp);
		return list;
	}


	
	//根据id查找员工和合同的信息
	@Override
	public Employee findEmpAndConByEmpID(Integer EmpID) {
		Employee employee = contractDao.findEmpAndConByEmpId(EmpID);
		return employee;
	}


}
