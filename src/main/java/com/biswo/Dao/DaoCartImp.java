package com.biswo.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.biswo.entity.Cart;

public class DaoCartImp implements DaoCart {
	
	private Connection conn ;

	public DaoCartImp(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addToCart(Cart ct) {
		boolean b = false;
		
		try {
			String sql = "Insert into cart (bid,uid,BookName,author,price,total_price) values(?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			
			//Set the value to the prepared statement 
			pst.setInt(1, ct.getBid());
			pst.setInt(2, ct.getUid());
			pst.setString(3, ct.getBookName());
			pst.setString(4, ct.getAuthor());
			pst.setDouble(5, ct.getPrice());
			pst.setDouble(6, ct.getTotal_price());
			
			//Execute the Prepared Statement
			int count = pst.executeUpdate();
			
			if(count > 0) {
				b = true ;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return b;
	}

	@Override
	public List<Cart> getUserCartById(int userId) {
		Cart cart = null;
		double totalprice = 0;
		List<Cart> list = new ArrayList<Cart>();
		
		try {
			String sql ="Select * from cart where uid = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setInt(1, userId);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				cart = new Cart();
				cart.setCid(rs.getInt(1));
				cart.setBid(rs.getInt(2));
				cart.setUid(rs.getInt(3));
				cart.setBookName(rs.getString(4));
				cart.setAuthor(rs.getString(5));
				cart.setPrice(rs.getDouble(6));
				totalprice = totalprice + rs.getDouble(7);
				cart.setTotal_price(totalprice);
				list.add(cart);
			}
		}catch(Exception e) {
			
		}
		return list;
	}

	@Override
	public boolean removeBookFromCart(int bid,int uid,int cid) {
		boolean b = false;
		
		try {
			String sql = "Delete from cart where bid = ? and uid = ? and cid = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setInt(1, bid);
			pst.setInt(2, uid);
			pst.setInt(3, cid);
			
			int count = pst.executeUpdate();
			
			if(count > 0) {
				b = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
	
	
	

}
