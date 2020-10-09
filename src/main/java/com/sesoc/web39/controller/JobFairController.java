package com.sesoc.web39.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.web39.service.JobFairService;
import com.sesoc.web39.vo.JobFairVO;

@Controller
@RequestMapping(value="/jobFair")
public class JobFairController {
   
   @Autowired
   private JobFairService service;
   
   // 잡페어 등록 페이지 이동
   @RequestMapping(value="/jobfairAddForm", method = RequestMethod.GET)
   private String jobFairAddForm() {
      
      return "jobfair/jobfairAddForm";
   }
   
   // 잡페어 등록
   @RequestMapping(value="/addJobFair", method = RequestMethod.POST)
   private String jobFairAddForm(JobFairVO vo) {
      System.out.println("등록하는 컨트롤러입니다.");
      System.out.println(vo);
      String page = service.addJobFair(vo);
      
      return page;
   }
   
   @RequestMapping(value="/jobfairSeoul", method=RequestMethod.GET)
   public String jobfairSeoulPage(Model model) {
      System.out.println("서울페어");
      // 서울페어 기업리스트 
      ArrayList<JobFairVO> seoulList = service.selectSeoulList();
      model.addAttribute("seoulList", seoulList);
      System.out.println(seoulList);
      return "/jobfair/seoulfair";
   }
   
   @RequestMapping(value="/jobfairSpecial", method=RequestMethod.GET)
   public String jobfairSpecialPage(Model model) {
      System.out.println("스페셜페어");
      // 스페셜페어 기업리스트
      ArrayList<JobFairVO> specialList = service.selectSpecialList();
      model.addAttribute("specialList", specialList);
      System.out.println(specialList);
      return "/jobfair/specialfair";
   }
   
   @RequestMapping(value="/jobfairTokyo", method=RequestMethod.GET)
   public String jobfairTokyoPage(Model model) {
      System.out.println("도쿄페어 ");
      // 도쿄페어 기업리스트
      ArrayList<JobFairVO> tokyoList = service.selectokyoList();
      model.addAttribute("tokyoList", tokyoList);
      System.out.println(tokyoList);
      return "/jobfair/tokyofair";
   }
   
   
// 수정 , 삭제폼 이동
   @RequestMapping(value="/editfair", method=RequestMethod.GET)
   public String EditFair(int jobfair_no, Model model) {
      System.out.println(jobfair_no);
      System.out.println("잡페엉");
      // 기업 하나 검색 후 보여주기
      JobFairVO listOne = service.oneListFair(jobfair_no);
      model.addAttribute("listOne", listOne);
      
      return "/jobfair/editfair";
   }
   
   // 페어 기업정보 수정
   @RequestMapping(value="/updateJobFair", method=RequestMethod.POST)
   public String updateFair(JobFairVO vo) {
      
      String page = service.updateFair(vo);
      
      return page;
   }
   
   // 페어 삭제
   
   
   @ResponseBody
   @RequestMapping(value="/deleteFair", method=RequestMethod.GET)
   public int deleteFair(int jobfair_no) {
      
      int result = service.deleteFair(jobfair_no);
      
      return result;
   }
}