package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specalist;
import com.entity.User;

public class UserDao {

	
	private Connection conn;
	
	public UserDao(Connection conn) {
	super();
	this.conn=conn;
	}
	
	public boolean register(User u) {
		boolean f=false;
		
		try {
			String sql="insert into user_dtls(full_name,email,password) values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, u.getFullName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
		int i=	ps.executeUpdate();
		
		

		if(i==1) {
			f=true;
		}
		}catch(Exception e){
			
			e.printStackTrace();
		}
		return f;
	}
	
	public User login(String em,String pass) {
		User u=null;
		try {
			
			String sql="select * from user_dtls where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, pass);
			
			ResultSet rs=ps.executeQuery();
	
			while(rs.next()) {
				u=new User();
				u.setId(rs.getInt(1));
				u.setFullName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	
	public int getUserCount() {
		
		int count=0;
		try {
		    String sql="select * from user_dtls";
		    PreparedStatement ps=conn.prepareStatement(sql);
		    ResultSet rs=ps.executeQuery();
		    
		    while(rs.next()) {
		    	count++;
		    }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public boolean updatePassword(String newPass,int id) {
		boolean f=false;
		
		try {
			String sql="update user_dtls set password=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, newPass);
			ps.setInt(2, id);
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return f;
	}
}
