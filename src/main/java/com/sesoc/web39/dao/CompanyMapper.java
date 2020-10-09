package com.sesoc.web39.dao;


import java.util.ArrayList;

import com.sesoc.web39.vo.CommentVO;
import com.sesoc.web39.vo.CompanyVO;



public interface CompanyMapper {
	public int addCompany(CompanyVO company);
	public ArrayList<CompanyVO> fetchCompany();
	public CompanyVO selectCompany(int company_no);
	public int updateCompany(CompanyVO company);
	public int deleteCompany(int company_no);
	public int addComment(CommentVO comment);
	public ArrayList<CommentVO> fetchComment(int company_no);
	
}
