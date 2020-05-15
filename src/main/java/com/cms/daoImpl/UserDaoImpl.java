package com.cms.daoImpl;

import org.springframework.beans.factory.annotation.Autowired;

import com.cms.dao.UserDao;
import com.cms.entity.User;
import com.cms.repository.UserRepository;

public class UserDaoImpl implements UserDao {

	@Autowired
	UserRepository userepo;
	
	@Override
	public User SaveEmployee(User user) {
		
		return userepo.save(user);
	}

}
