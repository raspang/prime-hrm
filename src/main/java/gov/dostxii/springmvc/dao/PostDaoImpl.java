package gov.dostxii.springmvc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import gov.dostxii.springmvc.model.Post;

@Repository("postDao")
public class PostDaoImpl extends AbstractDao<Integer, Post> implements PostDao{

	@SuppressWarnings("unchecked")
	public List<Post> findAll() {
		Criteria crit = createEntityCriteria();
		return (List<Post>)crit.list();
	}

	@Override
	public List<Post> findAllByEnable(Boolean enable) {
		Criteria crit = createEntityCriteria();
		if(!enable)
			crit.add(Restrictions.eq("enable", true));
		
		return (List<Post>)crit.list();
	}
	
	public void save(Post post) {
		persist(post);
	}

	
	public Post findById(int id) {
		return getByKey(id);
	}

	@SuppressWarnings("unchecked")
	public List<Post> findAllByCatOrSubCat(String category, String subCategory, Boolean enable){
		Criteria crit = createEntityCriteria();
		if(enable)
			crit.add(Restrictions.eq("enable", true));
		
		crit.add(Restrictions.eq("category", category));
		if(subCategory != null && !subCategory.isEmpty())
			crit.add(Restrictions.eq("subCategory", subCategory));
		crit.addOrder(Order.asc("id"));
		return (List<Post>)crit.list();
	}

	
	public void deleteById(int id) {
		Post post =  getByKey(id);
		delete(post);
	}



}
