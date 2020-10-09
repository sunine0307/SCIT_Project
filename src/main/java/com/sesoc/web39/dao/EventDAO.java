package com.sesoc.web39.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.web39.vo.EventVO;







@Repository
public class EventDAO {
	
	@Autowired
	private SqlSession session;
	
	public int addEvent(EventVO event) {
		EventMapper mapper = session.getMapper(EventMapper.class);
		System.out.println("다오입니다.");
		System.out.println(event);
		int cnt=0;
		try {
			cnt=mapper.addEvent(event);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public ArrayList<EventVO> fetchEvent(){
		EventMapper mapper = session.getMapper(EventMapper.class);
		ArrayList<EventVO> list = null;
		try {
			list=mapper.fetchEvent();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int updateEvent(EventVO event) {
		EventMapper mapper = session.getMapper(EventMapper.class);
		int cnt = 0;
		try {
			cnt=mapper.updateEvent(event);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int deleteEvent(EventVO event) {
		EventMapper mapper = session.getMapper(EventMapper.class);
		int cnt = 0;
		try {
			cnt=mapper.deleteEvent(event);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
		
	}
	
	

}


