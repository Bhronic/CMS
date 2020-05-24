package com.cms.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cms.entity.Category;
import com.cms.service.CategoryService;

@Controller
@RequestMapping("/cms")
public class CategoryController {

	@Autowired
	CategoryService category_service;

	@GetMapping("/category")
	public ModelAndView categoryView(ModelAndView model) {
		model.setViewName("category");
		return model;
	}

	
	@GetMapping("/companyList")
	public ResponseEntity<List<Category>> getCompanyList() {
		return new ResponseEntity<List<Category>>(category_service.getAllCategory(), HttpStatus.OK);
	}
	
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<Void> deleteCompany(@PathVariable int id) {
		category_service.deleteCategory(id);;
		return new ResponseEntity<Void>(HttpStatus.OK);
	}


	/*
	 * @PostMapping("/saveCategory") public ModelAndView
	 * saveUser(@ModelAttribute("category") Category category, ModelMap model) {
	 * ModelAndView mav = null; try { category_service.SaveCategory(category);
	 * List<Category> listCategory = category_service.getAllCategory(); mav = new
	 * ModelAndView("redirect:/cms/category"); mav.addObject("listCategory",
	 * listCategory); } catch (Exception e) { mav = new ModelAndView("login"); }
	 * 
	 * return mav;
	 * 
	 * }
	 */
	@PostMapping("/saveCategory")
	public ModelAndView saveUser(@RequestBody Category category) {
		ModelAndView mav = null;
		try 
		{			
			category_service.SaveCategory(category);			
			mav = new ModelAndView("redirect:/cms/category");
			mav.addObject("ok", "success");
		} catch (Exception e) {
			mav = new ModelAndView("login");
		}
		return mav;
	}
	
	/*
	 * @GetMapping("/CategoryBy/{id}") public Category getUser(@PathVariable long
	 * id) { return category_service.findCategoryById(id); }
	 */
	
	@GetMapping("/CategoryBy/{id}")
	public ResponseEntity<Category> getCategoryBylist(@PathVariable long id) {
		return new ResponseEntity<Category>(category_service.findCategoryById(id), HttpStatus.OK);
	}
	

}
