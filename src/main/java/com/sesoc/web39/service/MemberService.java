package com.sesoc.web39.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sesoc.web39.vo.MemberVO;



@Service
public class MemberService {
	@Autowired
	private com.sesoc.web39.dao.MemberDAO dao;
	
	@Autowired
	private HttpSession session;
	
	public String joinMember(MemberVO member) {
		int cnt=dao.joinMember(member);
		String page ="";
		if (cnt!=0) {
			page="redirect:/";
		}else {
			page="redirect:/member/joinFail";
		}
		return page;
	}
	
	public String login(MemberVO member) {
		MemberVO loginCheck=dao.getMember(member.getMember_id());

		String page= "";
		if (loginCheck!= null && loginCheck.getMember_pw().equals(member.getMember_pw())) {
			session.setAttribute("loginId", loginCheck.getMember_id());
			session.setAttribute("loginName", loginCheck.getMember_name());
			
			page="redirect:/mypage";
		}else {
			page="redirect:/member/loginForm";
		}
		return page;
		
	}
	
}
