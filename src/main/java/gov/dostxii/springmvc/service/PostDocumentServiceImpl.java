package gov.dostxii.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gov.dostxii.springmvc.dao.PostDocumentDao;
import gov.dostxii.springmvc.model.PostDocument;

@Service("postDocumentService")
@Transactional
public class PostDocumentServiceImpl implements PostDocumentService{

	@Autowired
	PostDocumentDao dao;

	public PostDocument findById(int id) {
		return dao.findById(id);
	}

	public List<PostDocument> findAll() {
		return dao.findAll();
	}

	public List<PostDocument> findAllByPostId(int postId) {
		return dao.findAllByPostId(postId);
	}
	
	public void saveDocument(PostDocument document){
		dao.save(document);
	}

	public void deleteById(int id){
		dao.deleteById(id);
	}
	
}
