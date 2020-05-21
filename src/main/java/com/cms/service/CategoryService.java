package com.cms.service;

import java.util.List;

import com.cms.entity.Category;

public interface CategoryService {

	public Category SaveCategory(Category category);
	public List<Category> getAllCategory();
}
