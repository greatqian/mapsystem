<%--
  Created by IntelliJ IDEA.
  User: 前路漫漫还相见
  Date: 2017/6/10
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>门牌号查询</title>
    <link rel="stylesheet" type="text/css" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
    <div data-role="page">
        <div data-role="header">
            <h2>地址管理系统</h2>
        </div>

        <div data-role="content">
            <br>
            <br>
            <h2>输入门牌号查询</h2>
            <hr>
            <form action="dosearch.jsp" method="post">
                <p>&nbsp<span id="note1" class="note"></span></p>
                <input type="text" name="housenumber" id="housenumber">
                <br>
                <br>
                <input type="button" id="search" value="查询">
                <br>
                <p id="result"></p>
            </form>
        </div>

        <div data-role="footer" data-position="fixed">
            <div data-role="navbar">
                <ul>
                    <li><a data-icon="arrow-l" onclick="location.href='userinfo.jsp'">个人中心</a></li>
                    <li><a data-icon="home" onclick="location.href='maincontent.jsp'">主页</a></li>
                    <li><a data-icon="search" onclick="location.href='mapcontent.jsp'">地图</a></li>
                </ul>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function()
        {
            $("#search").on("click",function()
            {
                var string=$("#housenumber").val();
                if(string.length!=20)
                {
                    $("#note1").text("门牌号长度固定为20位");
                }else
                {
                    search(string);
                }
            })
        })

        function search(num)
        {
            if(window.XMLHttpRequest)
            {
                xmlhttp=new XMLHttpRequest();
            }
            xmlhttp.open("GET","dosearch.jsp?num="+num,true);
            xmlhttp.send();
            $.mobile.loading("show");
            xmlhttp.onreadystatechange=function()
            {
                if(xmlhttp.readyState==4&&xmlhttp.status==200)
                {
                    $.mobile.loading("hide");
                    $("#result").text(xmlhttp.responseText);
                }
            }
        }
    </script>
</body>
</html>
