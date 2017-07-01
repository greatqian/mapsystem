<%@ page import="dao.SearchDAO" %><%--
  Created by IntelliJ IDEA.
  User: 前路漫漫还相见
  Date: 2017/6/11
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String num=request.getParameter("num");
    if(num!=null)
    {
        System.out.println("this num:"+num);
        String name= SearchDAO.searchHouseNumber(num);
        if(name==null)
        {
            out.println("您查询的门牌号不存在");
        }else
        {
            out.println("您查询的门牌号为："+name);
        }
    }
    String searchtype=request.getParameter("searchtype");

    if(searchtype!=null&&searchtype.equals("city"))
    {
        System.out.println(searchtype);
        System.out.println("running..");
        System.out.println("searching city...");
        String citylist=SearchDAO.searchCity();
        System.out.println("searched");
        System.out.println(citylist);
        out.println(citylist);
    }

    if(searchtype!=null&&searchtype.equals("county"))
    {
        System.out.println("searching county...");
        String city=request.getParameter("city");
        System.out.println("the city is:"+city);
        String countylist=SearchDAO.searchCounty(city);
        System.out.println("countylist:"+countylist);
        out.println(countylist);

    }

    if(searchtype!=null&&searchtype.equals("town"))
    {
        String county=request.getParameter("county");
        String townlist=SearchDAO.searchTown(county);
        out.println(townlist);
    }

    if(searchtype!=null&&searchtype.equals("village"))
    {
        String town=request.getParameter("town");
        String villagelist=SearchDAO.searchVillage(town);
        out.println(villagelist);
    }

    if(searchtype!=null&&searchtype.equals("group"))
    {
        String village=request.getParameter("village");
        String grouplist=SearchDAO.searchVillageGroup(village);
        out.println(grouplist);
    }


%>
