package org.LithuaniaInNumbers.Models.People.population;

public class AveragePopYear {
	
	private final int year;
	private final int menYear;
	private final int womenYear;
	private final int totalYear;
	
	public AveragePopYear(int year, int menYear, int womenYear, int totalYear) {
		this.year = year;
		this.menYear = menYear;
		this.womenYear = womenYear;
		this.totalYear = totalYear;
		
	}
	
	public int getYear() {
		return year;
	}
	
	public int getMenYear() {
		return menYear;
	}
	
	public int getWomenYear() {
		return womenYear;
	}
	
	public int getTotalYear() {
		return totalYear;
	}

}
