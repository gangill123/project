package com.Init.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.Init.domain.LeaveVO;
import com.Init.persistence.LeaveDAO;

@Service
public class LeaveServiceImpl implements LeaveService {

	private static final Logger logger = LoggerFactory.getLogger(LeaveServiceImpl.class);

	@Inject
	private LeaveDAO leaveDAO;

	@Autowired
	private LeaveService leaveService;

	public List<LeaveVO> getAllLeaves(String emp_id) {
	    return leaveDAO.getAllLeaves(emp_id);
	}
	
	@Override
    public LeaveVO getLeaveById(int leave_id) {
        return leaveDAO.selectLeaveById(leave_id);
    }

    @Override
    public void updateLeave(int leave_id, LeaveVO leaveData) {
        leaveDAO.updateLeave(leave_id, leaveData);
    }
	
    public List<LeaveVO> findLeaves(@Param("emp_id") String emp_id, int currentPage, int size) {
        int offset = (currentPage - 1) * size; // offset 계산
        return leaveDAO.findLeaves(emp_id, offset, size); // emp_id와 offset, size를 전달
    }

    public int getTotalLeavesCount(String emp_id) {
        return leaveDAO.getTotalLeavesCount(emp_id);
    }
	
	
	
}