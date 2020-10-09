package com.sesoc.web39.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.web39.service.MemberService;
import com.sesoc.web39.vo.MemberVO;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String joinForm() {
		
		return "tempMember/joinForm";
	}
	
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		
		return "tempMember/loginForm";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(MemberVO member) {
		String page=service.joinMember(member);
		return page;
	}
	@RequestMapping(value="/joinFail", method=RequestMethod.GET)
	public String joinFail() {
		return "tempMember/joinFail";
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(MemberVO member) {
		String page =service.login(member);
		return page;
	}
	
	
}
