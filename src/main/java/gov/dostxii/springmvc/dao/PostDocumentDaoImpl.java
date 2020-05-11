package gov.dostxii.springmvc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import gov.dostxii.springmvc.model.PostDocument;

@Repository("postDocumentDao")
public class PostDocumentDaoImpl extends AbstractDao<Integer, PostDocument> implements PostDocumentDao{

	@SuppressWarnings("unchecked")
	public List<PostDocument> findAll() {
		Criteria crit = createEntityCriteria();
		return (List<PostDocument>)crit.list();
	}

	public void save(PostDocument document) {
		persist(document);
	}

	
	public PostDocument findById(int id) {
		return getByKey(id);
	}

	@SuppressWarnings("unchecked")
	public List<PostDocument> findAllByPostId(int postId){
		Criteria crit = createEntityCriteria();
		Criteria userCriteria = crit.createCriteria("post");
		userCriteria.add(Restrictions.eq("id", postId));
		return (List<PostDocument>)crit.list();
	}

	
	public void deleteById(int id) {
		PostDocument document =  getByKey(id);
		delete(document);
	}

}
