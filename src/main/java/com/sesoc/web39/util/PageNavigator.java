package com.sesoc.web39.util;

/**
 * 게시판 페이징 처리 클래스
 */
public class PageNavigator {
   //페이지 관련 정보 
   private int countPerPage;      //페이지당 글목록 수 : 한 페이지에 게시글 몇개씩 보여줄 것인지 : 판페이지에 5개면 5가됨, 10
   private int pagePerGroup;      //그룹당 페이지 수  : 아래에 12345 : 이 부분을 몇 개씩 보여줄 것인지, 5가됨(0그룹-12345,1그룹-678910), 5
   private int currentPage;      //현재 페이지 (최근 글이 1부터 시작) : 내가 현재 보고있는 페이지의 게시글, 1
   private int totalRecordsCount;   //전체 글 수 : 전체 페이지안에있는 글 수 , 78
   private int totalPageCount;      //전체 페이지 수 : 8
   private int currentGroup;      //현재 그룹 (최근 그룹이 0부터 시작) : 편재 페이지가 1페이지이니까 0그룹
   private int startPageGroup;      //현재 그룹의 첫 페이지 : 1
   private int endPageGroup;      //현재 그룹의 마지막 페이지 : 5
   private int startRecord;      //전체 레코드 중 현재 페이지 첫 글의 위치 (0부터 시작) :전체글 수 : 78, 0번부터 77번까지있음 -> 1페이지의 첫글 0번
   // 현재 페이지가 7페이지이면 현재그룹 : 1, 현재 그룹 : 1,현재 그룹의 첫페이지 : 6, 현재그룹의 마지막 페이지 : 8, 현재페이지의 첫 글의 위치 : 60 
   
   /*
    * 생성자
    */
   public PageNavigator(int countPerPage, int pagePerGroup, int currentPage, int totalRecordsCount) {
      //페이지당 글 수, 그룹당 페이지 수, 현재 페이지, 전체 글 수를 전달받음
      this.countPerPage = countPerPage;
      this.pagePerGroup = pagePerGroup;
      this.totalRecordsCount = totalRecordsCount; // db에서 select count해서 받아오기
      
      //전체 페이지 수
      totalPageCount = (totalRecordsCount + countPerPage - 1) / countPerPage; // -1을 안해주면 100개 10개씩일 때 11페이지가되버림

      //전달된 현재 페이지가 1보다 작으면 현재페이지를 1페이지로 지정
      if (currentPage < 1)   currentPage = 1; // 현재 페이지가 -3이 될 수 있음 
      //전달된 현재 페이지가 마지막 페이지보다 크면 현재페이지를 마지막 페이지로 지정
      if (currentPage > totalPageCount)   currentPage = totalPageCount;
      
      this.currentPage = currentPage;

      //현재 그룹
      currentGroup = (currentPage - 1) / pagePerGroup;
      
      //현재 그룹의 첫 페이지
      startPageGroup = currentGroup * pagePerGroup + 1;
      //현재 그룹의 첫 페이지가 1보다 작으면 1로 처리
      startPageGroup = startPageGroup < 1 ? 1 : startPageGroup;
      //현재 그룹의 마지막 페이지
      endPageGroup = startPageGroup + pagePerGroup - 1;
      //현재 그룹의 마지막 페이지가 전체 페이지 수보다 작으면 전체페이지 수를 마지막으로.
      endPageGroup = endPageGroup < totalPageCount ? endPageGroup : totalPageCount;

      //전체 레코드 중 현재 페이지 첫 글의 위치
      startRecord = (currentPage - 1) * countPerPage;         
   }

   /*
    * Getters and Setters
    */
   public int getCountPerPage() {
      return countPerPage;
   }

   public void setCountPerPage(int countPerPage) {
      this.countPerPage = countPerPage;
   }

   public int getPagePerGroup() {
      return pagePerGroup;
   }

   public void setPagePerGroup(int pagePerGroup) {
      this.pagePerGroup = pagePerGroup;
   }

   public int getCurrentPage() {
      return currentPage;
   }

   public void setCurrentPage(int currentPage) {
      this.currentPage = currentPage;
   }

   public int getTotalRecordsCount() {
      return totalRecordsCount;
   }

   public void setTotalRecordsCount(int totalRecordsCount) {
      this.totalRecordsCount = totalRecordsCount;
   }

   public int getTotalPageCount() {
      return totalPageCount;
   }

   public void setTotalPageCount(int totalPageCount) {
      this.totalPageCount = totalPageCount;
   }

   public int getCurrentGroup() {
      return currentGroup;
   }

   public void setCurrentGroup(int currentGroup) {
      this.currentGroup = currentGroup;
   }

   public int getStartPageGroup() {
      return startPageGroup;
   }

   public void setStartPageGroup(int startPageGroup) {
      this.startPageGroup = startPageGroup;
   }

   public int getEndPageGroup() {
      return endPageGroup;
   }

   public void setEndPageGroup(int endPageGroup) {
      this.endPageGroup = endPageGroup;
   }

   public int getStartRecord() {
      return startRecord;
   }

   public void setStartRecord(int startRecord) {
      this.startRecord = startRecord;
   }

   @Override
   public String toString() {
      return "PageNavigator [countPerPage=" + countPerPage + ", pagePerGroup=" + pagePerGroup + ", currentPage="
            + currentPage + ", totalRecordsCount=" + totalRecordsCount + ", totalPageCount=" + totalPageCount
            + ", currentGroup=" + currentGroup + ", startPageGroup=" + startPageGroup + ", endPageGroup="
            + endPageGroup + ", startRecord=" + startRecord + "]";
   }
   
}