package com.sesoc.web39.vo;

import lombok.Data;

@Data
public class CommentVO {
	private int comment_no;
	private String comment_content;
	private String comment_indate;
	private String member_id;
	private int company_no;
}
