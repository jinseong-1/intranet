package com.bitc.intranet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class FreeVO {

	private int bno;
	private String title;
	private String category;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
}
