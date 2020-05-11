package gov.dostxii.springmvc.dao;

import java.util.List;

import gov.dostxii.springmvc.model.UserProfile;


public interface UserProfileDao {

	List<UserProfile> findAll();
	
	UserProfile findByType(String type);
	
	UserProfile findById(int id);
}
