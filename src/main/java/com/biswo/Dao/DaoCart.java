package com.biswo.Dao;

import java.util.List;

import com.biswo.entity.Cart;

public interface DaoCart {
	public boolean addToCart(Cart ct);
	public List<Cart> getUserCartById(int userId);
	public boolean removeBookFromCart(int bid,int uid,int cid);
}
