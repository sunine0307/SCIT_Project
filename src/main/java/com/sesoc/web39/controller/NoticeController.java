package com.sesoc.web39.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.web39.service.NoticeService;
import com.sesoc.web39.vo.NoticeVO;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {

   private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
   
   @Autowired
   private NoticeService service;

   @RequestMapping(value="/send", method=RequestMethod.POST)
   public String noticeSend(NoticeVO notice) {
      
      logger.info("공지 발송");
      
      String page = service.noticeSend(notice);
      
      return page;
   }
   
   @RequestMapping(value="/noticeList", method=RequestMethod.GET)
   public String noticeList(Model model, HttpSession session) {
      
      
       
      
         ArrayList<NoticeVO> list = service.noticeList();
         System.out.println("컨트롤러입니다.");
         System.out.println(list);
         model.addAttribute("list", list);
         String page = "/notice/noticeList";
         
      
      
      return page;
   }
   
}