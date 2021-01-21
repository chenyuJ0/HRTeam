package com.cn.hrsystem.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.cn.hrsystem.domain.Employee;

public class EmployeeDaoTest {

	@Test
	public void test() {
		fail("Not yet implemented");
	}
	
	@Test
	public void testFindAllDimission() throws IOException {
		InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
		SqlSession openSession = factory.openSession();
		EmployeeDao dao = openSession.getMapper(EmployeeDao.class);
//		List<Employee> list = dao.findEmpById(id);
//		for(Employee e : list) {
//			System.out.println(e);
//			System.out.println("hello");
//		}
	}

}
