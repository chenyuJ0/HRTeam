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

import com.cn.hrsystem.domain.Contract;

public class ContractTest {

	@Test
	public void test() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindAll() throws IOException {
//		InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
//		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
//		SqlSession openSession = factory.openSession();
//		ContractDao dao = openSession.getMapper(ContractDao.class);
//		List<Contract> contracts = dao.findAll();
//		for(Contract c : contracts) {
//			System.out.println(c);
//		}
//		openSession.commit();
//		openSession.close();
//		in.close();
	}
}
