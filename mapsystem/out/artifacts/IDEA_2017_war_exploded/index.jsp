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
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
	<meta name="viewport" content="width=device-width,initial-scale=1">
  </head>
  
  <%
  		String username="";
  		String password="";
  		Cookie[] cookies=request.getCookies();
  		if(cookies!=null)
  		{
  			for(Cookie c:cookies)
  		{
  			if(c.getName().equals("username"))
  			{
  				username=c.getValue();
  			}	
  			if(c.getName().equals("password"))
  			{
  				password=c.getValue();
  			}
  		}
  		}
  		
   %>
  
  <body>
    
    <div data-role="page" id="loginpage">
    	<div data-role="header">
    		<h1>欢迎来到地址编码系统</h1>
    	</div>
    	
    	<div data-role="content">
    		<h2>您好，请登录</h2><hr>
    		<br>
    		<form action="dologin.jsp" method="post" id="form1">
    			<p>用户名<span id="note1" style="display:inline-block;float:right;margin-right:80px;color:red;font-size:13px"></span></p>
    			<input type="text" name="username" id="username" value=<%=username %>>
    			<p>密码<span id="note2" style="display:inline-block;float:right;margin-right:80px;color:red;font-size:13px"></span></p>
    			<input type="password" name="password" id="password" value=<%=password %>>
    			
    			<p>
    				<select data-role="slider" name="cookieflag">
    				  		<option selected value="notsave">记住密码</option>
    				  		<option value="save"></option>
    				</select>
    				
    				<!--<input type="submit" value="点击登录">  -->
    				<a data-role="button" id="tologin" href="">点击登录</a>
    				
    				<div style="text-align:right;font-size:14px">
    					<a onclick="location.href='register.jsp'">没有账号?点击去注册</a>
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
    		$("#tologin").on("click",function()
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
    			if(username!=""&&password!="")
    			{
    				//var url="dologin.jsp?username="+username+"&password="+password;
    				//window.location.href=url;
    				var form=document.getElementById("form1");
    				form.submit();
    			}

    		})
    	})
    	
    </script>
  </body>
</html>
