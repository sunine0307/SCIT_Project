package com.sesoc.web39.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sesoc.web39.dao.NoticeDAO;
import com.sesoc.web39.vo.NoticeVO;

@Service
public class NoticeService {

   @Autowired
   private NoticeDAO dao;
   @Autowired
   private HttpSession session;
   
   public String noticeSend(NoticeVO notice) {
      String member_id = (String)session.getAttribute("loginId");
      
      notice.setMember_id(member_id);
      dao.noticeSend(notice);
      String page="redirect:/notice/noticeList";
      return page;
   }
   
   public ArrayList<NoticeVO> noticeList() {
      ArrayList<NoticeVO> list = dao.noticeList();
      	System.out.println("서비스 입니다.");
      	System.out.println(list);
      return list;
   }
}