package com.project.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.project.Service.employeeService;
import com.project.bean.Msg;
import com.project.bean.employee;
import com.project.bean.employeeExample;
import com.project.bean.employeeExample.Criteria;
import com.sun.xml.internal.org.jvnet.staxex.NamespaceContextEx.Binding;

import net.sf.jsqlparser.util.AddAliasesVisitor;

@Controller
public class employeeList {
	
      @Autowired
	employeeService emplService;
      
      @RequestMapping(value="/emps", method=RequestMethod.POST) 
      @ResponseBody
     public Msg saveEmp( @Valid employee employee,BindingResult result) {
    	  System.out.println(employee);
    	 if(result.hasErrors()) {                       //如果有错误（包括但不仅限于重复，字段错误），则返回失败信息
//    		 Map<String,Object> map = new HashMap<>();
    		 List<String> e= new ArrayList<>();
    		 List<FieldError> erros =  result.getFieldErrors();
    		 for(FieldError err:erros) {
    			
    			
    			 e.add(err.getField()+":"+err.getDefaultMessage());
    		 }
   
    		 return Msg.fail().add("valid_Error",e);
    	 }
    	 
    		  
    	  return Msg.success(); 
      }
      
      
      
      
      @RequestMapping("/emps")
      @ResponseBody
      public Msg getempsWithJson(@RequestParam(value="pn",defaultValue = "1")Integer pn,
  			Model model){
    	  
    		PageHelper.startPage(pn, 5);
    		
    		List<employee> emp = emplService.getAll();
    	/*	String orderBy="字段名 排序规律"；

    				PageHelper.startPage(pageNum, pageSize, orderBy)*/
    		String orderBy="empId asc";
    		PageHelper.startPage(pn,5);
    		
    	    PageInfo page = new PageInfo(emp,7);
    	    
    	    return Msg.success().add("pageInfo", page);
      }
      
      
	 
	@RequestMapping(value="/temps", method=RequestMethod.POST)
	@ResponseBody
	public Msg emps(employee employee) {
		 emplService.savemp(employee);
		
		return Msg.success();
		
	}

	 /*
	  * 对姓名进行检测
	  *返回true：可用，无重复
	  *返回false： 有重复
	  */
	@ResponseBody
	@RequestMapping("/check")
	public Msg Check(@RequestParam("empName")String empName) {
		boolean t = emplService.Check_repit(empName);
		//一，用户名格式校验。。。。。。。。
		String jy = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if(!empName.matches(jy)) {
			return Msg.fail().add("fail_detail", "姓名格式错误，请重新输入(来自后台核对)");
		}
		//二，用户名重复校验。。。。。。。。。。
		if(t) {
			return Msg.success();
			
		}else {
			return Msg.fail().add("fail_detail", "此用户已存在(来自后台核对)");
		}
	}
	@RequestMapping(value="/emp/{id}",method = RequestMethod.GET)
	@ResponseBody
	public Msg getid(@PathVariable("id")Integer id) {
		
		return Msg.success().add("Name", emplService.empName(id));
		
	}
	
	
	@RequestMapping(value="/eee",method = RequestMethod.POST)
	@ResponseBody
	public Msg update(employee employee){
		System.out.println(employee);
		emplService.update(employee);
		 return Msg.success();
	}
	
	
	
	@RequestMapping(value="/delete",method = RequestMethod.POST)
	@ResponseBody
	public Msg delete(Integer id) {
		/*
		 * if(id.contains(",")) { String[] ids = id.split(","); }
		 */
		System.out.println();
		emplService.deleteOne(id);
	    return Msg.success();
		
	}
	
	
	
	
	  @RequestMapping(value="/deletebatch",method = RequestMethod.GET)
	  @ResponseBody 
	  public Msg delete2 (String batch) { 
		  System.out.println(batch+"==================================================================================="); 
          String[] ids = batch.split(","); 
          List<Integer> idss = new ArrayList<>();
          for(String s :ids) {
        	  idss.add(Integer.parseInt(s));
          }
          
	      emplService.deleteMulty(idss);
	  return Msg.success();
	  
	  }
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
