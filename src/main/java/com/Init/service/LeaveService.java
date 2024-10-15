package com.Init.service;

import java.util.List;

import com.Init.domain.LeaveVO;

public interface LeaveService {

	List<LeaveVO> getAllLeaves(String emp_id);

	LeaveVO getLeaveById(int leave_id);

	void updateLeave(int leave_id, LeaveVO leaveData);

	public List<LeaveVO> findLeaves(String emp_id,int currentPage, int size);

	public int getTotalLeavesCount(String emp_id);

}
