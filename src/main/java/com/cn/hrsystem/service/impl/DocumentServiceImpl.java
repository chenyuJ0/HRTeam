package com.cn.hrsystem.service.impl;

import com.cn.hrsystem.dao.DocumentDao;
import com.cn.hrsystem.domain.Document;
import com.cn.hrsystem.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("documentService")
public class DocumentServiceImpl implements DocumentService {

    @Autowired
    private DocumentDao documentDao;



	@Override
	public int findDocumentCounts() {
		int count = documentDao.findDocumentCounts();
		return count;
	}



	@Override
	public void addDocument(Document document) {
		documentDao.addDocument(document);
		
	}



	@Override
	public void deleteDocumentById(Integer id) {
		documentDao.deleteDocumentById(id);
		
	}



	@Override
	public void updateDocument(Document document) {
		documentDao.updateDocument(document);
		
	}



	@Override
	public List<Document> findAllDocuments(Document document) {
		List<Document> list = documentDao.findAllDocuments(document);
		return list;
	}



	@Override
	public Document findDocumentById(Integer id) {
		Document document = documentDao.findDocumentById(id);
		return document;
	}
}
