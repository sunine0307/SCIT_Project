package com.sesoc.web39.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sesoc.web39.dao.EventDAO;
import com.sesoc.web39.vo.EventVO;




@Service
public class EventService {
	
	@Autowired
	private EventDAO dao;
	
	@Autowired
	private HttpSession session;
	
	public String addEvent(EventVO event) {
		String member_id = (String)session.getAttribute("loginId");
		String member_name =(String)session.getAttribute("loginName");
		System.out.println("이벤트 추가 서비스입니다");
		System.out.println(member_name);
		System.out.println(member_id);
		event.setMember_id(member_id);
		dao.addEvent(event);
	
		String page = "redirect:/event/fetchEvent";
		
		return page;
	}
	
	public ArrayList<EventVO> fetchEvent(){
		ArrayList<EventVO> list = dao.fetchEvent();
		
		return list;
		
	}
	public String updateEvent(EventVO event) {
		dao.updateEvent(event);
		String page = "redirect:/event/fetchEvent";
		
		return page;
	}
	
	public String deleteEvent(EventVO event) {
		dao.deleteEvent(event);
		String page = "redirect:/event/fetchEvent";
		
		return page;
	}
	
}
