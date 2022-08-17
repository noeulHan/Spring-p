package com.spring.javagreenS_hne.vo;

import lombok.Data;

public @Data class BoardVO {
	private int idx;
	private String title;
	private String email;
	private String content;
	private String wDate;
	private int readNum;
	private String hostIp;
	private int good;
	private String mid;
	private String fName;
	private String fSName;
	private String caseone;
	
	private String name;
	private String wNDate;
	
	private int diffTime;
	
	private String oriContent;
	
	private int replyCount;
}