package com.sesoc.web39.dao;

import java.util.ArrayList;



import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.web39.vo.RoomVO;
import com.sesoc.web39.vo.TimeLine;

@Repository
public class RoomDAO {

   @Autowired
   private SqlSession session;
   
   // 개인예약목록 list
   public ArrayList<RoomVO> checkBookOne(HashMap<String, String> map, int startRecord, int countPerPage){
      RoomMapper mapper = session.getMapper(RoomMapper.class);
      ArrayList<RoomVO> result = null;
      
      // 페이징 처리에 사용할 객체
      //:쿼리를고치지않아도 페이지를 고치기위해 마이바티스에서 제공해주는기능
      RowBounds rb = new RowBounds(startRecord, countPerPage);
      
      try {
         result = mapper.checkBookOne(map,rb);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return result;
   }
   
   //페이징을 위한 검색
   public int boardCount(HashMap<String, Object> map) {
      RoomMapper mapper = session.getMapper(RoomMapper.class);
      int cnt = 0;
      try {
         cnt = mapper.boardCount(map);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return cnt;
   }
   
   
   //퇴실시간 업데이트
   public int updateEndTm2(int seat_aloc_sq) {
      RoomMapper mapper = session.getMapper(RoomMapper.class);
      int cnt = 0;
      try {
         cnt = mapper.updateEndTm2(seat_aloc_sq);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return cnt;
   }
   
   //퇴실시간 검색
   public RoomVO endTm(int seat_aloc_sq) {
      RoomMapper mapper = session.getMapper(RoomMapper.class);
      RoomVO result = null;
      try {
         result = mapper.endTm(seat_aloc_sq);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return result;
   }
   
   // 퇴실안한것만 보여주기
   public RoomVO oneList(HashMap<String, String> map) {
      RoomMapper mapper = session.getMapper(RoomMapper.class);
      RoomVO result = null;
      try {
         result = mapper.oneList(map);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return result;
   }
   
   //스터디룸 목록
   public ArrayList<RoomVO> listSeat() {
      RoomMapper mapper = session.getMapper(RoomMapper.class);
      ArrayList<RoomVO> result = null;
      try {
         result = mapper.listSeat();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return result;
   }
   
   //예약화면에서 룸별 시간 보여주기
   public ArrayList<TimeLine> selectTime(int seat_sq){
      RoomMapper mapper = session.getMapper(RoomMapper.class);
      ArrayList<TimeLine> result = null;
      try {
         result = mapper.selectTime(seat_sq);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return result;
   }
   
   // 스터디룸 예약
      public int seatBook(RoomVO vo) {
         RoomMapper mapper = session.getMapper(RoomMapper.class);
         int cnt = 0;
         try {
            cnt = mapper.seatBook(vo);
         }catch(Exception e) {
            e.printStackTrace();
         }
         return cnt;
      }
      
   // 타임라인 업데이트
      public int updateTimeLine(HashMap<String, Object> map) {
         RoomMapper mapper = session.getMapper(RoomMapper.class);
         int cnt = 0;
         try {
            cnt = mapper.updateTimeLine(map);
         }catch(Exception e) {
            e.printStackTrace();
         }
         return cnt;
      }
   
   // 예약중복체크
      public ArrayList<RoomVO> check(String member_id){
         RoomMapper mapper = session.getMapper(RoomMapper.class);
         ArrayList<RoomVO> result = null;
         try {
            result = mapper.check(member_id);
         }catch(Exception e) {
            e.printStackTrace();
         }
         return result;
      }
      
   // 퇴실버튼눌렀을 때 타임라인 업데이트
      public int timeLineCheck(HashMap<String, Object> map) {
         RoomMapper mapper = session.getMapper(RoomMapper.class);
         int cnt = 0;
         try {
            cnt = mapper.timeLineCheck(map);
         }catch(Exception e) {
            e.printStackTrace();
         }
         return cnt;
      }
      
   // 스터디룸 예약취소하기
      public int roomDel(RoomVO vo) {
         RoomMapper mapper = session.getMapper(RoomMapper.class);
         int cnt = 0;
         try {
            cnt = mapper.roomDel(vo);
         }catch(Exception e) {
            e.printStackTrace();
         }
         return cnt;
      }
      
   // 스터디룸 예약변경
      public int updateBook(RoomVO vo) {
         RoomMapper mapper = session.getMapper(RoomMapper.class);
         int cnt = 0;
         try {
            cnt = mapper.updateBook(vo);
         }catch(Exception e) {
            e.printStackTrace();
         }
         return cnt;
      }
   
}