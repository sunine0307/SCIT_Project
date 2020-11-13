package com.sesoc.web39.login;


import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sesoc.web39.util.FileService;
import com.fasterxml.jackson.databind.JsonNode;
import com.sesoc.web39.service.MemberService2;
import com.sesoc.web39.vo.MemberVO2;

@Controller
@RequestMapping(value="/member2")
public class MemberController2 {
   
   private static final Logger logger = LoggerFactory.getLogger(MemberController2.class);
   
   @Autowired
   private MemberService2 service2;
   
   private String uploadPath = "/boardfile"; // 0810 파일저장을 위한 변수 
   
   private String apiResult = null;
   

   
   @RequestMapping(value="/joinForm", method=RequestMethod.GET)
   public String joinForm() {
      
      return "member/joinForm";
   }
   
   
   // 로그인 페이지로 이동
   @RequestMapping(value="/loginForm", method={ RequestMethod.GET, RequestMethod.POST })
   public String loginForm(Model model, HttpSession session) {
      
      System.out.println("로그아웃확인");
      System.out.println("MemberController2 kakao_로그인 세션확인 : " + session.getAttribute("kakao_id"));
      System.out.println("MemberController2 일반로그인 세션확인:" + session.getAttribute("loginId"));
      
      
//      /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
//      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//      
//      //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
//      //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
//      System.out.println("네이버:" + naverAuthUrl);
//      
//      //네이버
//      model.addAttribute("url", naverAuthUrl);
      
      return "/login2";
   }
   
//   @RequestMapping(value="/join", method=RequestMethod.POST)
//   public String join(MemberVO2 member) {                  // 회원가입
//      String page=service2.joinMember2(member);
//      return page;
//   }
   
   // 1018 회원가입 test , 증명사진 upload
   @RequestMapping(value="/join", method=RequestMethod.POST)
   public String join(MemberVO2 member, MultipartFile upload ) {
      // 파일추가
      if(!upload.isEmpty()) {
         //파일을 저장
         String savedfile = FileService.saveFile(upload, uploadPath);
         member.setSavedfile(savedfile); // 물리적 저장파일명
         member.setOriginalfile(upload.getOriginalFilename()); 
      }
   
      // 회원가입 후 마이페이지로 이동
      String page = service2.joinMember2(member);
      System.out.println("조인되는지 확인");
      System.out.println(member);
      return page;
   }
   
   
   // 1018 마이페이지 이동 , 이미지 보여주기
      @RequestMapping(value = "/mypage", method=RequestMethod.GET)
      public String mypage(Model model, HttpSession session) throws Exception{
         MemberVO2 member = service2.oneMemeber();
         
         model.addAttribute("memberInfo", member);
         System.out.println(member);
         return "mypage";
      }
      
      //1021 회원정보 수정페이지로 이동
     
      @RequestMapping(value = "/moveEditPage", method=RequestMethod.GET)
      public String moveEditPage(Model model) {
         MemberVO2 member = service2.oneMemeber();
         model.addAttribute("editMember", member);
         
         return "member/updateForm";
      }
      
      // 회원정보 수정 -get아닌데 get으로 405오류
      //method= {RequestMethod.GET, RequestMethod.POST}
      @RequestMapping(value="/updateMember", method= {RequestMethod.GET, RequestMethod.POST})
      public String updateMember(MemberVO2 member, MultipartFile upload, HttpServletRequest req) {
         
         System.out.println("MemberController2 회원정보 수정 확인 : " + member);
         
       // 파일 수정
          if(!upload.isEmpty()) {
             //기존 파일 삭제
            String fullPath = uploadPath + "/" + member.getSavedfile();   
            boolean result = FileService.deleteFile(fullPath);
            
            //파일전체경로 확인하기
            System.out.println("파일삭제를 위한 경로 : " + fullPath);
            // 삭제결과 확인하기
            System.out.println("파일삭제 여부 확인 : " + result);
             
            // 새로 첨부한 파일 등록
             String savedfile = FileService.saveFile(upload, uploadPath);
             member.setSavedfile(savedfile); // 물리적 저장파일명
             member.setOriginalfile(upload.getOriginalFilename()); 
          }else { 
             member.setSavedfile(req.getParameter("savedfile"));
             member.setOriginalfile(req.getParameter("originalfile"));
          }
         
         // 수정성공시 mypage로 이동
         String page = service2.updateMember(member);
         
         return page;
      }
      
      //회원정보 삭제
      @RequestMapping(value="/deleteMemberInfo", method = RequestMethod.GET)
      public String deleteMemberInfo(MemberVO2 member) {
         
         System.out.println("MemberController2 회원삭제" + member);
         
         // 파일삭제
         String originalfile = member.getOriginalfile();
         if(originalfile != null) {   // 등록된 이미지가 있을 때
            String fullPath = uploadPath + "/" + member.getSavedfile();   
              Boolean result = FileService.deleteFile(fullPath);
            //파일전체경로 확인하기
             System.out.println("파일삭제를 위한 경로 : " + fullPath);
            // 삭제결과 확인하기
            System.out.println("파일삭제 여부 확인 : " + result);
         }
         
         String page = service2.deleteMemberInfo(member);
         
         return page;
      }
      
      
      
   // 이미지 보여주기 위한 다운로드 로직
      @RequestMapping(value = "/download", method = RequestMethod.GET)
      public String fileDownload(HttpServletResponse response) {
         MemberVO2 member = service2.oneMemeber();   // 이미지 다운 위한 회원정보 받아오기
         //원래의 파일명
         String originalfile = new String(member.getOriginalfile());
         try {
           
            response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originalfile, "UTF-8"));
         } catch (UnsupportedEncodingException e) { 
            e.printStackTrace();
         }
         
         //저장된 파일 경로 : 전체 경로
         String fullPath = uploadPath + "/" + member.getSavedfile(); // 필드에 uploadPath 지정해둠 
         System.out.println("MemberController2 : 이미지 다운로드 경로" + fullPath);
         
         FileInputStream filein = null; 
         ServletOutputStream fileout = null; 
         
         try {
            filein = new FileInputStream(fullPath); 
            fileout = response.getOutputStream(); 
            
            //Spring의 파일 관련 유틸
            FileCopyUtils.copy(filein, fileout); 
            
            filein.close(); 
            fileout.close();
         } catch (IOException e) {
            e.printStackTrace();
         }
         
         return null;
      }
   

//   @RequestMapping(value="/joinFail", method=RequestMethod.GET)
//   public String joinFail() {
//      return "tempMember/joinFail";
//   }   

   // 일반회원 로그인
   @RequestMapping(value="/login", method=RequestMethod.POST)
   public String login(Model model, MemberVO2 member, String member_id, HttpSession session) {
      String page =service2.login2(member);
      //MemberVO2 member2 = service2.getMember2(member_id);
      //model.addAttribute("vo", member2);
      //session.setAttribute("vo3", member2);
      //System.out.println(member2);
      
      return page;
   }
   
   // 로그아웃 
   @RequestMapping(value= "/logout", method=RequestMethod.GET , produces = "application/json")
   public String logout(HttpSession session) {
      
      String kakao_id = (String)session.getAttribute("kakao_id");   // kakao_id
      //String member_id = (String)session.getAttribute("loginId");   // 일반회원가입
      
      if(kakao_id != null) {               
         session.removeAttribute("kakao_id");   // kakao 로그아웃
      }else {
         session.removeAttribute("loginId");      // 일반회원 로그아웃
      }
       
       System.out.println("memberController2 로그아웃");
       
       return "redirect:/member2/loginForm";
   }
   
//   // 카카오 로그아웃
//      @RequestMapping(value = "/logout", produces = "application/json")
//       public String Logout(HttpSession session) {
//         
//         //kakao restapi 객체 선언
//           kakao_restapi kr = new kakao_restapi();
//           //노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
//           JsonNode node = kr.Logout(session.getAttribute("token").toString());
//           //결과 값 출력
//           System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));
//           
//           return "redirect:/member2/loginForm";
//       }

   // 사용 x
   @RequestMapping(value = "/getMember2")
   public String getMember2(Model model, String member_id) throws Exception{
      MemberVO2 member = service2.getMember2(member_id);
      model.addAttribute("member", member);
      System.out.println(member);
      return "/mypage";
   }
   
	@ResponseBody
	@RequestMapping(value="/idCheck",method=RequestMethod.GET, produces="application/text;charset=utf-8")
	public String idCheck(String member_id) {
		String result = "Avalilable";
		ArrayList<MemberVO2> list = service2.fetchMember2();
		System.out.println("중복확인목록");
		System.out.println(list);
		for (int i = 0; i < list.size(); i++) {
			if(member_id.equals(list.get(i).getMember_id())) {
			result="Already Exists";
			break;
			}
		}
		return result;
	}
}