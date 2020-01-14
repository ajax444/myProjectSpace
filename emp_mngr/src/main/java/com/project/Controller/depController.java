package com.project.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.Service.departmentService;
import com.project.bean.Msg;
import com.project.bean.department;

@Controller
public class depController {
	
	@Autowired
    private departmentService depsvs;
	
	@RequestMapping("/deps")
	@ResponseBody
	public Msg getDepWithjson() {
		List<department> deplist = depsvs.getdepAll();
		return Msg.success().add("deplist", deplist);
	}
}
