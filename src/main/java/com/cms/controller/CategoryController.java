package com.cms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cms.entity.Category;
import com.cms.service.CategoryService;
import com.cms.service.UserService;

@Controller
@RequestMapping("/cms")
public class CategoryController {

	@Autowired
	CategoryService category_service;

	@GetMapping("/category")
	public ModelAndView categoryView(ModelAndView model)
	{
		List<Category> listCategory = category_service.getAllCategory();			
		model.addObject("listCategory", listCategory);		
		model.setViewName("category");
		return model;

	}

	@PostMapping("/saveCategory")
	public ModelAndView saveUser(@ModelAttribute("category") Category category, ModelMap model) {
		ModelAndView mav = null;
		try 
		{
			category_service.SaveCategory(category);
			/* List<Category> listCategory = category_service.getAllCategory(); */			
			mav = new ModelAndView("redirect:/cms/category");
			/* mav.addObject("listCategory", listCategory); */
		} catch (Exception e) {
			mav = new ModelAndView("login");
		}

		return mav;

	}
}
