package gov.dostxii.springmvc.model;

import java.io.Serializable;

public enum PostCatOrType implements Serializable{
	ABOUT("ABOUT"),
	RECRUITMENT("RECRUITMENT"),
	DEVELOPMENT("DEVELOPMENT"),
	PERFORMANCE("PERFORMANCE"),
	RECOGNITION("RECOGNITION"),
	FORMS("FORMS"),
	OTHERS("OTHERS");
	
	String str;
	
	private PostCatOrType(String userProfileType){
		this.str = userProfileType;
	}

	public String getStr() {
		return str;
	}


	
}
