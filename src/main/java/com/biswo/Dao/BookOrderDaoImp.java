package com.biswo.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.biswo.entity.Book_Order;

public class BookOrderDaoImp implements BookOrderDao {

	private Connection conn = null;

	public BookOrderDaoImp(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean saveorder(List<Book_Order> blist) {
		boolean f = false;
		try {
			String sql = "Insert into book_order(order_id,email,address,phone,book_name,author,price,user_name,payment_type) values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement pst = conn.prepareStatement(sql);

			for (Book_Order b : blist) {
				pst.setString(1, b.getOrderId());
				pst.setString(2, b.getEmail());
				pst.setString(3, b.getFulladd());
				pst.setString(4, b.getPhoneNo());
				pst.setString(5, b.getBookName());
				pst.setString(6, b.getAuthor());
				pst.setDouble(7, b.getPrice());
				pst.setString(8, b.getUserName());
				pst.setString(9, b.getPaymentType());
				pst.addBatch();
			}

			int[] count = pst.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Book_Order> getOrderBook(String email) {
		ArrayList<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order book = null;

		try {
			String sql = "Select * from book_order where email = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				book = new Book_Order();
				book.setId(rs.getInt(1));
				book.setOrderId(rs.getString(2));
				book.setEmail(rs.getString(3));
				book.setFulladd(rs.getString(4));
				book.setPhoneNo(rs.getString(5));
				book.setBookName(rs.getString(6));
				book.setAuthor(rs.getString(7));
				book.setPrice(rs.getDouble(8));
				book.setUserName(rs.getString(9));
				book.setPaymentType(rs.getString(10));
				list.add(book);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Book_Order> getAllOrderBook() {
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order book = null;

		try {
			String sql = "Select * from book_order";
			PreparedStatement pst = conn.prepareStatement(sql);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				book = new Book_Order();
				book.setId(rs.getInt(1));
				book.setOrderId(rs.getString(2));
				book.setEmail(rs.getString(3));
				book.setFulladd(rs.getString(4));
				book.setPhoneNo(rs.getString(5));
				book.setBookName(rs.getString(6));
				book.setAuthor(rs.getString(7));
				book.setPrice(rs.getDouble(8));
				book.setUserName(rs.getString(9));
				book.setPaymentType(rs.getString(10));
				list.add(book);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
