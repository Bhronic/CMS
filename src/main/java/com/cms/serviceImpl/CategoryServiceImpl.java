package com.cms.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.cms.dao.CategoryDao;
import com.cms.entity.Category;
import com.cms.service.CategoryService;

@Service
@Repository
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryDao categoryDao;

	@Override
	public Category SaveCategory(Category category) {
		return categoryDao.SaveCategory(category);
	}

	@Override
	public List<Category> getAllCategory() {
		return categoryDao.getAllCategory();
	}

	@Override
	public void deleteCategory(long id) {
		// TODO Auto-generated method stub
		categoryDao.deleteCategory(id);
	}

	@Override
	public Category findCategoryById(long id) {
		// TODO Auto-generated method stub
		return categoryDao.findCategoryById(id);
	}

}
