package com.biswo.Dao;

import java.util.List;

import com.biswo.entity.Book_Order;

public interface BookOrderDao {
	public boolean saveorder(List<Book_Order> blist);
	public List<Book_Order> getOrderBook(String email);
	public List<Book_Order> getAllOrderBook();
}
