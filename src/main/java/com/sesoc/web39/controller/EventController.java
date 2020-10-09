package com.sesoc.web39.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.web39.service.EventService;
import com.sesoc.web39.vo.EventVO;



@Controller
@RequestMapping(value="/event")
public class EventController {
	
	@Autowired
	private EventService service;
	
	@RequestMapping(value="/calendarTest", method=RequestMethod.GET)
	public String calendarTest(EventVO event) {
		
		return "/calendar/calendarTest";
	}
	
	
	@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public String calendar(EventVO event) {
		
		return "/calendar/calendar";
	}
	
	
	@RequestMapping(value="/addEvent", method=RequestMethod.POST)
	public String addEvent(EventVO event) {
		String page = service.addEvent(event);
		System.out.println("추가컨트롤러입니다");
		System.out.println(event);
		return page;
	}
	
	@ResponseBody
	@RequestMapping(value="/fetchEvent", method=RequestMethod.POST)
	public ArrayList<EventVO> fetchEvent() {
		ArrayList<EventVO> list = service.fetchEvent();
	
		return list;
	}
	
	@RequestMapping(value="/updateEvent", method=RequestMethod.POST)
	public String updateEvent(EventVO event) {
		String page = service.updateEvent(event);
		System.out.println("수정컨트롤러입니다.");
		System.out.println(event);
		return page;
	}
	
	@RequestMapping(value="/deleteEvent", method=RequestMethod.GET)
	public String deleteEvent(EventVO event) {
		String page = service.deleteEvent(event);
		System.out.println("삭제컨트롤러입니다.");
		System.out.println(event);
		return page;
		
	}
}
