package com.project.test;


import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.project.bean.employee;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:ApplicationContext.xml","classpath:springMvc.xml"})
public class mvcTest {
   
	@Autowired
	WebApplicationContext webcontext;
	
	MockMvc mock;
	
	@Before
	public void initMock() {
		mock=MockMvcBuilders.webAppContextSetup(webcontext).build();
	}
	
	
	@Test
	public void start() throws Exception {
		
		MvcResult result = mock.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
		
		//请求成功后 页面会有pageinfo，可以取出pageInfo进行验证
		MockHttpServletRequest request = result.getRequest();
		
		PageInfo pi =(PageInfo)request.getAttribute("pageInfo");
		
		System.out.println("当前页码"+pi.getPageNum());
		System.out.println("总页码"+pi.getPages());
		System.out.println("总记录"+pi.getTotal());
		
		int [] num = pi.getNavigatepageNums();
		for(int i = 0; i<num.length;i++) {
			System.out.print(""+num[i]);
		}
		
		List<employee> list = pi.getList();
		for(employee empl : list) {
			System.out.println("id"+empl.getEmpId());
			System.out.println("name"+empl.getEmpName());
			System.out.println("email"+empl.getEmail());
			System.out.println("gender"+empl.getGender());
			System.out.println("dep_id"+empl.getDepId());
			System.out.println(""+empl.getDepartment().getDepName());
			System.out.println();
		}
	}
}
