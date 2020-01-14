package com.project.bean;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;

public class employee {
    private Integer empId;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",message = "姓名格式错误，请重新输入(来自后台校验)")
    private String empName;

    private String gender;

    //@Email
    @Pattern(regexp = "^(([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5}){1,25})$",message = "邮箱格式错误，请重新输入(来自后台校验)")
    private String email;

    private Integer depId;
    
    
    
    
    
    
    
    public employee() {
		super();
	}

	public employee(Integer empId, String empName, String gender, String email, int depId) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.gender = gender;
		this.email = email;
		this.depId = depId;
	}

	public department getDepartment() {
		return department;
	}

	public void setDepartment(department department) {
		this.department = department;
	}

	private department department;

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getDepId() {
        return depId;
    }

    public void setDepId(Integer depId) {
        this.depId = depId;
    }

	@Override
	public String toString() {
		return "employee [empId=" + empId + ", empName=" + empName + ", gender=" + gender + ", email=" + email
				+ ", depId=" + depId + ", department=" + department + "]";
	}
    
}