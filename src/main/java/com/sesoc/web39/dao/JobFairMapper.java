package com.sesoc.web39.dao;

import java.util.ArrayList;

import com.sesoc.web39.vo.JobFairVO;

public interface JobFairMapper {
   
   // 잡페어등록
   public int addJobFair(JobFairVO vo);
   
   // 서울페어 리스트
   public ArrayList<JobFairVO> selectSeoulList();
   
   // 도쿄페어 리스트
   public ArrayList<JobFairVO> selectokyoList();
   
   // 스페셜페어 리스트
   public ArrayList<JobFairVO> selectSpecialList();
   
   // 잡페어 목록 하나
   public JobFairVO oneListFair(int jobfair_no);
   
   // 잡페어 기업정보 수정
   public int updateFair(JobFairVO vo);
   
   // 잡페어 삭제
   public int deleteFair(int jobfair_no);
}