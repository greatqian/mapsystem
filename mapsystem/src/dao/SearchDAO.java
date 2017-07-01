package dao;

import util.DBHelper;

import java.sql.*;

/**
 * Created by 前路漫漫还相见 on 2017/6/11.
 */
public class SearchDAO {

    public static String searchHouseNumber(String num) throws ClassNotFoundException, SQLException {

        System.out.println("查询方法执行了1");
        System.out.println("num:"+num);
        Connection conn=DBHelper.getConnection();
        String query="select * from housenumber where num=?";
        PreparedStatement pst = conn.prepareStatement(query);
        pst.setString(1,num);
        ResultSet result =pst.executeQuery();
        if(result.next())
        {
            String name=result.getString("name");
            System.out.println("founded");
            System.out.println(name);
            return name;
        }else
        {
            System.out.println("not found");
        }
        return null;

    }

    public static String searchCity() throws SQLException, ClassNotFoundException {

        Connection conn=DBHelper.getConnection();
        String query="select * from city";
        Statement st=conn.createStatement();
        ResultSet result=st.executeQuery(query);
        String citys="";
        while(result.next())
        {
            String num=result.getString("num");
            String name=result.getString("name");
            citys+="<option value="+"\""+num+"\""+">"+name+"</option>";
        }
        System.out.println(citys);
        return citys;
    }

    public static String searchCounty(String city) throws SQLException, ClassNotFoundException {

        Connection conn=DBHelper.getConnection();
        String query="select * from county where father_num=?";
        PreparedStatement pst=conn.prepareStatement(query);
        pst.setString(1,city);
        ResultSet result=pst.executeQuery();
        String countys="";
        while(result.next())
        {
            String num=result.getString("num");
            System.out.println(num);
            String name=result.getString("name");
            System.out.println(name);
            countys+="<option value="+"\""+num+"\""+">"+name+"</option>";
        }
        System.out.println(countys);
        return countys;
    }

    public static String searchTown(String county) throws SQLException, ClassNotFoundException {

        Connection conn=DBHelper.getConnection();
        String query="select * from town where father_num=?";
        PreparedStatement pst=conn.prepareStatement(query);
        pst.setString(1,county);
        ResultSet result=pst.executeQuery();
        String townlist="";
        while(result.next())
        {
            String num=result.getString("num");
            String name=result.getString("name");
            townlist+="<option value="+"\""+num+"\""+">"+name+"</option>";
        }
        System.out.println("townlist:"+townlist);
        return townlist;

    }

    public static String searchVillage(String town) throws SQLException, ClassNotFoundException {

        Connection conn=DBHelper.getConnection();
        String query="select * from village where father_num=?";
        PreparedStatement pst=conn.prepareStatement(query);
        pst.setString(1,town);
        ResultSet result=pst.executeQuery();
        String villagelist="";
        while(result.next())
        {
            String num=result.getString("num");
            String name=result.getString("name");
            villagelist+="<option value="+"\""+num+"\""+">"+name+"</option>";
        }
        System.out.println("villagelist:"+villagelist);
        return villagelist;

    }public static String searchVillageGroup(String village) throws SQLException, ClassNotFoundException {

        Connection conn=DBHelper.getConnection();
        String query="select * from villagegroup where father_num=?";
        PreparedStatement pst=conn.prepareStatement(query);
        pst.setString(1,village);
        ResultSet result=pst.executeQuery();
        String villagegrouplist="";
        while(result.next())
        {
            String num=result.getString("num");
            String name=result.getString("name");
            villagegrouplist+="<option value="+"\""+num+"\""+">"+name+"</option>";
        }
        System.out.println("villagegrouplist:"+villagegrouplist);
        return villagegrouplist;

    }



    public static void main(String args[]) throws SQLException, ClassNotFoundException {

        System.out.println("方法执行了");
//        searchCity();
//        System.out.println("countys:");
//        searchCounty("430");
//        searchTown("430311");
        searchVillage("430302002");
        searchVillageGroup("430302002001");
    }
}
