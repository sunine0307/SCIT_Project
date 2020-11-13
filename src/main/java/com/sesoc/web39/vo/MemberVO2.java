package com.sesoc.web39.vo;

import lombok.Data;

@Data
public class MemberVO2 {
   private int member_no;
   private String member_id;
   private String member_pw;
   private String member_name;
   private String member_email;
   private String member_mobile;
   private String member_sc_it;
   private String member_sc_j;
   private String member_company;
   private String member_position;
   private String member_course;
   private String originalfile;   // 오리지널파일명
   private String savedfile;   // 저장파일명
}