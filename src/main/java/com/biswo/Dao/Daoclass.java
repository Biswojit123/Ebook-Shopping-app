package com.biswo.Dao;

import com.biswo.entity.User;

public interface Daoclass {
	public boolean register(User us);
	public User login(String email,String password);
	public boolean checkPassword(int id , String password);
	public boolean updateProfila(User us);
	public boolean checkUser(String email);
}
