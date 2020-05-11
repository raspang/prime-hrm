package gov.dostxii.springmvc.service;

import java.util.List;

import gov.dostxii.springmvc.model.PostDocument;

public interface PostDocumentService {

	PostDocument findById(int id);

	List<PostDocument> findAll();
	
	List<PostDocument> findAllByPostId(int id);
	
	void saveDocument(PostDocument document);
	
	void deleteById(int id);
}
