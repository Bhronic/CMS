package com.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cms.entity.User;
import com.cms.service.UserService;

@Controller
@RequestMapping("/cms")
public class UserController {

	@Autowired
	UserService user_service;
	
	@GetMapping("/login")
	public ModelAndView registerView() {
		return new ModelAndView("login");
	}
	
	@GetMapping("/signup")
	public ModelAndView loginview() {
		return new ModelAndView("signup");
	}

	@GetMapping("/save")
	public ModelAndView saveUser(@ModelAttribute("user") User user,ModelMap model) {
		ModelAndView mav = null;
		try {
			
			user_service.SaveUser(user);
			mav = new ModelAndView("login");
		} catch (Exception e) {
			mav = new ModelAndView("login");
		}

		return mav;

	}
	@PostMapping("/signin")
	public ModelAndView login(@ModelAttribute("user") User user)
	{
		 ModelAndView mav = null;
		if (user_service.findByEmailAndPassword(user.getEmail(),user.getPassword()) != null) 
		{
			System.out.println("Here login");
			mav = new ModelAndView("home");
		}
		else {
			mav = new ModelAndView("login");
			mav.addObject("message", "Username or Password is wrong!!");
		}

		return mav;

	}

}
