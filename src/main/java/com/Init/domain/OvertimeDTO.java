package com.Init.domain;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본 생성자 자동 생성
public class OvertimeDTO {
	 
	    private String emp_id;
	    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd ")
	    private Timestamp created_at;
	    
	    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	    private Timestamp check_in;
	    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	    private Timestamp check_out;
	    private int overtime;
	    private String status;
	    private String modified_reason;

	    // Getters and Setters
	
    // Getter and Setter methods
    public String getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(String emp_id) {
        this.emp_id = emp_id;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getCheck_in() {
        return check_in;
    }

    public void setCheck_in(Timestamp check_in) {
        this.check_in = check_in;
    }

    public Timestamp getCheck_out() {
        return check_out;
    }

    public void setCheck_out(Timestamp check_out) {
        this.check_out = check_out;
    }

    public int getOvertime() {
        return overtime;
    }

    public void setOvertime(int overtime) {
        this.overtime = overtime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getModified_reason() {
        return modified_reason;
    }

    public void setModified_reason(String modified_reason) {
        this.modified_reason = modified_reason;
    }
    
    public OvertimeDTO(String emp_id, Timestamp created_at, Timestamp check_in, Timestamp check_out, int overtime, String status, String modified_reason) {
        this.emp_id = emp_id;
        this.created_at = created_at;
        this.check_in = check_in;
        this.check_out = check_out;
        this.overtime = overtime;
        this.status = status;
        this.modified_reason = modified_reason;
    }
}
