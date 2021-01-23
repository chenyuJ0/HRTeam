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

import com.cn.hrsystem.domain.Job;

public class JobDaoTest {

	@Test
	public void testFindAllJob() throws IOException {
		
		InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
		//创建SqlSessionFactoryBuilder对象
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		//创建SqlSessionFactory对象
		SqlSessionFactory factory = builder.build(in);
		SqlSession session = factory.openSession();
		JobDao dao = session.getMapper(JobDao.class);
		
		List<Job> list = dao.findJobIdAndName();
		for(Job j:list) {
			System.out.println(j);
		}
		session.close();
		in.close();
		
	}
	
	
	
	@Test
	public void testMoHuSearch() throws IOException {
		
		InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
		//创建SqlSessionFactoryBuilder对象
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		//创建SqlSessionFactory对象
		SqlSessionFactory factory = builder.build(in);
		SqlSession session = factory.openSession();
		JobDao dao = session.getMapper(JobDao.class);
		
//		Job job = new Job();
//		job.setJobno(14);
		//job.setJobname(null);
		//job.setDes(null);
		
//		List<Job> list = dao.moHuSearch(job);
//		for(Job j:list) {
//			System.out.println(j);
//		}
		
		int findJobCount = dao.findJobCount();
		System.out.println(findJobCount);
		session.close();
		in.close();
		
	}
	
	@Test
	public void testFindJobCount() throws IOException {
		
		InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
		//创建SqlSessionFactoryBuilder对象
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		//创建SqlSessionFactory对象
		SqlSessionFactory factory = builder.build(in);
		SqlSession session = factory.openSession();
		JobDao dao = session.getMapper(JobDao.class);
		
//		Job job = new Job();
//		job.setJobno(14);
		//job.setJobname(null);
		//job.setDes(null);
		
//		List<Job> list = dao.moHuSearch(job);
//		for(Job j:list) {
//			System.out.println(j);
//		}
		
		int findJobCount = dao.findJobCount();
		System.out.println(findJobCount);
		session.close();
		in.close();
		
	}
	
	
	
	

}
