package com.cms.service;

import com.cms.entity.User;

public interface UserService {
	
	public User SaveUser(User user);
	public User findByEmailAndPassword(String email, String password);

}
