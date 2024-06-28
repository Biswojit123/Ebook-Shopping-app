package com.biswo.entity;

public class BookDetails {
	private int bookId ;
	private String bookName ;
	private String author ;
	private double price ;
	private String categories;
	private String status ;
	private String photo ;
	private String email;
	
	public BookDetails() {
		super();
	}

	public BookDetails(String bookName, String author, double price, String categories, String status, String photo,
			String email) {
		super();
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.categories = categories;
		this.status = status;
		this.photo = photo;
		this.email = email;
	}
	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getCategories() {
		return categories;
	}

	public void setCategories(String categories) {
		this.categories = categories;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "BookDetails [bookName=" + bookName + ", author=" + author + ", price=" + price + ", categories="
				+ categories + ", status=" + status + ", photo=" + photo + ", email=" + email + "]";
	}
	
	
	
	
}
