package com.cn.hrsystem.service;

import com.cn.hrsystem.domain.Document;

import java.util.List;

public interface DocumentService {
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


}
