<%--
  Created by IntelliJ IDEA.
  User: 前路漫漫还相见
  Date: 2017/6/10
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
    <div data-role="page">
        <div data-role="header">
            <h1>个人中心</h1>
        </div>

        <div data-role="content" class="change">
            <br>
            <h2>用户名</h2>
            <input type="text" value="<%=session.getAttribute("username") %>" readonly>
            <h2>密码<a href="" id="showpassword" >显示密码</a></h2>
            <input type="text" value="******" id="password" readonly>
            <p id="savepassword" style="display: none"><%=session.getAttribute("password") %></p>
            <br>
            <%--<span id="comfirm" data-role="button" >确认修改</span>--%>
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
//            $("#comfirm").hide();
//            $(".change a").on("click",function()
//            {
//                $("#comfirm").show();
//                var i=$(this).parent().index();
//                i=(i+1)/2;
//                if(i==1){ $(".change input:eq(0)").removeAttr("readonly");$(".change input:eq(0)")[0].focus();}
//                if(i==2){ $(".change input:eq(1)").removeAttr("readonly");$(".change input:eq(1)")[0].focus();}
//                if(i==3){ $(".change input:eq(2)").removeAttr("readonly");$(".change input:eq(2)")[0].focus();}
//            })

            $("#showpassword").on("click",function()
            {
                var password=$("#password").val();
                var relpassword=$("#savepassword").text();
                if(password=="******")
                {
                    $("#password").val(relpassword);
                    $("#showpassword").text("隐藏密码");
                }else
                {
                    $("#password").val("******");
                    $("#showpassword").text("显示密码");
                }
            })


        })
    </script>
</body>
</html>
