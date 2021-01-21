package com.cn.hrsystem.dao;

import static org.junit.Assert.fail;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.cn.hrsystem.domain.Contract;
import com.cn.hrsystem.domain.Employee;

public class ContractDaoTest {
	private ContractDao contractDao;
	private SqlSessionFactory factory;
	private SqlSession openSession;
	private InputStream in;
	@Before
	public void before() {
		try {
			in = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		factory = new SqlSessionFactoryBuilder().build(in);
		openSession = factory.openSession();
		contractDao= openSession.getMapper(ContractDao.class);
	}
	
	@After
	public void after() {
		openSession.commit();
		openSession.close();
		try {
			in.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void test() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindAll() throws IOException {
		Employee emp = new Employee();
		InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
		SqlSession openSession = factory.openSession();
		ContractDao dao = openSession.getMapper(ContractDao.class);
		List<Contract> contracts = dao.findContractWarning(emp);
		for(Contract c : contracts) {
			System.out.println(c);
		}
		openSession.commit();
		openSession.close();
		in.close();
	}
	
	@Test
	public void testFindChange() {
		Employee emp = new Employee();
		List<Employee> list = contractDao.findChange(emp);
		for(Employee e : list) {
			System.out.println(e);
		}
	}
	
	@Test
	public void testFindDis() {
		Employee emp = new Employee();
		List<Employee> list = contractDao.findDis(emp);
		for(Employee e : list) {
			System.out.println(e);
		}
	}
	
	@Test
	public void testFindContractWarning() {
		Employee emp = new Employee();
		List<Contract> list = contractDao.findContractWarning(emp);
		for(Contract c : list) {
			System.out.println(c.getEmp_id());
			System.out.println(c.getEmp().getJobnum());
			System.out.println(c.getEmp().getEmpname());
			System.out.println(c.getEmp().getDept().getDeptname());
			System.out.println(c.getEmp().getJob().getJobname());
			System.out.println(c.getStart_date());
			System.out.println(c.getEnd_date());
			System.out.println(c.getId());
		}
	}
	
	//测试已签订合同
	@Test
	public void testFindAllCons() {
		Employee emp = new Employee();
		List<Employee> list = contractDao.findAllCons(emp);
		for(Employee e : list) {
			System.out.println(e);
		}
		
	}
	
	@Test
	public void testFindEmpAndConByEmpId() {
		Employee e = contractDao.findEmpAndConByEmpId(2);
		System.out.println(e);
	}
	
	//添加合同
	@Test
	public void testAddContract() {
		Contract contract = new Contract();
		contract.setContract_date(new Date());
		contract.setStart_date(new Date());
		contract.setEnd_date(new Date());
		contract.setComment("hello");
		contract.setEmp_id(12);
		
		contractDao.addContract(contract);
	}
	
	//测试删除合同
	@Test
	public void testDeleteContractById() {
		contractDao.deleteContractById(26);
	}
	
	
}
