package com.sesoc.web39.dao;

import com.sesoc.web39.vo.MemberVO;

public interface MemberMapper {
	public int joinMember(MemberVO member);
	public MemberVO getMember(String member_id);
}
