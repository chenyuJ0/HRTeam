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

import com.cn.hrsystem.domain.Document;

public class DocumentDaoTest {
	private DocumentDao documentDao;
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
		documentDao= openSession.getMapper(DocumentDao.class);
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
	public void testAddDocument() {
		Document document = new Document();
		document.setFilename("test1");
		document.setRemark("#:\\");
		document.setCreate_date(new Date());
		document.setDescription("哈哈");
		document.setUser_id(2);
		documentDao.addDocument(document);
		
	}
	

	@Test
	public void testDeleteDocumentById() {
		documentDao.deleteDocumentById(3);
	}

	@Test
	public void testUpdateDocument() {
		Document document = new Document();
		document.setId(2);
		document.setFilename("test1");
		document.setRemark("#:\\");
		document.setCreate_date(new Date());
		document.setDescription("哈哈");
		document.setUser_id(2);
		documentDao.updateDocument(document);
	}
	
	
	@Test
	public void testFindAllDocuments() {
		Document document = new Document();
		List<Document> list = documentDao.findAllDocuments(document);
		for(Document d : list) {
			System.out.println(d);
		}
	}
	
	@Test
	public void testFindDocumentById() {
		Document d = documentDao.findDocumentById(1);
		System.out.println(d);
	}
	
	@Test
	public void testFindDocumentCounts() {
		int count = documentDao.findDocumentCounts();
		System.out.println(count);
	}
	
	/**
	 * <!-- 添加文件 -->
	<insert id="addDocument" parameterType="com.cn.hrsystem.domain.Document">
		insert into document values(null,#{filename},#{remark},#{create_date},#{}description,#{user_id})
	</insert>
	
	
	<!-- 根据文件id删除文件 -->
	<delete id="deleteDocumentById">
		delete from document where id = #{id}
	</delete>
	
	<!-- 根据文件id更新文件 -->
	<update id="updateDocument" parameterType="com.cn.hrsystem.domain.Document">
		update document
		<set>
			<if test="id != null">
				id=#{id}
			</if>
			<if test="description !=null or description != ''">
				description=#{description}
			</if>
		</set>
	</update>
	
	<!-- 查找所有文件 -->
	<select id="findAllDocuments" parameterType="com.cn.hrsystem.domain.Document">
		select d.*,u.name 
		from document d
		left join user u
		on d.user_id = u.id
		<where>
			<if test="filename != null and filename != ''">
				and d.filename like concat('%',#{filename},'%')
			</if>
			<if test="description != null and description != ''">
				and d.description like concat('%',#{description},'%')
			</if>
		</where>
	</select>
	
	<!-- findDocumentById根据id查找文件 -->
	<select id="findDocumentById">
		select d.*,u.name 
		from document d
		left join user u
		on d.user_id = u.id
		where id=#{id}
	</select>
	
	<!-- 查询总文件数-->
	<select id="findDocumentCounts()">
		select count(*)
		from document
	</select>
	 */
	
}
