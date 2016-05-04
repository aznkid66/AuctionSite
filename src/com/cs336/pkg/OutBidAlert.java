package com.cs336.pkg;

public class OutBidAlert {
	private int uid, aid, b_id;
	
	public OutBidAlert(int user, int auction, int bid) {
		this.uid = user;
		this.aid = auction;
		this.b_id = bid;
	}
	
	public int getUserIndex() {
		return uid;
	}
	
	public int getAuctionIndex() {
		return aid;
	}
	
	public int getBidIndex() {
		return b_id;
	}

}
