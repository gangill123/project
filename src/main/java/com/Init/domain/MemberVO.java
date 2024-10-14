package com.Init.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;


@Data
public class MemberVO {

	private String id; 	
	private String cid; 
	private String pw; 
	private String profile; 
	private String name; 
	private Date birth;
	private String gender; 
	private String tel; 
	private String email; 
	private String addr;  
	private String dnum; 
	private String position;  
	private String job_id; 
	private Integer status; 
	private Integer bnum; 
	private Integer work_type; 
	private Integer salary; 
	private String account_num; 
	private String bank_name; 
	private String account_name; 
	private Date start_date; 
	private Date break_date; 
	private Date restart_date; 
	private Date quit_date; 
	private String power; 
	private Integer level;
	private Timestamp update_date;	
	
}
