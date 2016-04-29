package com.cs336.pkg;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Auction {
	private int auctionId, skinId, sellerId;
	private Date endDate;
	private double currentPrice;
	
	public Auction(int AId, int skinId, int sellerId, Date endDate, double currPrice) {
		this.auctionId = AId;
		this.skinId = skinId;
		this.sellerId = sellerId;
		this.endDate = endDate;
		this.currentPrice = currPrice;
	}
	
	public int getSellerId() {
		return sellerId;
	}
	
	public Date getDate() {
		return endDate;
	}
	
	public String getFormattedDate() {
		return dateFormat(endDate);
	}
	
	public String dateFormat(Date date) {
		DateFormat df = new SimpleDateFormat("MM-dd-yyyy h:mm:ss a");
		return df.format(date);
	}
}
