package org.LithuaniaInNumbers.Models;

public class Territory {
	public int id;
	public String title;
	public int countyId;
	public int area;
	
	public Territory(int id, String title, int countyId, int area) {
		this.id = id;
		this.title = title;
		this.countyId = countyId;
		this.area = area;
	}
}
