package com.cs336.pkg;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Auction {
	private int auctionId, skinId, sellerId;
	private Timestamp endDate;
	private double currentPrice;
	
	public Auction(int AId, int skinId, int sellerId, Timestamp endDate, double currPrice) {
		this.auctionId = AId;
		this.skinId = skinId;
		this.sellerId = sellerId;
		this.endDate = endDate;
		this.currentPrice = currPrice;
	}
	
	public int getSellerId() {
		return sellerId;
	}
	
	public int getSkinId() {
		return skinId;
	}
	
	public int getAuctionId() {
		return auctionId;
	}
	
	public Timestamp getDate() {
		return endDate;
	}
	
	public String getFormattedDate() {
		return endDate.toString();
	}
	
	public String dateFormat(Timestamp endDate) {
		String s = new SimpleDateFormat("MM-dd-yyyy h:mm:ss a").format(endDate);
		return s;
	}
	
	public String getTimeDifference(Timestamp now) {
		long milliseconds1 = now.getTime();
		long milliseconds2 = endDate.getTime();

		  long diff = milliseconds2 - milliseconds1;
		  long diffSeconds = diff / 1000;
		  long diffMinutes = diff / (60 * 1000);
		  long diffHours = diff / (60 * 60 * 1000);
		  long diffDays = diff / (24 * 60 * 60 * 1000);

		  return diffDays + " days" + ", " + diffHours + " hours";
	}
}
