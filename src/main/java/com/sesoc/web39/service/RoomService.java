package com.sesoc.web39.service;

import java.util.ArrayList;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sesoc.web39.vo.RoomVO;
import com.sesoc.web39.vo.TimeLine;
import com.sesoc.web39.dao.RoomDAO;


@Service
public class RoomService {

   @Autowired
   private RoomDAO dao;
   
   @Autowired
   private HttpSession session;
   
   // 개인예약 list
   public ArrayList<RoomVO> checkBookOne(int startRecord, int countPerPage){
      String member_id = (String)session.getAttribute("loginId");
      HashMap<String, String> map = new HashMap<String,String>();
      map.put("member_id", member_id);
      
      System.out.println("map에 들어있는 값 : " + map.get("member_id"));
      
      ArrayList<RoomVO> list = dao.checkBookOne(map,startRecord,countPerPage);
      return list;
   }
   
   // 페이징을 위한 검색
   public int boardCount() {
      String member_id = (String)session.getAttribute("loginId");
      HashMap<String, Object> map = new HashMap<String,Object>();
      map.put("member_id", member_id);
      
      int count = dao.boardCount(map);   // memberid 전달해서 본인 예약수만 조회
      return count;
   }
   
   
   
   // 퇴실시간 업데이트
   public int updateEndTm2(int seat_aloc_sq) {
      int cnt = dao.updateEndTm2(seat_aloc_sq);
      return cnt;
   }
   
   // 퇴실시간 검색
   public RoomVO endTm(int seat_aloc_sq) {
      RoomVO result = dao.endTm(seat_aloc_sq);
      return result;
   }
   
   // 퇴실안한것만 검색
   public RoomVO oneList() {
      String member_id = (String)session.getAttribute("loginId");
      System.out.println("service member_id : " + member_id);
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("member_id",member_id );
      
      RoomVO result = dao.oneList(map);
      return result;
   }
   
   // 스터디룸 목록
   public ArrayList<RoomVO> listSeat() {
      ArrayList<RoomVO> result = dao.listSeat();
      return result;
   }
   
   // 예약화면에서 룸별시간 보여주기
   public ArrayList<TimeLine> selectTime(int seat_sq){
      ArrayList<TimeLine> result = dao.selectTime(seat_sq);
      return result;
   }
   
   // 스터디룸 예약하기
   public String seatBook(RoomVO vo) {
      String member_id = (String)session.getAttribute("loginId");
      vo.setMember_id(member_id);
      
      int cnt = dao.seatBook(vo);
      
      String page = "";
      if(cnt == 0) {
         page = "redirect:/roomBook/moveBook"; // 예약실패시 예약화면
      }else {
         page = "redirect:/roomBook/roomCheck"; // 예약성공시 목록화면으로 이동
      }
      
      return page;
   }
   
   // 타임라인 업데이트 1로
   public void updateTimeLine(RoomVO vo) {
      
      int seat_sq = vo.getSeat_sq();
      String timeLine = vo.getSeat_aloc_strt_tm();
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("seat_sq", seat_sq);
      map.put("timeLine", timeLine);
      
      int cnt = dao.updateTimeLine(map);
      System.out.println("1로 업데이트 성공 : " + cnt);
   }
   
   // 예약중복체크
   public ArrayList<RoomVO> check(String member_id){
      ArrayList<RoomVO> list = dao.check(member_id);
      return list;
   }
   
   // 퇴실버튼눌렀을 때 타임라인 업데이트 0으로
   public void timeLineCheck(int seat_sq, String timeLine) {
      System.out.println("service 타임라인 0으로 업데이트 : " + seat_sq +","+ timeLine);
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("seat_sq", seat_sq);
      map.put("timeLine", timeLine);
            
      int cnt = dao.timeLineCheck(map);
      System.out.println("0으로 업데이트 성공 : " + cnt);
   }
   
   // 스터디룸 예약취소하기
   public int roomDel(RoomVO vo) {
      
      String member_id = (String)session.getAttribute("loginId");
      vo.setMember_id(member_id);
      
      int result = dao.roomDel(vo); 
      
      return result;
   }
   
   // 스터디룸 예약변경
   public int updateBook(RoomVO vo) {
      String member_id = (String)session.getAttribute("loginId");
      vo.setMember_id(member_id);
      
      int result = dao.updateBook(vo);
      
      return result;
   }
   
}