package com.sesoc.web39.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sesoc.web39.dao.JobFairDAO;
import com.sesoc.web39.dao.JobFairMapper;
import com.sesoc.web39.vo.JobFairVO;

@Service
public class JobFairService {
   
   @Autowired
   private JobFairDAO dao;
   
   @Autowired
   private HttpSession session;
   
   
   //잡페어 등록
   public String addJobFair(JobFairVO vo) {
      
      
      String member_id = (String)session.getAttribute("loginId");
      vo.setMember_id(member_id);   // member_id (관리자 아이디)
      dao.addJobFair(vo); 
      
      String jobfair_type = vo.getJobfair_type();
      String seoul = "seoul";
      String tokyo = "tokyo";
      String special = "special";
      
      String page = null;
      if(seoul.equals(jobfair_type)) {
         page = "redirect:/jobFair/jobfairSeoul";   // 서울페어 선택 시 서울페어 페이지로 이동
      }else if(tokyo.equals(jobfair_type)) {
         page = "redirect:/jobFair/jobfairTokyo";   // 도쿄페어 선택 시 도쿄페어 페이지로 이동
      }else if(special.equals(jobfair_type)) {
         page = "redirect:/jobFair/jobfairSpecial";   // 스페셜페어선택 시 스페셜페어 페이지로 이동
      }
      
      return page;
   }
   
   // 서울페어 리스트
   public ArrayList<JobFairVO> selectSeoulList() {
      
      ArrayList<JobFairVO> result = dao.selectSeoulList();
      return result;
   }
   
   // 도쿄페어 리스트
   public ArrayList<JobFairVO> selectokyoList() {
      
      ArrayList<JobFairVO> result = dao.selectokyoList();
      return result;
   }
   
   // 스페셜페어 리스트
   public ArrayList<JobFairVO> selectSpecialList(){
      
      ArrayList<JobFairVO> result = dao.selectSpecialList();
      return result;
   }
   
// 잡페어 목록 하나
   public JobFairVO oneListFair(int jobfair_no) {
      
      JobFairVO result = dao.oneListFair(jobfair_no);
      return result;
   }
   
   // 잡페어 기업정보 수정
   public String updateFair(JobFairVO vo) {
      dao.updateFair(vo);   // 업데이트 후 결과
      
      String jobfair_type = vo.getJobfair_type();
      String seoul = "seoul";
      String tokyo = "tokyo";
      String special = "special";
      
      String page = null;
      if(seoul.equals(jobfair_type)) {
            page = "redirect:/jobFair/jobfairSeoul";   // 서울페어 선택 시 서울페어 페이지로 이동
         }else if(tokyo.equals(jobfair_type)) {
            page = "redirect:/jobFair/jobfairTokyo";   // 도쿄페어 선택 시 도쿄페어 페이지로 이동
         }else if(special.equals(jobfair_type)) {
            page = "redirect:/jobFair/jobfairSpecial";   // 스페셜페어선택 시 스페셜페어 페이지로 이동
         }
         
         return page;
   }
   
   // 잡페어 삭제
   public int deleteFair(int jobfair_no) {
      int result = dao.deleteFair(jobfair_no);
     
      return result;
   }
   

}