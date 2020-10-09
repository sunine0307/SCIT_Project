package com.sesoc.web39.dao;

import java.util.ArrayList;

import com.sesoc.web39.vo.NoticeVO;

public interface NoticeMapper {

   public int noticeSend(NoticeVO notice);
   public ArrayList<NoticeVO> noticeList();
   
}