package com.Init.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.Init.domain.LeaveVO;
import com.Init.service.LeaveService;


@Controller
@RequestMapping(value = "/leave/*")
public class LeaveController {

	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	@Autowired
	private LeaveService leaveService;
	
	
	// 템플릿 적용 확인
	// http://localhost:8088/leave/main
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPage() {
		logger.debug(" /main -> mainPage() 실행");
		logger.debug(" /views/leave/main.jsp 뷰페이지 연결");

		return "leave/main";

	}
	
		// http://localhost:8088/leave/mainAdmin
		@RequestMapping(value = "/mainAdmin", method = RequestMethod.GET)
		public String AdminMainPage() {
			logger.debug(" /main -> AdminMainPage() 실행");
			logger.debug(" /views/leave/mainAdmin.jsp 뷰페이지 연결");

			return "leave/mainAdmin";

		}
	
		   // 사원 ID로 휴가 조회
	    @GetMapping("/leaveSelect")
	    public ResponseEntity<List<LeaveVO>> getAllLeaves(@RequestParam String emp_id) {
	        logger.debug("사원 ID로 휴가 조회: " + emp_id);
	        List<LeaveVO> leaves = leaveService.getAllLeaves(emp_id);
	        return ResponseEntity.ok(leaves);
	    }

	    // 휴가 수정 정보를 가져오기
	    @GetMapping("/selectUpdate") // 오타 수정: 'seletUpdate' -> 'selectUpdate'
	    public ResponseEntity<LeaveVO> getLeaveById(@RequestParam int leave_id) {
	        LeaveVO leave = leaveService.getLeaveById(leave_id);
	        return ResponseEntity.ok(leave);
	    }

	    // 휴가 정보 수정
	    @PostMapping("/leaveUpdate")
	    public ResponseEntity<Map<String, Object>> updateLeave(@RequestParam int leave_id, @RequestBody LeaveVO leaveData) {
	        Map<String, Object> response = new HashMap<>();

	        // 유효성 검사 (예시)
	        if (leaveData == null || leave_id <= 0) {
	            response.put("success", false);
	            return ResponseEntity.badRequest().body(response); // 잘못된 요청
	        }

	        try {
	            leaveService.updateLeave(leave_id, leaveData);
	            response.put("success", true); // 성공적으로 업데이트됨
	            return ResponseEntity.ok(response); // 성공 응답
	        } catch (Exception e) {
	            e.printStackTrace(); // 에러 로그
	            response.put("success", false); // 실패
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response); // 서버 오류
	        }
	    }
	
	    
	    // 휴가 삭제 메서드
	    @PostMapping("/leaveDelete")
	    public ResponseEntity<?> deleteLeave(@RequestParam("leave_id") int leave_id) {
	        try {
	            leaveService.deleteLeave(leave_id);
	            return ResponseEntity.ok().body("{\"success\": true}");
	        } catch (Exception e) {
	            return ResponseEntity.status(500).body("{\"success\": false}");
	        }
	    }
	 

	
	
	
	
	
}
