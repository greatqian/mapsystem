<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="entity.User" %>
<%@ page import="dao.UserDAO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dologin.jsp' starting page</title>
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
			request.setCharacterEncoding("utf-8");
    		String username="";
    		String password="";
    		username=request.getParameter("username");
    		password=request.getParameter("password");
    		
    		User newUser=new User();
    		newUser.setUsername(username);
    		newUser.setPassword(password);
    		
    		String flag;
    		flag=request.getParameter("cookieflag");

    		
    		if(UserDAO.doLogin(username, password))
    		{
				if(flag.equals("save"))
				{
					Cookie usernamecookie=new Cookie("username",username);
					Cookie passwordcookie=new Cookie("password",password);

					response.addCookie(usernamecookie);
					response.addCookie(passwordcookie);

				}else if(flag.equals("notsave"))
				{
					Cookie [] cookies =request.getCookies();
					for(Cookie c:cookies)
					{
						if(c.getName().equals("username")||c.getName().equals("password"))
						{
							c.setMaxAge(0);
							response.addCookie(c);
						}
					}

				}
    			session.setAttribute("username",username);
    			session.setAttribute("password",password);
    			session.setAttribute("email","");
    		%>
		<div data-role="page">
			<div data-role="header">
				<h2>地址管理系统</h2>
			</div>

			<div data-role="content" style="text-align: center">
				<br>
				<h3>登录成功！</h3>
				<h3>两秒后自动跳转</h3>
			</div>
		</div>

    			<script>
    				setTimeout(function()
    				{
    					window.location.href="maincontent.jsp";
    				},2000);
    			</script>
    		
    		<%
    		}else
    		{
			%>
		<div data-role="page">
			<div data-role="header">
				<h2>地址管理系统</h2>
			</div>

			<div data-role="content" style="text-align: center">
				<br>
				<h3 style="color: red;">用户名或密码不正确</h3>
				<h3><a onclick="location.href='index.jsp'">重新登录</a></h3>
			</div>
		</div>

			<%
    		}

    		
    	 %>
    	 
    	 
    	
    	
  </body>
</html>
