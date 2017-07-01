<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="util.DBHelper" %>
<%@ page import="dao.UserDAO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
	  <link rel="stylesheet" type="text/css" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
	  <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
	  <script type="text/javascript" src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
	  <meta name="viewport" content="width=device-width,initial-scale=1">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    	<%
    		String username="";
    		String password="";
    		request.setCharacterEncoding("utf-8");
    		username=request.getParameter("username");
    		password=request.getParameter("password");
    		
    		if(UserDAO.UserExist(username))
    		{
    		
    	 %>
		<div data-role="page">
			<div data-role="header">
				<h2>地址管理系统</h2>
			</div>

			<div data-role="content" style="text-align: center">
				<br>
				<h3 style="color: red;">该用户名已被占用</h3>
				<h3><a onclick="location.href='register.jsp'">重新注册</a></h3>
			</div>
		</div>
    	 <%
    	 	}
    	 	else
    	 	{
    	 		if(UserDAO.createNewUser(username, password))
    	 		{
    	 		    %>
		<div data-role="page">
			<div data-role="header">
				<h2>地址管理系统</h2>
			</div>

			<div data-role="content" style="text-align: center">
				<br>
				<h3 style="color: red;">注册成功！</h3>
				<h3><a onclick="location.href='index.jsp'">点击跳转到登录页面</a></h3>
			</div>
		</div>
    	 		<%
    	 		} else
    	 		{
    	 			out.println("系统繁忙，请稍后再试");
    	 		}
    	 		
    	 	}
    	 	
    	  %>
    	 
  </body>
</html>
