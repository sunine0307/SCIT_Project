package com.sesoc.web39.controller;

import java.util.ArrayList;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.web39.service.RoomService;
import com.sesoc.web39.vo.RoomVO;
import com.sesoc.web39.vo.TimeLine;
import com.sesoc.web39.util.PageNavigator;

@Controller
@RequestMapping(value="/roomBook")
public class RoomController {
   
   private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
   
   @Autowired
   private RoomService service;
   
   private final int COUNTPERPAGE = 10; // 한번에 보여줄 예약리스트 수
   private final int PAGEPERGROUP = 5; // 한 페이당 그룹수

   // 개인 예약목록 list 페이지
   @RequestMapping(value="/roomCheck", method=RequestMethod.GET)
   public String checkBook(
         Model model,
         @RequestParam(value="page", defaultValue = "1") int page) {
      
      
      //퇴실안한 것만 보여주기
      RoomVO list = service.oneList();
      model.addAttribute("listOne", list);
      
      // 스터디룸 목록 -- 수정 modal에 보여줄 것
      ArrayList<RoomVO> roomList = service.listSeat();   
      model.addAttribute("upList", roomList);
      
      // 페이징을 위한 예약수 조회
      int count = service.boardCount();
      
      // pageNavigater 객체생성
      PageNavigator navi = new PageNavigator(COUNTPERPAGE, PAGEPERGROUP, page, count);
      
      //개인 예약 전체목록
      ArrayList<RoomVO> list2 = service.checkBookOne(navi.getStartRecord(), navi.getCountPerPage());
      model.addAttribute("seatList2", list2);
      
      model.addAttribute("navi", navi); // 페이징을 위해 모델에 넣어주기
      
      return "studyroom/checkReservationList";
   }
   
   
   
   // 퇴실시간 업데이트 , 퇴실시간 검색해서 추가하기
      @ResponseBody
      @RequestMapping(value="/roomEnd2", method=RequestMethod.POST)
      public String roomEnd2(RoomVO vo) {
         
         logger.info("전달받은 폼 데이터 : {}", vo.getSeat_aloc_sq());
         logger.info("전달받은 폼 데이터: {}", vo.getSeat_sq());
         logger.info("전달받은 폼 데이터 : {}", vo.getSeat_aloc_strt_tm());
         
         int seat_aloc_sq = vo.getSeat_aloc_sq();
         
         int seat_sq = vo.getSeat_sq(); // 퇴실하고 타임라인 0으로 업데이트
         String timeLine = vo.getSeat_aloc_strt_tm(); // 퇴실하고 타임라인 0으로 업데이트
               
         service.updateEndTm2(seat_aloc_sq); // 퇴실시간 업데이트
         
         service.timeLineCheck(seat_sq, timeLine); // 타임라인 0으로 업데이트
         
         RoomVO result = service.endTm(seat_aloc_sq); // 퇴실시간 검색
         String seat_aloc_end_tm = result.getSeat_aloc_end_tm();
         return seat_aloc_end_tm;
      }
   
      
   // 예약 업데이트
   @ResponseBody
   @RequestMapping(value="/updateBook", method=RequestMethod.POST)
   public String updateBook(int seat_aloc_sq, int seat_sq, String seat_aloc_strt_tm, 
                        String be_seat_aloc_strt_tm, int be_seat_sq) {
      
      System.out.println("업데이트할 예약 시퀀스번호: " + seat_aloc_sq);
      System.out.println("이전예약 시간 : " + be_seat_aloc_strt_tm );
      System.out.println("이전예약 룸번호 : " + be_seat_sq );
      System.out.println("새로예약할 룸번호 : " + seat_sq );
      System.out.println("새로예약할 시간 : " + seat_aloc_strt_tm );
      
      // 예약테이블 업데이트
      RoomVO vo2 = new RoomVO();
      vo2.setSeat_aloc_sq(seat_aloc_sq);
      vo2.setSeat_sq(seat_sq);
      vo2.setSeat_aloc_strt_tm(seat_aloc_strt_tm);
      
      int cnt = service.updateBook(vo2);
      
      
      String result = null;
      if(cnt == 1) {
         result = "1";   // 업데이트 성공
      }else {
         result = "0"; // 업데이트 실패
      }
      
            // 타임라인 0으로 업데이트 -> 이전 예약                  // 확인해보기 이전예약이 1에서 0으로 바뀌어있는지! ->확인
            String timeLine = be_seat_aloc_strt_tm;
            service.timeLineCheck(be_seat_sq, timeLine); 
            
            // 타임라인 1로 업데이트 -> 새로 예약
            RoomVO vo = new RoomVO();
            vo.setSeat_sq(seat_sq);
            vo.setSeat_aloc_strt_tm(seat_aloc_strt_tm);
            service.updateTimeLine(vo);
      
      return result;
   }
   
   // 스터디룸 예약 페이지
   @RequestMapping(value="/moveBook", method=RequestMethod.GET)
   public String roomBook(Model model) {
      
      ArrayList<RoomVO> roomList = service.listSeat();   // 스터디룸 목록
      model.addAttribute("roomList", roomList);
      
      return "studyroom/roomReservation";
   }


   //스터디룸별로 시간 검색하기
   // produces = "application/text;charset=utf-8" : text로 보내서 json으로 받으면 406에러 발생 text부분을 json으로 쓰던지 , 사용안하던지해야함!
   @ResponseBody
   @RequestMapping(value="/selectTime", method=RequestMethod.POST)
   public ArrayList<TimeLine> selectTime(int seat_sq) {
      
      System.out.println("시간검색 오는 번호 : " + seat_sq);
      
      ArrayList<TimeLine> timeList = service.selectTime(seat_sq);
      
      System.out.println("db에서 검색한 시간: "+ timeList.size());
      
      return timeList;
   }
   
   //스터디룸 예약하기
   @RequestMapping(value="/seatbook", method=RequestMethod.POST)
   public String seatBook(RoomVO vo) {
      System.out.println("예약시간 :" + vo.getSeat_aloc_strt_tm());
      
      // 스터디룸 예약
      String page = service.seatBook(vo);
      
      // 타임라인 1로 업데이트
      service.updateTimeLine(vo);
      
      return page;
   }
   
   //스터디룸 예약취소
   @ResponseBody
   @RequestMapping(value="/roomDel", method=RequestMethod.POST)
   public String roomDel(RoomVO vo) {
      
      logger.info("예약취소 데이터: {}"+ vo );
      
      // 예약취소시 타임라인 업데이트
      int seat_sq = vo.getSeat_sq(); // 퇴실하고 타임라인 0으로 업데이트
      String timeLine = vo.getSeat_aloc_strt_tm(); // 퇴실하고 타임라인 0으로 업데이트
      service.timeLineCheck(seat_sq, timeLine); // 타임라인 0으로 업데이트
      
      // 예약취소
      int result = service.roomDel(vo);
      
      String success = null;
      if(result == 1) {
         success = "delete";
      }else {
         success = "fail";
      }
      
      return success;
   }
   
   
   // 스터디룸 중복예약체크
   @ResponseBody
   @RequestMapping(value="/check", method=RequestMethod.GET, produces = "application/text;charset=utf-8")
   public String check(String member_id) {
      
      System.out.println("예약하려는 id : " + member_id);
      
      ArrayList<RoomVO> result = service.check(member_id);
      System.out.println("예약체크 :" + result.size());
      if(result.size() == 0) {
         return "0";
      }else {
         return "1";
      }
      
   }
   
   
   
}