package com.cms.daoImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cms.dao.UserDao;
import com.cms.entity.User;
import com.cms.repository.UserRepository;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	UserRepository userepo;
	
	@Override
	public User SaveUser(User user) {
		
		return userepo.save(user);
	}

	@Override
	public User findByEmailAndPassword(String email, String password) 
	{
		return userepo.findByEmailAndPassword(email, password);
	}

}
