package com.cs336.pkg;

public class Skin {
	private int skinId;
	private String name, rarity, theme, champion;
	
	public Skin(int id, String name, String rarity, String theme, String champion) {
		this.skinId = id;
		this.name = name;
		this.rarity = rarity;
		this.theme = theme;
		this.champion = champion;
	}
	
	public int getId() {
		return skinId;
	}
	
	public String getName() {
		return name;
	}
	
	public String getRarity() {
		return rarity;
	}
	
	public String getTheme() {
		return theme;
	}
	
	public String getChampion() {
		return champion;
	}
	
	public void setId(int newId) {
		skinId = newId;
	}
	
	public void setName(String newName) {
		name = newName;
	}
	
	public void setRarity(String newRarity) {
		rarity = newRarity;
	}
	
	public void setTheme(String newTheme) {
		theme = newTheme;
	}
	
	public void setChampion(String newChampion) {
		champion = newChampion;
	}
}
