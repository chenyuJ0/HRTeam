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

import com.cn.hrsystem.domain.Notice;


public class NoticeDaoTest {

	@Test
	public void testFindAllNotice() throws IOException {
		
		InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
		//创建SqlSessionFactoryBuilder对象
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		//创建SqlSessionFactory对象
		SqlSessionFactory factory = builder.build(in);
		SqlSession session = factory.openSession();
		NoticeDao noticeDao = session.getMapper(NoticeDao.class);
		
		List<Notice> list = noticeDao.findAllNotice();
		for(Notice notice:list) {
			System.out.println(notice);
		}
		
		session.close();
		in.close();
		
	}
}
