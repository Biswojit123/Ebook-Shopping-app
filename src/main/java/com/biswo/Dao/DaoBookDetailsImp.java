package com.biswo.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.biswo.entity.BookDetails;

public class DaoBookDetailsImp implements DaoBookDetails {
	private Connection conn;

	public DaoBookDetailsImp(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBook(BookDetails bd) {
		boolean status = false;
		try {
			String sql = "insert into book_details(BookName,Author,Price,Category,Status,Photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, bd.getBookName());
			pst.setString(2, bd.getAuthor());
			pst.setDouble(3, bd.getPrice());
			pst.setString(4, bd.getCategories());
			pst.setString(5, bd.getStatus());
			pst.setString(6, bd.getPhoto());
			pst.setString(7, bd.getEmail());

			// Execute the SQL query
			int count = pst.executeUpdate();

			if (count > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public List<BookDetails> disPlayAllBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;
		String sql = "select * from book_details";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				book = new BookDetails();
				// Here set the record to book details object
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setCategories(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhoto(rs.getString(7));
				book.setEmail(rs.getString(8));
				// Add the book to list
				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDetails getDetailsById(int id) {
		BookDetails book = null;

		try {
			String sql = "Select * from book_details where BookId = ?";

			PreparedStatement pst = conn.prepareStatement(sql);

			// Set the id to the statement
			pst.setInt(1, id);

			// Execute the Prepared statement
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				book = new BookDetails();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setCategories(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhoto(rs.getString(7));
				book.setEmail(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}

	@Override
	public boolean updateBookDetails(BookDetails bd) {
		boolean b = false;
		try {
			String sql = "Update book_details set BookName = ?,Author = ?,Price = ?,Status = ? where BookId = ? ";

			PreparedStatement pst = conn.prepareStatement(sql);

			// set the Value to the Prepared statement
			pst.setString(1, bd.getBookName());
			pst.setString(2, bd.getAuthor());
			pst.setDouble(3, bd.getPrice());
			pst.setString(4, bd.getStatus());
			pst.setInt(5, bd.getBookId());

			// Execute the Prepared Statement
			int count = pst.executeUpdate();

			if (count > 0) {
				b = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean deleteBook(int id) {
		boolean b = false;

		try {
			String sql = "delete from book_details where BookId = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			int count = pst.executeUpdate();

			if (count > 0) {
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public List<BookDetails> getNewBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;

		try {
			String sql = "Select * from book_details where Category=? and Status=? order by BookId desc";
			PreparedStatement pst = conn.prepareStatement(sql);

			pst.setString(1, "new");
			pst.setString(2, "active");

			ResultSet rs = pst.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				book = new BookDetails();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setCategories(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhoto(rs.getString(7));
				book.setEmail(rs.getString(8));
				list.add(book);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getRecentBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;

		try {
			String sql = "Select * from book_details where Status=? order by BookId desc";
			PreparedStatement pst = conn.prepareStatement(sql);

			pst.setString(1, "active");

			ResultSet rs = pst.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				book = new BookDetails();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setCategories(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhoto(rs.getString(7));
				book.setEmail(rs.getString(8));
				list.add(book);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<BookDetails> getOldBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;

		try {
			String sql = "Select * from book_details where Category=? and Status=? order by BookId desc";
			PreparedStatement pst = conn.prepareStatement(sql);

			pst.setString(1, "old");
			pst.setString(2, "active");

			ResultSet rs = pst.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				book = new BookDetails();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setCategories(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhoto(rs.getString(7));
				book.setEmail(rs.getString(8));
				list.add(book);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllNewBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;

		try {
			String sql = "Select * from book_details where Category=? and Status=? order by BookId desc";
			PreparedStatement pst = conn.prepareStatement(sql);

			pst.setString(1, "new");
			pst.setString(2, "active");

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				book = new BookDetails();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setCategories(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhoto(rs.getString(7));
				book.setEmail(rs.getString(8));
				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllOldBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;

		try {
			String sql = "Select * from book_details where Category=? and Status=? order by BookId desc";
			PreparedStatement pst = conn.prepareStatement(sql);

			pst.setString(1, "old");
			pst.setString(2, "active");

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				book = new BookDetails();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setCategories(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhoto(rs.getString(7));
				book.setEmail(rs.getString(8));
				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllRecentBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;

		try {
			String sql = "Select * from book_details where Status=? order by BookId desc";
			PreparedStatement pst = conn.prepareStatement(sql);

			pst.setString(1, "active");

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				book = new BookDetails();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setCategories(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhoto(rs.getString(7));
				book.setEmail(rs.getString(8));
				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getDetailsOfOldBook(String email, String cate) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;
		
		try {
			String sql = "select * from book_details where email = ? and Category = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setString(1,email);
			pst.setString(2,cate);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				book = new BookDetails();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setCategories(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhoto(rs.getString(7));
				book.setEmail(rs.getString(8));
				list.add(book);
			}
		}catch(Exception e) {
			
		}
		return list;
	}

	@Override
	public boolean deleteOldBook(String email, String cate, int id) {
		boolean b = false;
		try {
			String sql = "Delete from book_details where email = ? and Category = ? and BookId = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, cate);
			pst.setInt(3, id);
			
			int count = pst.executeUpdate();
			
			if(count > 0) {
				b = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public List<BookDetails> getBookDetailsBySearch(String ch) {
		
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;
		
		try {
			String sql = "select * from book_details where BookName like ? or Author like ? or Category like ? and Status = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setString(1,"%"+ch+"%");
			pst.setString(2,"%"+ch+"%");
			pst.setString(3,"%"+ch+"%");
			pst.setString(4,"active");
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				book = new BookDetails();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setCategories(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhoto(rs.getString(7));
				book.setEmail(rs.getString(8));
				list.add(book);
			}
		}catch(Exception e) {
			
		}
		return list;
	}
	
	
	
	

}
