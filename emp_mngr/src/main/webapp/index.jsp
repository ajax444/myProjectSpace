<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工页面</title>
<%
  pageContext.setAttribute("APPpath",request.getContextPath());
%>
<link rel="stylesheet" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<script type="text/javascript" src="static/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


</head>
<body>








<div class="modal fade" id="update_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改一名员工</h4>
      </div>
      
      <div class="modal-body">
      								<!--update 表单 -->				
		  <form class="form-horizontal" id="form2">
		  
			         <div class="form-group">
				        <label  class="col-sm-2 control-label">姓名:</label>
					    <div class="col-sm-10">
					       <p class="form-control-static" id="ename"></p>
					     
					    </div>

					  </div>
					  
					  
	                 <div class="form-group">
					    <label  class="col-sm-2 control-label">Email</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="email" id="email_update" placeholder="正确如：xxx@xxx.com">
					    <span class="help-block"></span>
					    </div>
					  </div>
					
					 
					  
					  <div class="form-group">
					    <label  class="col-sm-2 control-label">性别</label>
					    <div class="col-sm-10">
					    
				            <label class="radio-inline">
					          <input type="radio" name="gender" id="gender_update1" value="男" checked="男"> 男
							</label>
							
							<label class="radio-inline">
						      <input type="radio" name="gender" id="gender_update2" value="女"> 女
							</label>
							
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label  class="col-sm-2 control-label">部门:</label>
					    <div class="col-sm-4">
					      <select class="form-control" name="depId" id="update_did">
							  
							
						  </select> 
					    </div>
					  </div>
					  
			
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary col-sm-3" id="update_emp_btn">修改</button>
        <button type="button" class="btn btn-default col-sm-3" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>








 






 <!--新增模态框  -->
<div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">新增一名员工</h4>
      </div>
      
      <div class="modal-body">
      								<!-- 表单 -->				
		  <form class="form-horizontal" id="formm">
		  
			         <div class="form-group">
				        <label  class="col-sm-2 control-label">姓名:</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="empName"  id="name_add" placeholder="由3-16个字母或者2-5个中文组成：lisa，李明。。">
					      <span  class="help-block"></span>
					    </div>

					  </div>
					  
					  
					  
					  
	                 <div class="form-group">
					    <label  class="col-sm-2 control-label">Email</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="email" id="email_add" placeholder="正确如：xxx@xxx.com">
					    <span class="help-block"></span>
					    </div>
					  </div>
					
					 
					  
					  <div class="form-group">
					    <label  class="col-sm-2 control-label">性别</label>
					    <div class="col-sm-10">
					    
				            <label class="radio-inline">
					          <input type="radio" name="gender"  value="男" checked="男"> 男
							</label>
							
							<label class="radio-inline">
						      <input type="radio" name="gender"  value="女"> 女
							</label>
							
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label  class="col-sm-2 control-label">部门:</label>
					    <div class="col-sm-4">
					      <select class="form-control" name="depId" id="add_did">
							  
							
						  </select> 
					    </div>
					  </div>
					  
			
		</form>
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-default" id="check_name">检查可用</button>
        <button type="button" class="btn btn-primary col-sm-3" id="save_emp_btn">保存</button>
        <button type="button" class="btn btn-default col-sm-3" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>







  <div class="container">
  		<!--   标题 -->
     <div class="row">
	     <div class="col-md-12">
	       <h1>员工信息</h1>
	     </div >
     </div>
     
      <!--  按钮 -->
     <div class="row">
	     <div class="col-md-5 col-md-offset-10">
	     <button class="btn-primary btn-lg" id="add_btn">添加</button>
	     <button class="btn-danger btn-lg" id="remove_btn">删除</button>
	     </div>
     </div>
     
     <!--表格数据  -->
     <div class="row">
	     <table class="table table-hover" id="tab">
	    <thead>
	     <th>
	      <input type="checkbox" id="check_all">
	     	<th>id</th>
	     	<th>姓名</th>
	     	<th>性别</th>
	     	<th>Email</th>
	     	<th>部门</th>
	     	<th>操作</th>
	     </th>
	    </thead>
	    <tbody>
	    
	    </tbody>
	     </table>
     </div>
     
      <!-- 显示分页信息 -->
     <div class="row">
     <!--分页文字信息  -->
        <div class="col-md-6" id="infoArea">
       
		</div>
		    <!-- 分页条信息 -->
		   <div class="col-md-6" id="pageArea">
		     
           </div>
       
     </div>
     
     
     
     <!-- ============================================script分割线=============================================== -->
     
     
     
     
     
     
     <script type="text/javascript">
     $(function(){
    	  to_page(1);
      }) 
     
     
     function to_page(pn){
    	  
    	  //请求分页数据的Ajax///////////
    		$.ajax({
        		url:"${pageContext.request.contextPath }/emps",
        		data:"pn="+pn,
        		type:"GET",
        		success:function(result){
        			//填充表格方法
        			table_build(result);
        			
        			//分页页数和数据总量的情况显示
        			page_info(result);
        			
        			//navigate：首页末页，上下页，1-7页排列
        			nav(result);
        			//解析并显示员工信息
        			//解析并显示分页信息
        			
        		}
        	});
     }
     
     
   
      
     
      
      function table_build(result){
    	  $("#tab tbody").empty();
    	  var emps = result.extend.pageInfo.list;
    	  $.each(emps,function(index,item){
    		  var check = $( " <td><input type='checkbox' class='check_one'/></td>");
    		  var id = $("<td></td>").append(item.empId);  //遍历后台数据list的每一条用户资料，并放入td标签中，
    		  var name = $("<td></td>").append(item.empName);
    		  var gender = $("<td></td>").append(item.gender);
    		  var email = $("<td></td>").append(item.email);
    		  //var depId = $("<td></td>").append(item.department.depId);
    		  var depName = $("<td></td>").append(item.department.depName);
    		  var btn = $("<button></button>").addClass("btn btn-warning btn-sm edit_btn")
    		             .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
    		        btn.attr("edit_id",item.empId);     
    		  var btn2 = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
    		             .append($("<span></span>").addClass("glyphicon glyphicon-remove")).append("删除");
    		     btn2.attr("delete_id",item.empId);
    		  var tt = $("<td></td>").append(btn).append("  ").append(btn2);
    		  $("<tr></tr>")
    		  .append(check)
    		  .append(id)
    		  .append(name)
    		  .append(gender)
    		  .append(email)
    		  .append(depName)
    		  .append(tt)
    		  .appendTo("#tab tbody"); //每个tr标签放入tab body
    	  })
      }
      
      
      //分页信息方法
      //显示分页信息
      function page_info(result){
     	  $("#infoArea").empty(); 
    	  $("#infoArea").append("当前第"+result.extend.pageInfo.pageNum+"页,共"
    			  +result.extend.pageInfo.pages+"页,总共"+result.extend.pageInfo.total+"条数据")
    	  
      }
      //显示分页条 
      function nav(result){
    	  $("#pageArea").empty();
    	  var first = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
    	  
    	  var pre = $("<li></li>").append($("<a></a>").append("&laquo;"));
    	  
    	   if(result.extend.pageInfo.hasPreviousPage==false){
    		   first.addClass("disabled");
    		   pre.addClass("disabled");
    	   }else{
    		   
    	    	pre.click(function(){
    	    			  to_page(result.extend.pageInfo.pageNum-1);
    	    		   });
    	 		   first.click(function(){
    	 			  
    	 			 to_page(1);
    	 			 });  
    	   }
    	   
    	  var next = $("<li></li>").append($("<a></a>").append("&raquo;"));
    	  
    	  var last = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
    	  
	    	  if(result.extend.pageInfo.hasNextPage==false){
	    		  next.addClass("disabled");
	    		  last.addClass("disabled");
	    	  }else{
	    		  next.click(function(){ 
	    	 			 to_page(result.extend.pageInfo.pageNum+1);}
	    	 		 );
	    	 		
	    	 		   
	    	 		  last.click(function(){
	    	 			  
	    	 			 to_page(result.extend.pageInfo.pages);}
	    	 		  ); 
	    	  }
	    	  
    	  var ul =$("<ul></ul>").addClass("pagination")
    	          .append(first).append(pre);
    	  
    	  $.each(result.extend.pageInfo.navigatepageNums,function(index,item){
    		  var li = $("<li></li>").append($("<a></a>").append(item));
    		  if(result.extend.pageInfo.pageNum==item){
    			 li.addClass("active");
    		  }
    		  
    		  //分页条的点击事件================
    	li.click(function(){
    			  to_page(item);
    		    });
    		  ul.append(li);
    	  });
    	  
    		  ul.append(next).append(last);
    		  var navv = $("<nav></nav>").append(ul).appendTo("#pageArea");
      }
      
      
      //表单清空方法，进行初始化清空原有数据
      function clean(ele){
    	  //清空表单原有数据
    	  $(ele)[0].reset();
    	  //清空表单原有样式
    	  $(ele).find("*").removeClass("has-error has-success");
    	  $(ele).find("help-block").text("");
      }
      
      
      
      $("#add_btn").click(function(){
    	  //点开按钮 ，执行清空属性
    	  clean("#formm");
    	 //$("#formm")[0].reset();
    	  //调用发送查询department信息方法，点击按钮及查询部门信息
    	  getDepNames("#add_modal select");
    	  $("#add_modal").modal({
    		  backdrop:"static"
    	  });
      });
      
      
      
      
      
      //发送Ajax请求并get department信息
       function getDepNames(ele){
    	  $(ele).empty();
    	  //拿到的Ajax如下
    	 /*  {"code":100,"msg":"成功","extend":{"deplist":[{"depId":1,"depName":"开发部"},
    		  {"depId":2,"depName":"运维部"},{"depId":3,"depName":"测试部"}]}} */
    		  
    		  
    		  
    	   $.ajax({
    		   url:"${pageContext.request.contextPath }/deps",
    		   type:"GET",
    		   success:function(result){
    			   //consol.log(result);
    			   //$("#depid_add").
    			   $.each(result.extend.deplist,function(){
    				   var option = $("<option></option>")
			    				   .append(this.depName)
			    				   .attr("value",this.depId)
			    				   .appendTo(ele);
    				   
    			   });
    			   
    		   }
    	   });
       }
      
      
      
      
      
      
      ////////////设置姓名输入框内容改变事件，检查用户名是否重复
      $("#name_add").change(function(){ 
    	  name_validate();
    	  
    	
      });
      
      
      //Email输入框变化事件////////////////////////////////////
      $("#email_add").change(function(){ 
    	  
    	  email_validate();
    	  
    	
      });
      
      
      //后台姓名重复校验///////////////
      
      function check_repeat(){
    	   var emp = $("#name_add").val();                      //一，获取输入框改变后的值
    	  
     	 $.ajax({                                   
     		 
     		 url:"${pageContext.request.contextPath }/check",  //发送Ajax请求到------/check，
     		 type:"POST",
     		 data:"empName="+emp,                     //提交姓名并让后台查找重复
     		 success:function(result){
     			 
     			 if(result.code==100){                  //没有重复则后台返回code=100
     				 
     				 show_validate("#name_add","success","姓名可用（来自后台检验）");  //成功反馈信息
     				 
     				return true;
     				 
     		    }else if(result.code==200){ 
     		    	
     		    	
     				 
     				 show_validate("#name_add","error",result.extend.fail_detail);  //失败反馈信息
     				 
     			 }
     		 }
     	 }); 
      }
      
      
      $("#check_name").click(function(){
    	  //检查姓名重复
    	  check_repeat();
    	  
    	  
      });
      
      function setDisable(){
    	  
    	  $("#save_emp_btn").removeAttr("ajax-va");
    	  $("#save_emp_btn").attr("ajax-va","fail"); 
      }
      
      
      
      
      
      ///////////////////////添加一名员工保存按钮点击事件
      //点击按钮调用前台校验方法进行前台校验
      //
       $("#save_emp_btn").click(function(){
    	   
    	  //保存按钮前的前台数据校验方法
    	    //alert($("#save_emp_btn").attr("ajax-va"));
     /*   if(!validate_add_form()){
    		  return false;  
    	  }  */
    	  name_validate();
    	  email_validate();
    	  check_repeat();
    	 if($("#save_emp_btn").attr("ajax-va")=="fail"){    //如果保存按钮查出重复，则直接结束点击事件，按钮失效（只针对姓名）
    		  //alert("输入有误");
    		  $("#save_emp_btn").removeAttr("ajax-va");
    		  
    		  return false;
    	  
    	  }  
    			  $("#add_modal").modal("hide");
    	  
    			  alert("保存成功，顺序按depId排列");
    	  
    	  var tt1 = $("#formm").serialize();
    	  
	      tt1 = decodeURIComponent(tt1,true); 
    	   $.ajax({ 
    		  url:"${pageContext.request.contextPath }/temps", 
    		  type:"POST",
    		  data:tt1,
    		  success:function(result){
    			 if(result.code==100){
    				 alert("丢你楼某,success");
    			 }
    			 
    		  }
    	 }); 
      }); 
      
      
      
      
      
      
      
      //前台校验
          //数据提交校验方法=========================前台校验方法，一共分为姓名格式检验，和邮箱格式检验
        function name_validate(){
    	  
        	var name = $("#name_add").val();
        	
        	var checkedName=/(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/; 
        	
        	if(!checkedName.test(name)){
        		
        		show_validate("#name_add","error","姓名格式错误，请重新输入");
        		
        		//alert("姓名格式错误，请重新输入");
        	 /* $("#name_add").parent().addClass("has-error");
        	 
        		$("#name_add").next("span").text("姓名格式错误，请重新输入"); 
        		 */
        	return false;
        	
        	}else{
        		show_validate("#name_add","success","");
        		
        		/*  $("#name_add").next("span").text("");
        		 
        		$("#name_add").parent().addClass("has-success");  */
        	return true;
        	}
        }
      
      
      
      
          function email_validate(){
        	  
        		////////////////////////////////////////////////////////邮箱校验
          	var email = $("#email_add").val();
          	
          	///^(([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})$/
          	var checkedEmail =/^(([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})$/;
          	
          	if(!checkedEmail.test(email)){
          		
          		show_validate("#email_add","error","邮箱格式错误，请重新输入(来自前台校验)");//检查Email
          		
          		/*  $("#email_add").parent().addClass("has-error");
          		
          		$("#email_add").next("span").text("邮箱格式错误，请重新输入(来自前台校验)");  */
          	return false;
          		
          	}else{
          		
          		show_validate("#email_add","success","");
          		
          		/*  $("#email_add").next("span").text("");
          		 
          		$("#email_add").parent().addClass("has-success"); */ 
          		
          		return true;
          	}
          }
      
      
      
      
      
      
      
      
      
          ///////////////输入提示信息检查反馈==========================反馈错误信息方法，
          //ele:属性id值 如"#name_add"
          //status:判断成功或者有错误
          //msg：打印反馈信息
          function show_validate(ele,status,msg){
        	  //清除原有的提示信息
        	  $(ele).next("span").text("");
      		  $(ele).parent().removeClass("has-success has-error");
        	  if("success"==status){
        		  $(ele).next("span").text(msg);
          		  $(ele).parent().addClass("has-success");
          		  
        	  }else if("error"==status){
        		  $(ele).parent().addClass("has-error");
          		  $(ele).next("span").text(msg);
          		setDisable();
        	  }
          }
          
           $(document).on("click",".edit_btn",function(){
        	   
        	   getEmp($(this).attr("edit_id"));
        	 // alert("sss");
        	  
        	 getDepNames("#update_modal select");
        	 
        	 $("#update_emp_btn").attr("edit_id",$(this).attr("edit_id"));
        	 $("#update_modal").modal({
        		 backdrop:"static"
        	 });
        	 
          });
           function getEmp(id){
        	   $.ajax({
          		 url:"${pageContext.request.contextPath }/emp/"+id,
          		 type:"GET",
          		 success:function(result){
          			 //console.log(result);
          			 
          			 var empdata = result.extend.Name;
          			 $("#ename").text(empdata.empName);
          			 $("#email_update").val(empdata.email);
          			 $("#update_modal input[type=radio]").val([empdata.gender]);
          			 $("#update_did").val([empdata.depId]);
          		 }
          	 });
           }
           $("#update_emp_btn").click(function(){
        	  var tt2 = $("#form2").serialize()
        	  
	            tt2 = decodeURIComponent(tt2,true);
        	  
        	  var id = $(this).attr("edit_id");
        	  var name = $(this).parents("tr").find("td:eq(1)").text();
        	   //前端校验
        		var email = $("#email_update").val();
              	
              	var checkedEmail =/^(([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})$/;
              	
              	if(!checkedEmail.test(email)){
              		
              		show_validate("#email_update","error","邮箱格式错误，请重新输入(来自前台校验)");//检查Email
              		
              	return false;
              		
              	}else{
              		
              		show_validate("#email_update","success","");
              		
              	}
              		
              	$.ajax({ 
              		url:"${pageContext.request.contextPath }/eee",
              		type:"post",
              		data:"empId="+id+"&"+"empName="+name+"&"+tt2,
              		success:function(result){
              			if(result.code==100){
              				 $("#update_modal").modal("hide");
              		    	  alert("修改成功");
              			}
              			
              		}
          	  
              		
              	});
              	
           });
           
           
           //单个删除
           $(document).on("click",".delete_btn",function(){
        	   var name = $(this).parents("tr").find("td:eq(2)").text();
        	  // alert($(this).attr("delete_id"));
        	   var id=$(this).attr("delete_id")
        	   if(!confirm("确认删除“"+name+"”吗？")){
        		   return false;
        		   
        	   }
        		   $.ajax({
            		   url:"${pageContext.request.contextPath }/delete",
            		   type:"POST",
            		   data:"id="+id,
            		   success:function(result){
            			   if(result.code==100){
            				   alert("删除成功，,请刷新页面，奥里给！");
            			   
            		   }else{
            			   alert("好像出了点什么问题");
            			   
            		   }
            		 }  
            	   });
        	   
        	   
        	   
           });
           
           
           $("#check_all").click(function(){
        	   //alert($(this).prop("checked"));
        	   $(".check_one").prop("checked",$(this).prop("checked"));
        	   
           });
           
           
           $(document).on("click",".check_one",function(){
        	   var tt = $(".check_one:checked").length == $(".check_one").length;
        	   $("#check_all").prop("checked",tt);
           });
              $("#remove_btn").click(function(){
            	  var empId ="";
            	  var empName = "";
            	  $.each($(".check_one:checked"),function(){
            		 //alert( $(this).parents("tr").find("td:eq(1)").text());
            		 empId += $(this).parents("tr").find("td:eq(1)").text()+",";
            		  empName += $(this).parents("tr").find("td:eq(2)").text()+",";
            		 
            	  });
            	  if(!confirm("确定删除以下员工吗？\n"+empName)){
            		  return false;
            	  }
            	  $.ajax({
           		   url:"${pageContext.request.contextPath }/deletebatch",
           		   type:"get",
           		   data:"batch="+empId,
           		   success:function(result){
           			   if(result.code==100){
           				   alert("删除成功，,请刷新页面，奥里给！");
           			   
           		   }else{
           			   
           			   alert("好像出了点什么问题");
           			   
           		   }
           		 }  
           	   });
              });
     </script>
     
     
</body>
</html>