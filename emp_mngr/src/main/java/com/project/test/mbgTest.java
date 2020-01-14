package com.project.test;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.Service.employeeService;
import com.project.bean.employee;

public class mbgTest {
	@Autowired
	static
	employeeService Ser;
	 public static void main(String[] args) throws Exception {
		/* List<String> warnings = new ArrayList<String>();
		   boolean overwrite = true;
		   File configFile = new File("src/mbg.xml");
		   ConfigurationParser cp = new ConfigurationParser(warnings);
		   Configuration config = cp.parseConfiguration(configFile);
		   DefaultShellCallback callback = new DefaultShellCallback(overwrite);
		   MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
		   myBatisGenerator.generate(null);*/
		 employee ely =new employee(null,"胡春梅","女","ejj@qqdd",2);

		 Ser.savemp(ely);
		 
	}
}
