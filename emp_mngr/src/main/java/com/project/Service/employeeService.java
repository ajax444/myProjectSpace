package com.project.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bean.employee;
import com.project.bean.employeeExample;
import com.project.bean.employeeExample.Criteria;
import com.project.dao.employeeMapper;

@Service
public class employeeService {
      
	  @Autowired
	  employeeMapper empDao;
	  
	  public void savemp(employee emp) {
			
		  empDao.insert(emp);
			
		}
	  
	  
	 
	public List<employee> getAll() {
		
		
		return empDao.selectAll();
	}

	public boolean Check_repit(String username) {
		employeeExample ege = new employeeExample();
		Criteria cri = ege.createCriteria();
		cri.andEmpNameEqualTo(username);
		long count = empDao.countByExample(ege);
		
		return count==0;
	}



	public employee empName(Integer id) {
		
		return empDao.selectByPrimaryKey(id);
		
	}



	public void update(employee employee) {
		
		
		empDao.updateByPrimaryKey(employee);
		
	}



	public void deleteOne(Integer id) {
		empDao.deleteByPrimaryKey(id);
		
		
	}



	public void deleteMulty(List<Integer> ids) {

		employeeExample exam = new employeeExample();
		Criteria cri = exam.createCriteria();
		cri.andEmpIdIn(ids);
		empDao.deleteByExample(exam);
		
		
	}
}
