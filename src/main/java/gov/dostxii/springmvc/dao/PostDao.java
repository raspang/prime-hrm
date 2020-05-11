package gov.dostxii.springmvc.dao;

import java.util.List;

import gov.dostxii.springmvc.model.Post;

public interface PostDao {

	List<Post> findAll();
	
	List<Post> findAllByEnable(Boolean enable);
	
	Post findById(int id);
	
	void save(Post post);
	
	List<Post> findAllByCatOrSubCat(String category, String subCategory, Boolean enable);
	
	void deleteById(int id);
}
