package util;

import java.sql.*;

public class DBHelper {
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException
	{
		Class.forName("com.mysql.jdbc.Driver");
		
		String url="jdbc:mysql://localhost:3306/mapsystem?useUnicode=true&characterEncoding=utf8";
		String username="root";
		String password="";
		Connection conn=DriverManager.getConnection(url,username,password);
		
		return conn;
		
	}
	
	public static void main(String args[]) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();
		if(conn!=null)
		{
			System.out.println("连接成功！");
			
			Statement st=conn.createStatement();
			String query="select * from housenumber";
			ResultSet result=st.executeQuery(query);
			while(result.next())
			{
				String number=result.getString("num");
				String name=result.getString("name");
				System.out.println("num:"+number);
				System.out.println("name:"+name);
				
			}
			
			
			
			
		}else
		{
			System.out.println("无法连接");
		}
	}

}
