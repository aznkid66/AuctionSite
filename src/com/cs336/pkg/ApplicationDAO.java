package com.cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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
			listOfAuctions.add(new Auction(rs.getInt("Aid"),rs.getInt("Skin"), rs.getInt("Seller"), rs.getTimestamp("endDate"), rs.getDouble("currPrice")));
		}
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return listOfAuctions;
	}
	
	public LinkedList<Auction> getOpenAuctions() throws SQLException{
		int sortBy=0;
		LinkedList<Auction> listOfAuctions = new LinkedList<Auction>();
		String selectString = "";
		
		switch (sortBy) {
		case 0:
			selectString = "select * from Auction a where TIMESTAMPDIFF(SECOND, NOW(), a.endDate) > 0;";
			break;
		case 1:
			selectString = "select * from Auction a where TIMESTAMPDIFF(SECOND, NOW(), a.endDate) > 0 order by currPrice desc";
			break;
		case 2:
			selectString = "select * from Auction a where TIMESTAMPDIFF(SECOND, NOW(), a.endDate) > 0 order by currPrice";
			break;
		case 3:
			selectString = "select * from Auction a where TIMESTAMPDIFF(SECOND, NOW(), a.endDate) > 0 order by (select s.name from "
			+ " Skin s where s.sid=a.Skin)";
			break;
		case 4:
			selectString = "select * from Auction a where TIMESTAMPDIFF(SECOND, NOW(), a.endDate) > 0 order by (select s.name from "
					+ " Skin s where s.sid=a.Skin) desc";
			break;
		case 5:
			selectString = "select * from Auction a where TIMESTAMPDIFF(SECOND, NOW(), a.endDate) > 0 order by (select u.username from "
			+ "User u where u.userid=a.Seller)";
			break;
		case 6:
			selectString = "select * from Auction a where TIMESTAMPDIFF(SECOND, NOW(), a.endDate) > 0 order by (select u.username from "
					+ "User u where u.userid=a.Seller) desc";
			break;
		case 7:
			selectString = "select * from Auction a where TIMESTAMPDIFF(SECOND, NOW(), a.endDate) > 0 order by endDate";
			break;
		case 8:
			selectString = "select * from Auction a where TIMESTAMPDIFF(SECOND, NOW(), a.endDate) > 0 order by endDate desc";
			break;

		}
		
		//display all tuples
		//String selectString = "select * from Auction a where TIMESTAMPDIFF(SECOND, NOW(), a.endDate) > 0;";
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		ResultSet rs = preparedStatement.executeQuery(); 
		
		//creating a ResultSet
		while(rs.next( )) {
			//System.out.println("row : id = " + rs.getInt("AId") + ", first name = " + rs.getString("FirstName") );
			resLength++;
			listOfAuctions.add(new Auction(rs.getInt("Aid"),rs.getInt("Skin"), rs.getInt("Seller"), rs.getTimestamp("endDate"), rs.getDouble("currPrice")));
		}
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return listOfAuctions;
	}
	
	public LinkedList<Auction> getClosedAuctions() throws SQLException{
		
		LinkedList<Auction> listOfAuctions = new LinkedList<Auction>();
		
		//display all tuples
		String selectString = "select * from Auction a where TIMESTAMPDIFF(SECOND, NOW(), a.endDate) < 0;";
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		ResultSet rs = preparedStatement.executeQuery(); 
		
		//creating a ResultSet
		while(rs.next( )) {
			//System.out.println("row : id = " + rs.getInt("AId") + ", first name = " + rs.getString("FirstName") );
			resLength++;
			listOfAuctions.add(new Auction(rs.getInt("Aid"),rs.getInt("Skin"), rs.getInt("Seller"), rs.getTimestamp("endDate"), rs.getDouble("currPrice")));
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
			u = new User(rs.getInt("userid"), rs.getString("username"), rs.getString("email"));
		}
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return u;
	}
	
	public String getTimeRemaining (int auctionId) throws SQLException {
		Timestamp t = null;
		String selectString = "select a.endDate from Auction a where"
			+ " a.aid = " + auctionId + ";";
		
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		ResultSet rs = preparedStatement.executeQuery(); 
		
		while(rs.next()) {
			resLength++;
			t = rs.getTimestamp(1);
		}
		
		Timestamp now = getNOW();		
		
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		//t = days + " days";
		return "";
	}
	
	public Timestamp getNOW() throws SQLException {
		Timestamp t = null;
		String selectString = "select NOW()";
		
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		ResultSet rs = preparedStatement.executeQuery(); 
		
		while(rs.next()) {
			t = rs.getTimestamp(1);
		}
		
		return t;
	}
	
	public User getWinner(int auctionID) throws SQLException {
		User u = null;
		String selectString = "select u.* from Bid b, User u where b.aid= " + auctionID 
				+ " and b.bidder=u.userid group by b.price desc limit 1";
		
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		ResultSet rs = preparedStatement.executeQuery(); 
		
		while(rs.next()) {
			resLength++;
			u = new User(rs.getInt("userid"), rs.getString("username"), rs.getString("email"));
		}
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return u;
	}
	
	public LinkedList<OutBidAlert> getOutBidAlerts(int userId) throws SQLException {
		LinkedList<OutBidAlert> alerts = new LinkedList<OutBidAlert>();
		String selectString = "select * from outBidAlerts al where al.uid=" + userId + ";";
		
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		ResultSet rs = preparedStatement.executeQuery(); 
		
		//creating a ResultSet
		while(rs.next( )) {
			//System.out.println("row : id = " + rs.getInt("AId") + ", first name = " + rs.getString("FirstName") );
			resLength++;
			alerts.add(new OutBidAlert(userId,rs.getInt("aid"), rs.getInt("b_id")));
		}
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		return alerts;
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
