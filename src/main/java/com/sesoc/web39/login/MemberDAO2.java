package com.sesoc.web39.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.web39.vo.MemberVO2;


@Repository
public class MemberDAO2 {
   @Autowired
   private SqlSession session;
   

      public int joinMember2(MemberVO2 member) {
         MemberMapper2 mapper =session.getMapper(MemberMapper2.class);
         int cnt = 0;
         try {
            cnt = mapper.joinMember2(member);
         }catch(Exception e) {
            e.printStackTrace();
         }
         return cnt;
      }
   
   
   // 1018  카카오로 회원가입여부체크
      public MemberVO2 joinKakaoCheck(String member_id) {
         MemberMapper2 mapper =session.getMapper(MemberMapper2.class);
         MemberVO2 member = null;
         try {
            member = mapper.joinKakaoCheck(member_id);
         }catch(Exception e) {
            e.printStackTrace();
         }
         return member;   
      }
      
      
   // 1018 mypage에 보여줄 정보
      public MemberVO2 oneMemeber(String member_id) {
         MemberMapper2 mapper =session.getMapper(MemberMapper2.class);
         MemberVO2 member = null;
         try {
            member = mapper.oneMemeber(member_id);
         }catch(Exception e) {
            e.printStackTrace();
         }
         return member;
      }
      
   // 1021 회원정보 수정
      public int updateMember(MemberVO2 member) {
          MemberMapper2 mapper =session.getMapper(MemberMapper2.class);
          int cnt = 0;
          try {
             cnt = mapper.updateMember(member);
          }catch(Exception e) {
             e.printStackTrace();
          }
          return cnt;
      }
      
    //1022 회원정보 삭제
      public int deleteMemberInfo(MemberVO2 member) {
         MemberMapper2 mapper =session.getMapper(MemberMapper2.class);
          int cnt = 0;
          try {
             cnt = mapper.deleteMemberInfo(member);
          }catch(Exception e) {
             e.printStackTrace();
          }
          return cnt;
         
      }
  

   // 일반회원 로그인 위한 검색
   public MemberVO2 getMember2(String member_id) {
      MemberMapper2 mapper =session.getMapper(MemberMapper2.class);
      MemberVO2 member = null;
      try {
         member=mapper.getMember2(member_id);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return member;
   }
   
   private static final String namespace="com.sesoc.web39.login.MemberMapper2";
   
   public List<MemberVO2> getMember2() throws Exception{

      // TODO Auto-generated method stub

      return session.selectList(namespace+".getMember2");

   }
   
   public ArrayList<MemberVO2> fetchMember2(){
	      MemberMapper2 mapper =session.getMapper(MemberMapper2.class);
	      ArrayList<MemberVO2> list = null;
	      try {
			list=mapper.fetchMember2();
		} catch (Exception e) {
			e.printStackTrace();
		}
	      return list;

	   
   }

   
}