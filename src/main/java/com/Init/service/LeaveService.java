package com.Init.service;

import java.util.List;

import com.Init.domain.LeaveVO;

public interface LeaveService {

	List<LeaveVO> getAllLeaves(String emp_id);

	LeaveVO getLeaveById(int leave_id);

	void updateLeave(int leave_id, LeaveVO leaveData);

	void deleteLeave(int leave_id);

	List<LeaveVO> getLeaveInfo(String emp_id);
	
	public void grantAnnualLeave(LeaveVO leaveVO);
	
	public void useAnnualLeave(LeaveVO leaveVO, int days);
	
	public void handleExpiry(LeaveVO leaveVO);
	
	public void adjustAnnualLeave(LeaveVO leaveVO, int adjustment);
	
}
