package com.cms.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.cms.dao.UserDao;
import com.cms.entity.User;
import com.cms.service.UserService;

@Service
@Repository
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Override
	public User SaveUser(User user) {

		return userDao.SaveUser(user);
	}

	@Override
	public User findByEmailAndPassword(String email, String password) {
	
		return  userDao.findByEmailAndPassword(email, password);
	}

}
