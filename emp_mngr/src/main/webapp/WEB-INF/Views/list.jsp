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
<script type="text/javascript" src="static/js/jquery-3.0.0.min.js"></script>
<link rel="stylesheet" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link href="static/bootstrap-3.3.7-dist/js/bootstrap.min.js">


</head>
<body>
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
	     <button class="btn-primary btn-lg">添加</button>
	     <button class="btn-danger btn-lg">删除</button>
	     </div>
     </div>
     
     <!--表格数据  -->
     <div class="row">
	     <table class="table table-hover">
	    <thead>
	     <tr>
	     	<th>id</th>
	     	<th>Name<th>
	     	<th>Gender</th>
	     	<th>Email</th>
	     	<th>Dep_id</th>
	     	<th>Department</th>
	     	<th>操作</th>
	     	<th></th>
	     </tr>
	    </thead>
	    <tbody>
	      
	      
	      
	    
	    </tbody>
<!-- 	   
			     	<button type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
					  <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
					</button>
			     	<button type="button" class="btn btn-danger btn-sm" aria-label="Left Align">
					  <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
					</button>
			     	</th> -->
	     </table>
     </div>
     
     
     
     
      <!-- 显示分页信息 -->
     <div class="row">
       <div class="col-md-6">
   
       </div>
     </div>
     <script type="text/javascript">
      //发送一个Ajax请求，要到分页数据
     
     </script>
     
     
    
  
  

</body>
</html>