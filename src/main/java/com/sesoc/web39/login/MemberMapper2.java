package com.sesoc.web39.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.sesoc.web39.vo.MemberVO2;

public interface MemberMapper2 {
   //public int joinMember2(MemberVO2 member);
   
   // 1018 회원가입
   public int joinMember2(MemberVO2 member);
   
   // 1018  카카오로 회원가입여부체크
   public MemberVO2 joinKakaoCheck(String member_id);
   
   // 1018 mypage에 보여줄 정보
   public MemberVO2 oneMemeber(String member_id);
   
   //1021 회원정보 수정
   public int updateMember(MemberVO2 member);
   
   //1022 회원정보 삭제
   public int deleteMemberInfo(MemberVO2 member);
   
   // 일반회원 로그인 위한 검색
   public MemberVO2 getMember2(String member_id);    
   
   
   public List<MemberVO2> getMember2() throws Exception;
   
   public ArrayList<MemberVO2> fetchMember2();
   
}