package com.cms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cms.entity.User;

public interface UserRepository extends  JpaRepository<User, Long> {
	
	public User findByEmailAndPassword(String email,String password);

}
