package com.sesoc.web39.vo;

import lombok.Data;

@Data
public class NoticeVO {

   private int notice_id;
   private String member_id;
   private String notice_title;
   private String notice_content;
   private String notice_indate;
   private String notice_type;
}