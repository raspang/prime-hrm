package gov.dostxii.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gov.dostxii.springmvc.dao.PostDao;
import gov.dostxii.springmvc.model.Post;
import gov.dostxii.springmvc.model.User;

@Service("postService")
@Transactional
public class PostServiceImpl implements PostService{

	@Autowired
	PostDao dao;

	public Post findById(int id) {
		return dao.findById(id);
	}

	public List<Post> findAll() {
		return dao.findAll();
	}

	public List<Post> findAllByEnable(Boolean enable) {
		return dao.findAllByEnable(enable);
	}
	

	public List<Post> findAllByCatOrSubCat(String category, String subCategory, Boolean enable){
		return dao.findAllByCatOrSubCat(category, subCategory, enable);
	}
	
	public void savePost(Post post){
		dao.save(post);
	}
	
	

	public void deleteById(int id){
		dao.deleteById(id);
	}

	public void updatePost(Post post) {
		Post entity = dao.findById(post.getId());
		if(entity!=null){
			entity.setCategory(post.getCategory());
			entity.setSubCategory(post.getSubCategory());
			entity.setPostDocuments(post.getPostDocuments());
			entity.setTitle(post.getTitle());
			entity.setContent(post.getContent());
			entity.setUrl(post.getUrl());
			entity.setEnable(post.getEnable());
		}
	}

	
}
