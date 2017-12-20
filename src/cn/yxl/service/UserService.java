package cn.yxl.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.yxl.entity.User;
import cn.yxl.util.DbUtil;


public class UserService {

	public User getUserDetailInfo(int userId){
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		User user=null;
		try{
			con=DbUtil.getConnection();
			String sql="select * from t_user where id=?" ;
			ps=DbUtil.getPreparedStatement(con,sql);
			ps.setInt(1,userId);
			rs=ps.executeQuery();
			while(rs.next()){
				user=new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setAge(rs.getInt("age"));
				user.setSex(rs.getString("sex"));
				user.setImg(rs.getString("img"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtil.closeAll(con,ps,rs);
		}
		return user;
	}

	 public boolean login(String username,String pwd){
		   Connection con=null;
		   PreparedStatement ps=null;
		   ResultSet rs=null;
		   boolean flag=false;
		   try{
			   con=DbUtil.getConnection();
			   String sql="select COUNT(id) from t_user where username=? and password=?" ;
			   ps=DbUtil.getPreparedStatement(con,sql);
			   ps.setString(1, username);
			   ps.setString(2, pwd);
			   rs=ps.executeQuery();
			   while(rs.next()){
				   int num=rs.getInt(1);
				   if(num>0){
					   flag=true;
				   }
			   }
		   }catch(SQLException e){
			   e.printStackTrace();
		   }finally{
			   DbUtil.closeAll(con,ps,rs);
		   }
		   return flag;
	 }
	 public User getuser(String name, String pwd){
		   Connection con=null;
		   PreparedStatement ps=null;
		   ResultSet rs=null;
		   User user=null;
		   try{
			   con=DbUtil.getConnection();
			   String sql="select * from t_user where username=? and password=?" ;
			   ps=DbUtil.getPreparedStatement(con,sql);
			   ps.setString(1, name);
			   ps.setString(2, pwd);
			   rs=ps.executeQuery();
			   while(rs.next()){
				   user=new User();
				   user.setId(rs.getInt("id"));
				   user.setUsername(rs.getString("username"));
				   user.setPassword(rs.getString("password"));
				   user.setAge(rs.getInt("age"));
				   user.setSex(rs.getString("sex"));
				   user.setImg(rs.getString("img"));
			   }
		   }catch(SQLException e){
			   e.printStackTrace();
		   }finally{
			   DbUtil.closeAll(con,ps,rs);
		   }
		   return user;
	 }
	 public void addUser(User user){
	       Connection con=null;
	       PreparedStatement ps=null;
	       ResultSet rs=null;
	       try {
			con=DbUtil.getConnection();
			String sql="insert into t_user(username,password,age,sex,img) values(?,?,?,?,?)";
			ps=DbUtil.getPreparedStatement(con,sql,PreparedStatement.RETURN_GENERATED_KEYS);
			ps.setString(1,user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setInt(3,user.getAge());
			ps.setString(4,user.getSex());
			ps.setString(5,user.getImg());
			ps.executeUpdate();
			rs = ps.getGeneratedKeys();
		    while(rs.next()){
		    	user.setId(rs.getInt(1));
			}
	       } catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DbUtil.closeAll(con, ps, rs);
		}
	       
}
}
