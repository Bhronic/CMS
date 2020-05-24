package com.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.cms.entity.Category;
import com.cms.entity.Item;
import com.cms.service.ItemService;

@Controller
public class ItemController {

	@Autowired 
	ItemService item_service;
	@PostMapping("/saveItem")
	public ModelAndView saveUser(@RequestBody Item item) {
		ModelAndView mav = null;
		try 
		{     
			
			item_service.SaveItem(item);			
			/*
			 * mav = new ModelAndView("redirect:/cms/category"); mav.addObject("ok",
			 * "success");
			 */
		} catch (Exception e) {
			mav = new ModelAndView("login");
		}
		return mav;
	}
}
