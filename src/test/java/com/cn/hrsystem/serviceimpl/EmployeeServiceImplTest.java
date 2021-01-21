package com.cn.hrsystem.serviceimpl;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cn.hrsystem.domain.Employee;
import com.cn.hrsystem.service.EmployeeService;

public class EmployeeServiceImplTest {

	@Test
	public void test() {
		fail("Not yet implemented");
	}
	

	@Test
	public void testfindAllDimission() {
		//先创建Spring容器
				ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
				EmployeeService employeeService = (EmployeeService)ac.getBean("employeeService");
				List<Employee> list = employeeService.findAllDimission();
				for(Employee e : list) {
					System.out.println(e);
				}
				
	}

}
