package com.cms.dao;

import java.util.List;

import com.cms.entity.Category;

public interface CategoryDao {

	public Category SaveCategory(Category category);

	public List<Category> getAllCategory();

	public Category findCategoryById(long id);

	public void deleteCategory(long id);

}
