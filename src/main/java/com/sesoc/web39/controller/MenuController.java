package com.sesoc.web39.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MenuController {
	
	
	
	@RequestMapping(value="/menu/member", method=RequestMethod.GET)
	public String memberPage() {
		
		return "/member/memberlist";
	}
	
	
	@RequestMapping(value="/menu/chatbot", method=RequestMethod.GET)
	public String chatbotPage() {
		
		return "/chatbot/chatbot";
	}
	
	
	@RequestMapping(value="/menu/notice", method=RequestMethod.GET)
	public String noticePage() {
		
		return "/notice/notice";
	}
	
	@RequestMapping(value="/menu/jobfairSeoul", method=RequestMethod.GET)
	public String jobfairSeoulPage() {
		
		return "/jobfair/seoulfair";
	}
	
	@RequestMapping(value="/menu/jobfairSpecial", method=RequestMethod.GET)
	public String jobfairSpecialPage() {
		
		return "/jobfair/specialfair";
	}
	
	@RequestMapping(value="/menu/jobfairTokyo", method=RequestMethod.GET)
	public String jobfairTokyoPage() {
		
		return "/jobfair/tokyofair";
	}
	
	
	
}
