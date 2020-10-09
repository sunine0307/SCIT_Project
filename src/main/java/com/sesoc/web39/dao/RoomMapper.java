package com.sesoc.web39.dao;

import java.util.ArrayList;


import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.sesoc.web39.vo.RoomVO;
import com.sesoc.web39.vo.TimeLine;

public interface RoomMapper {
   
   // 개인 예약 list 
   public ArrayList<RoomVO> checkBookOne(HashMap<String, String> map, RowBounds rb);
   
   // 페이징을위한 조회
   public int boardCount(HashMap<String, Object> map);
   
   //퇴실시간 업데이트
   public int updateEndTm2(int seat_aloc_sq);
   
   //퇴실시간 검색
   public RoomVO endTm(int seat_aloc_sq);
   
   //퇴실안한 리스트만 검색
   public RoomVO oneList(HashMap<String, String> map);
   
   //스터디룸목록
   public ArrayList<RoomVO> listSeat();
   
   //예약화면에서 룸별 시간보여주기
   public ArrayList<TimeLine> selectTime(int seat_sq);
   
   // 스터디룸 예약
   public int seatBook(RoomVO vo);
   
   // 타임라인 업데이트
   public int updateTimeLine(HashMap<String, Object> map);
   
   // 예약 중복체크
   public ArrayList<RoomVO> check(String member_id);
   
   // 퇴실버튼눌렀을 때 타임라인 업데이트
   public int timeLineCheck(HashMap<String, Object> map);
   
   // 스터디룸 예약취소하기
   public int roomDel(RoomVO vo);
   
   // 스터디룸 예약변경
   public int updateBook(RoomVO vo);
   

}