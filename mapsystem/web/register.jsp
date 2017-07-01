<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<link rel="stylesheet" type="text/css" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/main.css">
  </head>
  
  <body>
    
    <div data-role="page" id="registerpage">
    	<div data-role="header">
    		<h1>欢迎来到地址编码系统</h1>
    	</div>
    	
    	<div data-role="content">
    		<h2>您好，请注册</h2><hr>
    		<br>
    		<form action="doregister.jsp" method="post" id="form2">
    			<p>用户名<span id="note1" class="note"></span></p>
    			<input type="text" name="username" id="username">
    			<p>密码<span id="note2" class="note"></span> </p>
    			<input type="password" name="password" id="password">
    			<br>
    			<p>
    				<!--<input type="submit" value="点击登录">  -->
    				<a data-role="button" id="toregister" href="#">确认注册</a>
    				
    				<div style="text-align:right;font-size:14px">
    					<a onclick="location.href='index.jsp'">已有账号?点击登录</a>
    				</div>
    			</p>
    		</form>
    		<br>
    		
    	</div>
    	
    	<div data-role="footer" data-position="fixed">
    	 	<h2>hello</h2>
    	</div>
    </div>
    
    <script>
    	$(document).ready(function()
    	{
    		$("#toregister").on("click",function()
    		{
    			var username=$("#username").val();
    			var password=$("#password").val();
    			if(username=="")
    			{
    				$("#note1").text("用户名不能为空"); 
    			}
    			if(password=="")
    			{
    				$("#note2").text("密码不能为空");
    			}
    			if(password.length<6)
    			{
    				$("#note2").text("密码长度必须大于6位");
    			}
    			if(username!=""&&password!=""&&password.length>=6)
    			{
    				var form=document.getElementById("form2");
    				form.submit();
    			}
    			
    		})
    	})
    	
    </script>
  </body>
</html>
