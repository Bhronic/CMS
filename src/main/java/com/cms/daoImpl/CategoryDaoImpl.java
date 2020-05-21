package com.cms.daoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cms.dao.CategoryDao;
import com.cms.entity.Category;
import com.cms.repository.CategoryRepository;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	CategoryRepository category_repo;

	@Override
	public Category SaveCategory(Category category) {

		return category_repo.save(category);
	}

	@Override
	public List<Category> getAllCategory() {
		
		return category_repo.findAll();
	}

}
