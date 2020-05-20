package com.cms.dao;

import com.cms.entity.User;

public interface UserDao {
	
	public User SaveUser(User user);
	public User findByEmailAndPassword(String email, String password);
	
	

}
