package com.cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class ApplicationDAO {

	public Connection getConnection(){
		String connectionUrl = "jdbc:mysql://localhost:3306/myDB";
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			// TODO: password
			connection = DriverManager.getConnection(connectionUrl,"root", "BecauseCBC2");
			//connection = DriverManager.getConnection(connectionUrl,"root", "GimGamGam99");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;
		
	}
	
	public void closeConnection(Connection connection){
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*public void insertPerson() throws SQLException{
		
		String insertString = "insert into Person values(115, \"Borgida\",  \"Alex\");";
		
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(insertString);

		// execute select SQL statement
		preparedStatement.executeUpdate();
		System.out.println("Person added");

		preparedStatement.close();
		dbConnection.close();
		
		
	}*/
	
	public LinkedList<Auction> getAuctions() throws SQLException{
		
		LinkedList<Auction> listOfAuctions = new LinkedList<Auction>();
		
		//display all tuples
		String selectString = "select * from Auction;";
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		ResultSet rs = preparedStatement.executeQuery(); 
		
		//creating a ResultSet
		while(rs.next( )) {
			//System.out.println("row : id = " + rs.getInt("AId") + ", first name = " + rs.getString("FirstName") );
			resLength++;
			listOfAuctions.add(new Auction(rs.getInt("Aid"),rs.getInt("Skin"), rs.getInt("Seller"), rs.getDate("endDate"), rs.getDouble("currPrice")));
		}
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return listOfAuctions;
	}
	
	public Skin getSkin(int skinId) throws SQLException{ 
		Skin s = null;
		String selectString = "select * from Skin s where s.Sid = " + skinId + ";";
		
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		ResultSet rs = preparedStatement.executeQuery(); 
		
		while(rs.next()) {
			resLength++;
			s = new Skin(rs.getInt("Sid"), rs.getString("name"), rs.getString("Rarity"), rs.getString("Theme"), rs.getString("Champion"));
		}
		
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return s;
	}
	
	public User getUser (int userId) throws SQLException {
		User u = null;
		String selectString = "select * from User u where u.Userid = " + userId + ";";
		
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		ResultSet rs = preparedStatement.executeQuery(); 
		
		while(rs.next()) {
			resLength++;
			u = new User(rs.getInt("userid"), rs.getString("email"), rs.getString("username"));
		}
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return u;
	}
	
	public String getTimeRemaining (int auctionId) throws SQLException {
		int days = 0;
		String t = "BLAH";
		String selectString = "select TIMESTAMPDIFF(DAY, NOW(), a.endDate) from Auction a where"
				+ " a.aid = " + auctionId + ";";
		
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		ResultSet rs = preparedStatement.executeQuery(); 
		
		while(rs.next()) {
			resLength++;
			t = rs.getString("TIMESTAMPDIFF(DAY, NOW(), a.endDate)");
			System.out.println(t);
		}
		
		/*if (days == 1) {
			selectString = "select sec_to_time(TIMESTAMPDIFF(SECOND, NOW(), a.endDate)) from Auction a where"
					+ " a.aid = " + auctionId + ";";
			
			preparedStatement = dbConnection.prepareStatement(selectString);
			resLength = 0;
			rs = preparedStatement.executeQuery(); 
			
			while(rs.next()) {
				t= rs.getString("select sec_to_time(TIMESTAMPDIFF(SECOND, NOW(), a.endDate)) from Auction a where"
					+ " a.aid = " + auctionId + ";");
			}
		} else {
			t = days + " days";
		}*/
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		//t = days + " days";
		return t;
	}
	
	
	public static void main(String[] args) {
		ApplicationDAO dao = new ApplicationDAO();
		Connection connection = dao.getConnection();
		
		System.out.println(connection);
		
//		try {
//			dao.insertPerson();
//		} catch (SQLException e) {
//			 TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		/*try {
			dao.insertPerson();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//dao.closeConnection(connection);	*/
	}
	
	

}
