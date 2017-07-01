<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>地址管理系统</title>
	<link rel="stylesheet" type="text/css" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
	  <link rel="stylesheet" type="text/css" href="css/main.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    	<div data-role="page">
    		<div data-role="header">
    			<h1>地址管理系统</h1>
    		</div>
			<br>
			<br>
			<br>
    		<div data-role="content">
    			<ul data-role="listview" id="search">
    				<li><a onclick="location.href='housenumber.jsp'">门牌号查询</a></li>
    				<li><a onclick="location.href='locationsearch.jsp'">地址对象查询</a></li>
    			</ul>
    		</div>

    		<div data-role="footer">
    			<div data-role="navbar" data-position="fixed">
					<ul>
						<li><a data-icon="arrow-l" onclick="location.href='userinfo.jsp'">个人中心</a></li>
						<li><a data-icon="home" onclick="location.href='maincontent.jsp'">主页</a></li>
						<li><a data-icon="search" onclick="location.href='mapcontent.jsp'">地图</a></li>
					</ul>
    			</div>
    		</div>
    	</div>
    	
  </body>
</html>
