package com.bitc.intranet.vo;

import lombok.Data;

@Data
public class LoginDTO {

	private String uid;
	private String upw;
	private boolean userCookie;
}
