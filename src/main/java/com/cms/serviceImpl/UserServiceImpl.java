package com.cms.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;

import com.cms.dao.UserDao;
import com.cms.entity.User;
import com.cms.service.UserService;

public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userDao;

	@Override
	public User SaveEmployee(User user) {
		return userDao.SaveEmployee(user);
	}

}
