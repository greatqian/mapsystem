<%--
  Created by IntelliJ IDEA.
  User: 前路漫漫还相见
  Date: 2017/6/12
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>地址对象查询</title>
    <link rel="stylesheet" type="text/css" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<style>
    p{
        font-size: 15px;
    }
</style>
<body>
    <div data-role="page">
        <div data-role="header">
            <h2>地址管理系统</h2>
        </div>

        <div data-role="content">
            <p>城市</p>
            <select id="city">

            </select>

            <p>区/县</p>
            <select id="county" >

            </select>

            <p>乡/镇/街/路</p>
            <select id="town">

            </select>

            <p>村/社区</p>
            <select id="village">

            </select>

            <p>组</p>
            <select  id="group">

            </select>
            <br>
            <div style="text-align: center;color: deepskyblue">
                <b id="locationcode"></b>
            </div>
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
    $(document).ready(function(){
        $("#city").load('dosearch.jsp?searchtype=city');
        $("#city").on("change",function()
        {
            var city=$("#city").val();
            $("#locationcode").text("地址编码："+city);
            $("#county").empty();
            $("#county").load("dosearch.jsp?searchtype=county&city="+city);
        })

        $("#county").on("change",function()
        {
            var county=$("#county").val();
            $("#locationcode").text("地址编码："+county);
            $("#town").empty();
            $("#town").load("dosearch.jsp?searchtype=town&county="+county);
        })

        $("#town").on("change",function()
        {
            var town=$("#town").val();
            $("#locationcode").text("地址编码："+town);
            $("#village").empty();
            $("#village").load("dosearch.jsp?searchtype=village&town="+town);
        })

        $("#village").on("change",function()
        {
            var village=$("#village").val();
            $("#locationcode").text("地址编码："+village);
            $("#group").empty();
            $("#group").load("dosearch.jsp?searchtype=group&village="+village);
        })

        $("#group").on("change",function()
        {
            var group=$("#group").val();
            $("#locationcode").text("地址编码："+group);
        })

    })

</script>
</body>
</html>
