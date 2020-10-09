package com.sesoc.web39.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.web39.vo.MemberVO;


@Repository
public class MemberDAO {
	@Autowired
	private SqlSession session;
	
	
	public int joinMember(MemberVO member) {
		MemberMapper mapper =session.getMapper(MemberMapper.class);
		int cnt = 0;
		try {
			cnt=mapper.joinMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public MemberVO getMember(String member_id) {
		MemberMapper mapper =session.getMapper(MemberMapper.class);
		MemberVO member = null;
		try {
			member=mapper.getMember(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
}
