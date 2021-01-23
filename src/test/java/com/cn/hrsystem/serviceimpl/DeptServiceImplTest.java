package com.cn.hrsystem.serviceimpl;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cn.hrsystem.domain.Dept;
import com.cn.hrsystem.service.DeptService;

public class DeptServiceImplTest {
	
	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
	DeptService accountService = (DeptService)ac.getBean("deptService");

	@Test
	public void testFindAllDept() {
		
		List<Dept> list = accountService.findAllDept();
		for(Dept d:list) {
			System.out.println(d);
		}	
	}
	
	@Test
	public void testAddDept() {
		Dept dept = new Dept();
		dept.setDeptno(50);
		dept.setDeptname("测试部");
		dept.setCreate_date(new Date());
		dept.setDes("测试软件");
		dept.setCount(0);
		accountService.addDept(dept);	
	}
	
	@Test
	public void testupdateDept() {
		Dept dept = new Dept();
		dept.setId(5);
		dept.setDeptno(60);
		dept.setDeptname("测试部");
		dept.setCreate_date(new Date());
		dept.setDes("测试软件和其他");
		dept.setCount(0);
		accountService.updateDept(dept);		
	}
	
	@Test
	public void testdeleteDept() {
		accountService.deleteDept(5);
	}

}
