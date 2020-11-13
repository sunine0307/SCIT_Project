package com.sesoc.web39.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sesoc.web39.login.MemberDAO2;
import com.sesoc.web39.login.MemberMapper2;
import com.sesoc.web39.vo.MemberVO2;



@Service
public class MemberService2 {
   @Autowired
   private com.sesoc.web39.login.MemberDAO2 dao;
   
   @Autowired
   private HttpSession session;
   
//   public String joinMember2(MemberVO2 member) {
//      int cnt=dao.joinMember2(member);
//      String page ="";
//      if (cnt!=0) {
//         page="redirect:/";
//      }else {
//         page="redirect:/member2/joinFail";
//      }
//      return page;
//   }
   
   // 1018 회원가입
   public String joinMember2(MemberVO2 member) {
      int cnt = dao.joinMember2(member);
      
      String page = null;
      if(cnt == 0) {
         page = "redirect:/member2/joinForm"; // 회원가입 실패 시 회원가입폼으로 이동
      }else {
         
         page = "redirect:/";   // 회원가입 성공시 마이페이지로 이동
      }
      return page;
   }
   
   
   // 1018  카카오로 회원가입여부체크
   public String joinKakaoCheck() {
      String member_id = (String)session.getAttribute("kakao_id");
      
      MemberVO2 member = dao.joinKakaoCheck(member_id);
      
      System.out.println("service2 카카오 id검색 "+ member);
      
      String page = null;
      
      if(member == null) {
         page = "redirect:/member2/joinForm";   // db에 저장된 id가 없을 때 회원가입폼으로 이동
      }else {
         page = "redirect:/member2/mypage";   // db에 저장된 id가 있을 때 mypage로 이동
      }
      return page;
   }
   
   
   // 1018 mypage에 보여줄 정보
   public MemberVO2 oneMemeber() {
      
      String kakao_id = (String)session.getAttribute("kakao_id");   // kakao_id
      String member_id = (String)session.getAttribute("loginId");   // 일반회원가입
      System.out.println("kakao_id at service oneMember(): " + kakao_id);
      System.out.println("member_id at service oneMember(): " + member_id);
      MemberVO2 member = null;
      
      if(kakao_id != null) {
         member = dao.oneMemeber(kakao_id);   // kakao_id로 로그인 했을 때 이 아이디로 정보검색
      }else {
         member = dao.oneMemeber(member_id);   // 일반 회원 로그인 일 때 이 아이디로 정보검색
      }
      return member;
   }
   
   // 1021 회원정보수정
   public String updateMember(MemberVO2 member) {
      
      int cnt = dao.updateMember(member);
      
      String page = null;
      if(cnt == 0) {
         page= "redirect:/member2/updateMember";
      }else {
         page= "redirect:/member2/mypage";
      }
      return page;
   }
   
   
 //1022 회원정보 삭제
   public String deleteMemberInfo(MemberVO2 member) {
       
      int cnt = dao.deleteMemberInfo(member); 
      String page = null;
      String kakao_id = (String)session.getAttribute("kakao_id");   // kakao_id
      
      if(cnt == 1) {
            if(kakao_id != null) {               
               session.removeAttribute("kakao_id");   // kakao 로그아웃
            }else {
               session.removeAttribute("loginId");      // 일반회원 로그아웃
            }
         page = "redirect:/member2/loginForm"; // 회원정보가 삭제되면 로그인화면으로 이동 
      }else {
         page = "redirect:/member2/mypage"; // 삭제실패시 mypage로 이동
      }
      
      return page;
   }
   
         
         
   // 일반회원 로그인 위한 검색
   public String login2(MemberVO2 member) {
      MemberVO2 loginCheck=dao.getMember2(member.getMember_id());

      String page= "";
      if (loginCheck!= null && loginCheck.getMember_pw().equals(member.getMember_pw())) {
         session.setAttribute("loginId", loginCheck.getMember_id());
         //session.setAttribute("loginName", loginCheck.getMember_name());
         
         page="redirect:/member2/mypage";
      }else {
         page="redirect:/member2/loginForm";
      }
      return page;
      
   }

   // 사용x
   public MemberVO2 getMember2(String member_id) {

      MemberVO2 member = dao.getMember2(member_id);

      return member;
   }
   
   public ArrayList<MemberVO2> fetchMember2(){
	   ArrayList<MemberVO2> list = dao.fetchMember2();
	   return list;
   }
   
}