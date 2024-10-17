package com.Init.service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Override
	public void deleteLeave(int leave_id) {
		leaveDAO.deleteLeave(leave_id);
	}

	@Override
	public List<LeaveVO> getLeaveInfo(String emp_id) {
		logger.debug("emp_id를 반환되는지 : " + emp_id);
		return leaveDAO.selectLeaveInfo(emp_id);

	}

	// 연차 부여 메서드
	@Override
	public void grantAnnualLeave(LeaveVO leaveVO) {
		Date startDate = leaveVO.getStartdate();
		Date currentDate = Date.valueOf(LocalDate.now());

		// 입사일로부터 현재일까지의 연수를 계산
		long yearsOfService = ChronoUnit.YEARS.between(startDate.toLocalDate(), currentDate.toLocalDate());

		// 연차 부여 정책에 따라 연차 부여
		leaveVO.setTotal_annual_leave((int) yearsOfService * leaveVO.getLgrant());
		leaveVO.setRemaining_annual_leave(leaveVO.getTotal_annual_leave() - leaveVO.getUsed_annual_leave());
	}
	// 연차 사용 메서드
	@Override
	 public void useAnnualLeave(LeaveVO leaveVO, int days) {
        // 잔여 연차 확인
        if (days > leaveVO.getRemaining_annual_leave()) {
            throw new IllegalArgumentException("잔여 연차가 부족합니다.");
        }

        // 사용된 연차 업데이트
        leaveVO.setUsed_annual_leave(leaveVO.getUsed_annual_leave() + days);
        
        // 잔여 연차 업데이트
        leaveVO.setRemaining_annual_leave(leaveVO.getTotal_annual_leave() - leaveVO.getUsed_annual_leave());
    }

	// 연차 소멸 처리 메서드

	@Override
	public void handleExpiry(LeaveVO leaveVO) {
		// 연차 소멸 정책 구현
		if (leaveVO.getExpiry() > 0) {
			leaveVO.setRemaining_annual_leave(Math.max(0, leaveVO.getRemaining_annual_leave() - leaveVO.getExpiry()));
		}
	}

	// 연차 조정 메서드
	@Override
	public void adjustAnnualLeave(LeaveVO leaveVO, int adjustment) {
		leaveVO.setTotal_annual_leave(leaveVO.getTotal_annual_leave() + adjustment);
		leaveVO.setRemaining_annual_leave(leaveVO.getRemaining_annual_leave() + adjustment);
		leaveVO.setAdjustment(adjustment);
	}
	
	 
	
	
}