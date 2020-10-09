package com.sesoc.web39.dao;

import java.util.ArrayList;

import com.sesoc.web39.vo.EventVO;



public interface EventMapper {
	public int addEvent(EventVO event);
	public ArrayList<EventVO> fetchEvent();
	public int updateEvent(EventVO event);
	public int deleteEvent(EventVO event);
}
