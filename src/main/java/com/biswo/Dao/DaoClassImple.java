package com.biswo.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.biswo.entity.User;

public class DaoClassImple implements Daoclass {
	
	//Here required Connection object
	private Connection conn ;
	
	//Constructor used for implement the Connection object
	public DaoClassImple(Connection con) {
		this.conn = con;
	}

	@Override
	public boolean register(User us) {
		
		boolean status = false;
		//write the SQL query
		String sql = "insert into User (Uname,Uemail,UphoneNo,Upassword) values(?,?,?,?)";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, us.getName());
			pst.setString(2, us.getEmail());
			pst.setString(3, us.getPhNumber());
			pst.setString(4, us.getPassword());
			
			int count = pst.executeUpdate();
			
			if(count > 0) {
				status = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public User login(String email, String password) {
		
		User us = null;
		try {
			String query = "select * from user where Uemail = ? and Upassword = ?";
			
			PreparedStatement pst = conn.prepareStatement(query);
			
			pst.setString(1, email);
			pst.setString(2, password);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhNumber(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPin(rs.getString(10));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return us;
	}

	@Override
	public boolean checkPassword(int id, String password) {
		boolean b = false;
		try {
			String sql = "Select * from user where id = ? and Upassword = ?";
			
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, password);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				b = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean updateProfila(User us) {
		boolean b = false;
		try {
			String sql = "Update user set Uname = ? , Uemail = ?, UphoneNo = ? where id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, us.getName());
			pst.setString(2, us.getEmail());
			pst.setString(3, us.getPhNumber());
			pst.setInt(4, us.getId());
			
			int count = pst.executeUpdate();
			
			if(count >0) {
				b = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean checkUser(String email) {
		boolean b = true;
		try {
			String sql = "Select * from user where Uemail = ?";
			
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				b = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}
}
