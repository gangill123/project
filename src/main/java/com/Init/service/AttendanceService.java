package com.Init.service;

import java.io.IOException;
import java.util.List;

import com.Init.domain.AttendanceVO;

public interface AttendanceService {

	public List<AttendanceVO> getAllCheckTime(String emp_id);

//	public void checkIn(AttendanceVO attendance);
//	public void checkOut(AttendanceVO attendance);
//	
//	
	boolean checkIfCheckedIn(String emp_id);

	void recordCheckIn(String emp_id);

	void recordCheckout(String emp_id);

	public List<AttendanceVO> getRecentCheckTime(String emp_id);

	AttendanceVO fetchLatestAttendanceRecord(String emp_id);

	AttendanceVO fetchLatestCheckOutRecord(String emp_id);

	public void calculateAndUpdateWorkingTime(String emp_id);

	public double getLatestWorkingTime(String emp_id);

	// 페이징을 위한 새로운 메소드
	List<AttendanceVO> getAllCheckTime(String emp_id, int offset, int size);

	public int getTotalCheckTimeCount(String emp_id);

	void updateAttendanceRecord(AttendanceVO attendanceVO);
	
	

}
