package dao;

import util.DBHelper;

import java.sql.*;

public class UserDAO {
	
	public static boolean UserExist(String username) throws ClassNotFoundException, SQLException
	{
		Connection conn=DBHelper.getConnection();
//		Statement st=conn.createStatement();
		String query="select * from users where username=?";
//		ResultSet result =st.executeQuery(query);
		PreparedStatement pst=conn.prepareStatement(query);
		pst.setString(1,username);
		ResultSet result=pst.executeQuery();
		if(result.next())
		{
			return true;
		}
		return false;
	}
	
	public static boolean createNewUser(String username,String password) throws ClassNotFoundException, SQLException
	{
		System.out.println(username);
		System.out.println("开始连接");
		Connection conn=util.DBHelper.getConnection();
		String excute="insert into users(username,password)"+"values(?,?)";
		PreparedStatement st=conn.prepareStatement(excute);
//		Statement st=conn.createStatement();
//		String query="insert into user(username,password) values("+username+","+password+")";
		st.setString(1,username);
		st.setString(2,password);
		if(st.executeUpdate()>0)
		{
			System.out.println("新用户创建成功！");
			return true;
		}else
		{
			System.out.print("用户创建失败");
		}
		return false;
	}
	
	public static void showAllUsers() throws ClassNotFoundException, SQLException
	{
		Connection conn=DBHelper.getConnection();
		Statement st=conn.createStatement();
		String query="select * from users";
		ResultSet result=st.executeQuery(query);
		while(result.next())
		{
			System.out.println(result.getString("username"));
			System.out.println(result.getString("password"));
		}
		
	}
	
	public static boolean doLogin(String username,String password) throws SQLException, ClassNotFoundException
	{
		Connection conn=DBHelper.getConnection();
		String query="select * from users where username=?";
		PreparedStatement pst=conn.prepareStatement(query);
		pst.setString(1, username);
		ResultSet result=pst.executeQuery();
		if(result.next())
		{
			String comfirm=result.getString("password");
			if(password.equals(comfirm))
			{
				return true;
			}else
			{
				return false;
			}
		}
		return false;
	}
	
	public static void main(String args[]) throws ClassNotFoundException, SQLException
	{
//		if(createNewUser("sfsf","dfdg"))
//		{
//			System.out.print("6");
//		}else
//		{
//			System.out.println("失败");
//		}
//		showAllUsers();
//		Connection conn=DBHelper.getConnection();
//		String query="insert into user values(1,'w','w')";
//		PreparedStatement pst=conn.prepareStatement(query);
//		if(pst.executeUpdate()>0)
//		{
//			System.out.println("新建用户成功");
//		}else
//		{
//			System.out.println("创建用户失败");
//		}
		
		
		if(UserExist("w"))
		{
			System.out.println("用户已存在");
		}else
		{
			System.out.println("用户不存在");
		}
		showAllUsers();
		createNewUser("我的世界fsd3","sfsaf");
		if(doLogin("钱","123456"))
		{
			System.out.println("登陆成功");
		}else
		{
			System.out.println("failed");
		}
	}

}
