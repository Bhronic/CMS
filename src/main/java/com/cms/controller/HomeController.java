package com.cms.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/cms")
@RestController
public class HomeController {
	
	
	@GetMapping("/signup")
	public ModelAndView loginview() {
		return new ModelAndView("signup");
	}
	
	@GetMapping("/login")
	public ModelAndView registerView() {
		return new ModelAndView("index");
	}

}
