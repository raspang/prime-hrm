package gov.dostxii.springmvc.dao;

import java.util.List;

import gov.dostxii.springmvc.model.PostDocument;

public interface PostDocumentDao {

	List<PostDocument> findAll();
	
	PostDocument findById(int id);
	
	void save(PostDocument document);
	
	List<PostDocument> findAllByPostId(int postId);
	
	void deleteById(int id);
}
