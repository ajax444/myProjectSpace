package com.project.bean;

public class department {
	private Integer depId;

	private String depName;
	
	

	
	public department() {
		super();
	}
	public department(Integer depId, String depName) {
		super();
		this.depId = depId;
		this.depName = depName;
	}
    public Integer getDepId() {
        return depId;
    }

    public void setDepId(Integer depId) {
        this.depId = depId;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName == null ? null : depName.trim();
    }
}