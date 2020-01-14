package com.project.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bean.department;
import com.project.dao.departmentMapper;
@Service
public class departmentService {
     
	@Autowired
	private departmentMapper depmap;
	public List<department> getdepAll() {
		
		
		return depmap.selectByExample(null);
	}
 
}
