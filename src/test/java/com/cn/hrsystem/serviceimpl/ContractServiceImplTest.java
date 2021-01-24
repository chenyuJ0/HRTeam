package com.cn.hrsystem.serviceimpl;

import static org.junit.Assert.fail;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.format.annotation.DateTimeFormat;

import com.cn.hrsystem.domain.Contract;
import com.cn.hrsystem.domain.Employee;
import com.cn.hrsystem.service.ContractService;

public class ContractServiceImplTest {

	@Test
	public void test() {
		fail("Not yet implemented");
	}
	
	@Test
	public void testFindAll() {
		//先创建Spring容器
		Employee emp = new Employee();
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		ContractService contractService = (ContractService)ac.getBean("contractService");
		List<Contract> list = contractService.findContractWarnning(emp);
		for(Contract c : list) {
			System.out.println("hello"+c);
		}
	}
	
	@Test
	public void testFindDis() {
		//先创建Spring容器
		Employee emp = new Employee();
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		ContractService contractService = (ContractService)ac.getBean("contractService");
		List<Employee> list = contractService.findDis(emp);
		for(Employee c : list) {
			System.out.println("hello"+c);
		}
	}
	
	@Test
	public void testFindContractWarning() {
		Employee emp = new Employee();
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		ContractService contractService = (ContractService)ac.getBean("contractService");
		List<Contract> list = contractService.findContractWarnning(emp);
		for(Contract c : list) {
			System.out.println("hello"+c);
		}
	}
	
	@Test
	public void testFindAllCons() {
		Employee emp = new Employee();
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		ContractService contractService = (ContractService)ac.getBean("contractService");
		List<Employee> list = contractService.findAllCons(emp);
		for(Employee e : list) {
			System.out.println("hello"+e);
		}
		
		
	}
	
	@Test
	public void testFindEmpAndConByEmpId() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		ContractService contractService = (ContractService)ac.getBean("contractService");
		Employee e = contractService.findEmpAndConByEmpID(2);
		System.out.println(e);
	}
	
	
	
	@Test
	public void testFindContractCounts() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		ContractService contractService = (ContractService)ac.getBean("contractService");
		int counts = contractService.findContractCounts();
		System.out.println(counts);
	}
	
	
	
	
	
	
	
}
