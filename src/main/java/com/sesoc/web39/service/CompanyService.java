package com.sesoc.web39.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sesoc.web39.dao.CompanyDAO;
import com.sesoc.web39.vo.CommentVO;
import com.sesoc.web39.vo.CompanyVO;




@Service
public class CompanyService {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private CompanyDAO dao;
	
	public String addCompany(CompanyVO company) {
		String member_id = (String)session.getAttribute("loginId");
		System.out.println(member_id);
		company.setMember_id(member_id);
		dao.addCompany(company);
	
		String page = "redirect:/companyInfo/companylist";
		
		return page;
	}
	
	public ArrayList<CompanyVO> fetchCompany(){
		ArrayList<CompanyVO> list = dao.fetchCompany();
		System.out.println("서비스입니다.");
		System.out.println(list);
		return list;
	}
	
	public CompanyVO selectCompany(int company_no){
		CompanyVO company= dao.selectCompany(company_no);
		
		return company;
	}
	
	public String updateCompany(CompanyVO company) {
		dao.updateCompany(company);
		int company_no=company.getCompany_no();
        String str = Integer.toString(company_no);

		String page = "redirect:/companyInfo/companySelect?company_no="+str;
		
		return page;
	}
	
	public String deleteCompany(int company_no){
		int cnt = dao.deleteCompany(company_no);
		String result= null;
		if (cnt==1) {
			result="1";
		}
		else {
			result="0";
		}
		return result;
	}
	
	public String addComment(CommentVO comment) {
		String member_id = (String)session.getAttribute("loginId");
		System.out.println(member_id);
		comment.setMember_id(member_id);
		int cnt = dao.addComment(comment);
		int company_no=comment.getCompany_no();
		String str = Integer.toString(company_no);
		System.out.println("company_no");
		System.out.println(company_no);
		String page = "redirect:/companyInfo/companySelect?company_no="+str;
		
		return page;
	}
	
	public ArrayList<CommentVO> fetchComment(int company_no){
		ArrayList<CommentVO> list = dao.fetchComment(company_no);
		System.out.println("서비스입니다.");
		System.out.println(list);
		return list;
	}
	
}
