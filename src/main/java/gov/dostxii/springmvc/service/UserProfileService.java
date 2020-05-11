package gov.dostxii.springmvc.service;

import java.util.List;

import gov.dostxii.springmvc.model.UserProfile;


public interface UserProfileService {

	UserProfile findById(int id);

	UserProfile findByType(String type);
	
	List<UserProfile> findAll();
	
}
