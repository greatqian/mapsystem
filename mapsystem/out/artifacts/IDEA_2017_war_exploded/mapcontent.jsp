<%--
  Created by IntelliJ IDEA.
  User: 前路漫漫还相见
  Date: 2017/6/10
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>地址查询</title>
    <link rel="stylesheet" type="text/css" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=fOdBDVqnGdlFQh4E7osUW4Clve2VUKAp"></script>
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
</head>
<body>
<div data-role="page">
    <input type="text" placeholder="输入要查询的内容" id="inputlocation">
    <input type="button" data-mini="true" id="search" value="搜索">

    <div data-role="content">

        <div id="allmap" style="width: 100%;height: 550px;margin-top: -25px"></div>

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
<script type="text/javascript">
    $(document).ready(function()
    {
        var map = new BMap.Map("allmap");    // 创建Map实例
        map.centerAndZoom("湘潭",15);
        map.enableScrollWheelZoom(true);
        map.addControl(new BMap.MapTypeControl());

        $("#search").on("click",function()
        {
            var name=$("#inputlocation").val();
            if(name=="")
            {
                return null;
            }else
            {
                var local = new BMap.LocalSearch(map, {
                    renderOptions:{map: map}
                });
                local.search(name);
            }
        })

    })

    function searchLocation(location)
    {

    }
</script>
</body>
</html>
