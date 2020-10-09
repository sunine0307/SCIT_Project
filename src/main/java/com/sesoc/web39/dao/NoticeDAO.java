package com.sesoc.web39.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.web39.vo.NoticeVO;

@Repository
public class NoticeDAO {

   @Autowired
   private SqlSession session;
   
   public int noticeSend(NoticeVO notice) {
      NoticeMapper mapper = session.getMapper(NoticeMapper.class);
      int cnt = 0;
      
      try {
         cnt = mapper.noticeSend(notice);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return cnt;
   }
   
   public ArrayList<NoticeVO> noticeList() {
      NoticeMapper mapper = session.getMapper(NoticeMapper.class);
      ArrayList<NoticeVO> list = null;
      
      try {
    	  System.out.println("다오입니다.");
    	  System.out.println(list);
         list = mapper.noticeList();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return list;
   }
}