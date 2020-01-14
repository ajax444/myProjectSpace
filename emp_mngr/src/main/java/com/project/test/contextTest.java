package com.project.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.bean.department;
import com.project.bean.employee;
import com.project.dao.departmentMapper;
import com.project.dao.employeeMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:ApplicationContext.xml"})
public class contextTest {
      
	@Autowired
	departmentMapper dep;
	
	@Autowired
	employeeMapper emp;
	
	@Test
	public void testCRUD() {
//		dep.insertSelective(new department(2,"运维部"));
//		dep.insertSelective(new department(3,"测试部"));
		
		String []emPrefix = {"2s22f@","sfaA@","SFAFAF@","2fsafaf@","asf2rfsf@","ssf2f22@","sssss@","55252@","QF25@","wqdq@"};
		String emSuffix="@qq.com";
		String []firstName ={"陈","李","周","马","罗","欧阳","范","钟","上官","熊"};
		String []lastName ={"娜娜","蕾蕾","珍珍","露露","美美","婉儿","峰","冰冰","钟祥","玄德"};
		
		for(int i =101; i<151;i++) {
			//random 0.0<x<1.0 78%10
			int f = (int) (Math.random()*100%10);
			int l = (int) (Math.random()*100%10);
			
			String gender1 = f>5 ? "男":"女";
		
		emp.insert(new employee(i,firstName[f]+lastName[l],gender1,emPrefix[f]+emSuffix,3));
		
			
		}
	}
}  
