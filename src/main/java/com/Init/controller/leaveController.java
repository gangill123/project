package com.Init.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Init.service.AttendanceService;

@Controller
@RequestMapping(value = "/leave/*")
public class leaveController {

	
	 
 
		
		 private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
		 
		 // 템플릿 적용 확인
		 // http://localhost:8088/leave/main
		 @RequestMapping(value = "/main", method = RequestMethod.GET)
		 public String mainPage() {
		     logger.debug(" /main -> mainPage() 실행");
		     logger.debug(" /views/leave/main.jsp 뷰페이지 연결");
		     
		     return "leave/main";
		     
 }
 
	
	
	
	
	
	
	
	
}
