package org.LithuaniaInNumbers.Models.People.population;

public class TotalPopulation { // Total municipality population.
	private final int year;
	private final int total;
	private final int men;
	private final int women;
	
	public TotalPopulation(int year, int men, int women) {
		this.year = year;
		this.men = men;
		this.women = women;
		total = men + women;
	}
	
	public int getYear() {
		return year;
	}
	
	public int getTotal() {
		return total;
	}
	
	public int getMen() {
		return men;
	}
	
	public int getWomen() {
		return women;
	}
	
}
