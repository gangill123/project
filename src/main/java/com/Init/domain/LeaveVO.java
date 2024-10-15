package com.Init.domain;

import java.sql.Date;
import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class LeaveVO {

    // 휴가번호
    private int leave_id; // leaveId

    // 사원 번호
    private String emp_id; // emp_id

    // 휴가 유형 (예비군-1, 출산휴가-2, 병가-3 등)
    private String leave_type; // leaveType

    // 휴가 시작일
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date leave_start_date; 

    // 휴가 일수
    private int t_leave; 

    // 연차 관련 필드
    private int annual_leave; // annualLeave
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date annual_leave_start_date; // annualLeaveStartDate
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date end_annual_leave; 

    // 총 연차 일수 관련 필드
    private int total_annual_leave; 
    private int used_annual_leave; 
    private int remaining_annual_leave; 

    // 휴가 종료일
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date end_leave_date; 

    // 휴가 상태 (신청중-1, 승인-2, 거절-3)
    private String leave_status; 

    // 승인 날짜
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date approval_date; 

    // 신청 사유
    private String reason; 

    // 신청 날짜
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date requested_at; 

    // 총 휴가 일수 관련 필드
    private int total_leave_days; 
    private int used_leave; 
    private int remaining_leave; 
}
