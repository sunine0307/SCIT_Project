package com.sesoc.web39.login;


import java.io.IOException;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.sesoc.web39.service.MemberService2;




@Controller
public class LoginController {
	
	 /* NaverLoginBO */
	   private String apiResult = null;
	   
	   @Autowired
	   private MemberService2 service2;
	   

	   
	   private kakao_restapi kakao_restapi = new kakao_restapi();
	   

	   
	   @RequestMapping(value = "/oauth", produces = "application/json")
	    public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {
	       
	      System.out.println("로그인 할때 임시 코드값");
	        //카카오 홈페이지에서 받은 결과 코드
	        System.out.println(code);
	        System.out.println("로그인 후 결과값");
	        
	        //카카오 rest api 객체 선언
	        kakao_restapi kr = new kakao_restapi();
	        //결과값을 node에 담아줌
	        JsonNode node = kr.getAccessToken(code);
	        
	        JsonNode accessToken;
	        
	        // 여러 json객체 중 access_token을 가져온다
	        accessToken = node.get("access_token");
//	        accessToken = node.get("access_token");
	        session.setAttribute("token", accessToken);
	 
	        System.out.println("access_token : " + accessToken);
	        
	        
	 
	        
	        // access_token을 통해 사용자 정보 요청
	        JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(accessToken);
	 
	        // Get id
	        String id = userInfo.path("id").asText();
	        String name = null;
	        String email = null;   // email은 카카오에서 받지말고 회원가입창에서 입력받게 하기
	 
	        // 유저정보 카카오에서 가져오기 Get properties
	        JsonNode properties = userInfo.path("properties");
	        JsonNode kakao_account = userInfo.path("kakao_account");
	 
	        name = properties.path("nickname").asText();
	        email = kakao_account.path("email").asText();
	 
	        System.out.println("kakao_id : " + id);   // 카카오 로그인하면 넘어오는 정보 - id가 숫자로 넘어옴
	        System.out.println("kakao_name : " + name);   // 카카오 로그인하면 넘어오는 정보
	        System.out.println("kakao_email : " + email);   // 카카오 로그인하면 넘어오는 정보
	        
	        // 위 정보를 db에 insert 하는 로직 but 같은 아이디일 경우 다시 insert 못하게 select로 같은 id 있는지 검사하고 null일 경우만 insert 하기
	        
	        session.setAttribute("kakao_id", id);   // id 고유번호를 session에 넣음
	        session.setAttribute("kakao_name", name); // 이름 세션에 넣음
	        
	        // service에서 id db에 저장되어있는지 검색 후 저장되어있으면 mypage, 없으면 회원가입페이지로 이동 받아오기
	        String page = service2.joinKakaoCheck();
	        
	        //return "redirect:/mypage";
	        
	        return page;
	    }
	   
	   


	
	
	
}
