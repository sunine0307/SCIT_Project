package com.sesoc.web39.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.web39.service.CompanyService;
import com.sesoc.web39.vo.CommentVO;
import com.sesoc.web39.vo.CompanyVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value="/companyInfo")
public class CompanyController {
	
	@Autowired
	private CompanyService service;
	
	
	@RequestMapping(value="/companyForm", method=RequestMethod.GET)
	public String companyForm() {
		return "/companyInfo/companyForm";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String addCompany(CompanyVO company) {
		String page = service.addCompany(company);
		return page;
	}
	
	@RequestMapping(value="/companylist", method=RequestMethod.GET)
	public String companylist(Model model) {
		ArrayList<CompanyVO> list = service.fetchCompany();

		model.addAttribute("company", list);
		return "/companyInfo/companylist";
	}
	
	@RequestMapping(value="/companySelect", method=RequestMethod.GET)
	public String companySelect(int company_no, Model model) {
		CompanyVO company = service.selectCompany(company_no);
		
		model.addAttribute("company", company);
		return "/companyInfo/companyDetailInfo";
	}
	
	@RequestMapping(value="/updateForm", method=RequestMethod.GET)
	public String updateForm(int company_no, Model model) {
		CompanyVO company = service.selectCompany(company_no);
		
		model.addAttribute("company", company);
		return "/companyInfo/companyUpdateForm";
	}
	
	@RequestMapping(value="/updateCompany", method=RequestMethod.POST)
	public String updateCompany(CompanyVO company) {
		String page = service.updateCompany(company);
		return page;
	}
	@ResponseBody
	@RequestMapping(value="/deleteCompany", method=RequestMethod.GET)
	public String deleteCompany(int company_no) {
		System.out.println("삭제컨트롤러입니다.");
		String page = service.deleteCompany(company_no);
		return page;
	}
	@RequestMapping(value="/addComment", method=RequestMethod.POST)
	public String addComment(CommentVO comment) {
		String page = service.addComment(comment);
		System.out.println("댓글달기");
		System.out.println(comment);
		return page;
	}
		
	@ResponseBody
	@RequestMapping(value="/fetchComment", method=RequestMethod.POST)
	public ArrayList<CommentVO> fetchComment(int company_no) {
		ArrayList<CommentVO> list = service.fetchComment(company_no);
		return list;
	}
}
