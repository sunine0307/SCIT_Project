package com.sesoc.web39.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.web39.vo.CommentVO;
import com.sesoc.web39.vo.CompanyVO;





@Repository
public class CompanyDAO {
	
	@Autowired
	private SqlSession session;
	
	public int addCompany(CompanyVO company) {
		CompanyMapper mapper = session.getMapper(CompanyMapper.class);
		int cnt=0;
		try {
			cnt=mapper.addCompany(company);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	public ArrayList<CompanyVO> fetchCompany() {
		CompanyMapper mapper = session.getMapper(CompanyMapper.class);
		ArrayList<CompanyVO> list = null;
		try {
			list=mapper.fetchCompany();
			System.out.println("fetch다오입니다.");
			System.out.println(list);
					} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public CompanyVO selectCompany(int company_no) {
		CompanyMapper mapper = session.getMapper(CompanyMapper.class);
		CompanyVO company = null;
		try {
			company=mapper.selectCompany(company_no);
			
					} catch (Exception e) {
			e.printStackTrace();
		}
		return company;
	}
	
	public int updateCompany(CompanyVO company) {
		CompanyMapper mapper = session.getMapper(CompanyMapper.class);
		int cnt=0;
		try {
			System.out.println("updateDAO입니다.");
			System.out.println(company);
			cnt=mapper.updateCompany(company);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int deleteCompany(int company_no) {
		CompanyMapper mapper = session.getMapper(CompanyMapper.class);
		int cnt=0;
		try {
			
			cnt=mapper.deleteCompany(company_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int addComment(CommentVO comment) {
		CompanyMapper mapper = session.getMapper(CompanyMapper.class);
		int cnt=0;
		try {
			cnt=mapper.addComment(comment);
			System.out.println("다오 입니다");
			System.out.println(comment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public ArrayList<CommentVO> fetchComment(int company_no) {
		CompanyMapper mapper = session.getMapper(CompanyMapper.class);
		ArrayList<CommentVO> list = null;
		try {
			list=mapper.fetchComment(company_no);
			System.out.println("댓글을 가져오는 다오입니다.");
			System.out.println(list);
					} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}


