package gov.dostxii.springmvc.service;

import java.util.List;

import gov.dostxii.springmvc.model.Post;

public interface PostService {

	Post findById(int id);

	List<Post> findAll();
	
	List<Post> findAllByEnable(Boolean enable);

	List<Post> findAllByCatOrSubCat(String category, String subCategory, Boolean enable);
	
	void savePost(Post post);
	
	void updatePost(Post post);
	
	void deleteById(int id);
}
