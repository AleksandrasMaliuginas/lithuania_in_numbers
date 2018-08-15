package org.LithuaniaInNumbers.data.population;

public class Year {
	
	private final int ID;
	private final int year;
	
	public Year(int ID, int year) {
		this.ID = ID;
		this.year = year;
	}
	
	public int getID() {
		return ID;
	}
	
	public int getYear() {
		return year;
	}

}
