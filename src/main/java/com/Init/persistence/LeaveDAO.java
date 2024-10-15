package com.Init.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Init.domain.LeaveVO;

/*
 *  tbl_member 테이블의 데이터를 활용하는 동작을 정의
 */

public interface LeaveDAO {

	List<LeaveVO> getAllLeaves(String emp_id);

	LeaveVO selectLeaveById(int leave_id);

	void updateLeave(int leaveId, LeaveVO leaveData);

	List<LeaveVO> findLeaves(@Param("emp_id") String emp_id,@Param("size") int size, @Param("offset") int offset);

	int getTotalLeavesCount(String emp_id);
	
	 void deleteLeave(int leave_id);
}
