package com.cn.hrsystem.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.cn.hrsystem.domain.Dept;



public class DeptDaoTest {

	//测试查找所有部门信息
	@Test
	public void testFindAllDept() throws IOException {
		InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
		//创建SqlSessionFactoryBuilder对象
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		//创建SqlSessionFactory对象
		SqlSessionFactory factory = builder.build(in);
		SqlSession session = factory.openSession();
		DeptDao dao = session.getMapper(DeptDao.class);
		
//		List<Dept> list = dao.findAllDept();
//		for(Dept d:list) {
//			System.out.println(d);
//		}
		
		int findDeptCount = dao.findDeptCount();
		System.out.println(findDeptCount);
		session.close();
		in.close();
		
	}
	
		//测试
		@Test
		public void testTest() throws IOException {
			InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
			//创建SqlSessionFactoryBuilder对象
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			//创建SqlSessionFactory对象
			SqlSessionFactory factory = builder.build(in);
			SqlSession session = factory.openSession();
			DeptDao dao = session.getMapper(DeptDao.class);
			
			
			List<Dept> list = dao.findDeptIdAndName();
			for(Dept d:list) {
				System.out.println(d);
			}
			session.close();
			in.close();
			
		}
	
	
	
	
	
	
	
	
	
	//测试添加部门信息
	@Test
	public void testAddDept() throws IOException {
		InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
		//创建SqlSessionFactoryBuilder对象
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		//创建SqlSessionFactory对象
		SqlSessionFactory factory = builder.build(in);
		SqlSession session = factory.openSession();
		DeptDao dao = session.getMapper(DeptDao.class);
		
		Dept dept = new Dept();
		dept.setDeptno(50);
		dept.setDeptname("测试部");
		dept.setCreate_date(new Date());
		dept.setDes("测试软件");
		dept.setCount(0);
		dao.addDept(dept);
		
		session.commit();
		session.close();
		in.close();
		
	}
	
	//测试更新部门信息
	@Test
	public void testUpdateDept() throws IOException {
		InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
		//创建SqlSessionFactoryBuilder对象
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		//创建SqlSessionFactory对象
		SqlSessionFactory factory = builder.build(in);
		SqlSession session = factory.openSession();
		DeptDao dao = session.getMapper(DeptDao.class);
		
		Dept dept = new Dept();
		dept.setId(5);
		dept.setDeptno(60);
		dept.setDeptname("测试部");
		dept.setCreate_date(new Date());
		dept.setDes("测试软件和其他");
		dept.setCount(0);
		dao.updateDept(dept);
		
		session.commit();
		session.close();
		in.close();
		
	}
	
	//测试删除部门信息
	@Test
	public void testDeleteDept() throws IOException {
		InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
		//创建SqlSessionFactoryBuilder对象
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		//创建SqlSessionFactory对象
		SqlSessionFactory factory = builder.build(in);
		SqlSession session = factory.openSession();
		DeptDao dao = session.getMapper(DeptDao.class);
		
		dao.deleteDept(5);
		session.commit();
		session.close();
		in.close();
		
	}
	

}
