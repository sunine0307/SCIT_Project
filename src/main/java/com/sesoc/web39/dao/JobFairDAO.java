package com.sesoc.web39.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.web39.vo.JobFairVO;

@Repository
public class JobFairDAO {
   
   @Autowired
   private SqlSession session;
   
   // 잡페어 등록
   public int addJobFair(JobFairVO vo) {
      JobFairMapper mapper = session.getMapper(JobFairMapper.class);
      int cnt = 0;
      try {
         cnt = mapper.addJobFair(vo);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return cnt;
   }
   
   // 서울페어 리스트
   public ArrayList<JobFairVO> selectSeoulList() {
         JobFairMapper mapper = session.getMapper(JobFairMapper.class);
         ArrayList<JobFairVO> result = null;
         try {
            result = mapper.selectSeoulList();
         }catch(Exception e) {
            e.printStackTrace();
         }
         return result;
      }
   
   // 도쿄페어 리스트
   public ArrayList<JobFairVO> selectokyoList(){
      JobFairMapper mapper = session.getMapper(JobFairMapper.class);
      ArrayList<JobFairVO> result = null;
      try {
         result = mapper.selectokyoList();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return result;
   }
   
   // 스페셜페어 리스트
   public ArrayList<JobFairVO> selectSpecialList(){
      JobFairMapper mapper = session.getMapper(JobFairMapper.class);
      ArrayList<JobFairVO> result = null;
      try {
         result = mapper.selectSpecialList();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return result;
   }
   
   
// 잡페어 목록 하나
   public JobFairVO oneListFair(int jobfair_no) {
      JobFairMapper mapper = session.getMapper(JobFairMapper.class);
      JobFairVO result = null;
      try {
         result = mapper.oneListFair(jobfair_no);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return result;
      
   }
   
   // 잡페어 기업정보 수정
   public int updateFair(JobFairVO vo) {
      JobFairMapper mapper = session.getMapper(JobFairMapper.class);
      int cnt = 0;
      try {
         cnt = mapper.updateFair(vo);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return cnt;
   }
   
   // 잡페어 삭제
   public int deleteFair(int jobfair_no) {
      JobFairMapper mapper = session.getMapper(JobFairMapper.class);
      int cnt = 0;
      try {
         cnt = mapper.deleteFair(jobfair_no);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return cnt;
   }


}