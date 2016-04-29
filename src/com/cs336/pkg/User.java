package com.cs336.pkg;

public class User {

	private int id;
	private String username;
	private String email;
	
	public User(int id, String username, String email) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
	}


	public User(){
		
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String userName) {
		username = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String Email) {
		email = Email;
	}

	
	
}
