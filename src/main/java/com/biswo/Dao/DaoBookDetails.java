package com.biswo.Dao;

import java.util.List;

import com.biswo.entity.BookDetails;

public interface DaoBookDetails {
	public boolean addBook(BookDetails bd);
	public List<BookDetails> disPlayAllBook();
	public BookDetails getDetailsById(int id);
	public boolean updateBookDetails(BookDetails bd);
	public boolean deleteBook(int id);
	public List<BookDetails> getNewBook();
	public List<BookDetails> getRecentBook();
	public List<BookDetails> getOldBook();
	public List<BookDetails> getAllNewBook();
	public List<BookDetails> getAllOldBook();
	public List<BookDetails> getAllRecentBook();
	public List<BookDetails> getDetailsOfOldBook(String email,String cate);
	public boolean deleteOldBook(String email,String cate,int id);
	public List<BookDetails> getBookDetailsBySearch(String ch);
}
