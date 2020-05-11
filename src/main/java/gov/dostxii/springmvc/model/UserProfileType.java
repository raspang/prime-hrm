package gov.dostxii.springmvc.model;

import java.io.Serializable;

public enum UserProfileType implements Serializable{
	STAFF("STAFF"),
	HR("HR"),
	ADMIN("ADMIN");
	
	String userProfileType;
	
	private UserProfileType(String userProfileType){
		this.userProfileType = userProfileType;
	}
	
	public String getUserProfileType(){
		return userProfileType;
	}
	
}
