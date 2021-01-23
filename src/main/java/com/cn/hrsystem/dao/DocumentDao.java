package com.cn.hrsystem.dao;


import com.cn.hrsystem.domain.Document;
import com.cn.hrsystem.domain.Employee;
import jdk.internal.org.objectweb.asm.tree.InnerClassNode;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DocumentDao {
	
	
	//添加文件
	public void addDocument(Document document);
	
	//根据文件id删除文件
	public void deleteDocumentById(Integer id);
	
	//更新文件
	public void updateDocument(Document document);
	
	//查找文件。
	public List<Document> findAllDocuments(Document document);

	//根据文件id查找文件
	public Document findDocumentById(Integer id);
	
	//查询总文件数
	public int findDocumentCounts();
	
	
	
    //查训文档信息
	/*
	 * @Select("select d.id,d.title,d.filename,d.create_date,u.`name`\r\n" +
	 * "from document d LEFT  JOIN `user` u ON\r\n" + "d.user_id = u.id\r\n") public
	 * List<Document> findAllDoc();
	 * 
	 * 
	 * @Select("select d.id,d.title,d.filename,d.create_date,u.`name`\r\n" +
	 * "from document d LEFT  JOIN `user` u ON\r\n" + "d.user_id = u.id\r\n"+
	 * "where d.id =#{id}\r\n") public Document findById(Integer id);
	 * 
	 * 
	 * @Update("update document set title = #{document.title},filename = #{document.filename},create_date=#{document.create_date} \r\n"
	 * + "where id = #{document.id}") public int updateById(@Param("document")
	 * Document document);
	 * 
	 * @Delete("DELETE  from document where id =#{id} ") public int
	 * deleteById(Integer id);
	 * 
	 * 
	 * @Select("select d.id,d.title,d.filename,d.create_date,u.`name`\r\n" +
	 * "from document d LEFT  JOIN `user` u ON\r\n" + "d.user_id = u.id\r\n"+
	 * "where d.filename like  CONCAT('%',#{0},'%')\r\n") public List<Document>
	 * docSearch(String filename);
	 * 
	 * 
	 * @Insert("insert into document(title,filename,create_date,user_id)\r\n" +
	 * "values(#{document.title},#{document.filename},CURDATE(),#{document.user_id})")
	 * public int InsertOne(@Param("document") Document document);
	 */






}
