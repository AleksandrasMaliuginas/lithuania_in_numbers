package org.LithuaniaInNumbers.Models.People;

public class Population {
	public final int year;
	public final int total;
	public final int men;
	public final int women;
	
	public Population(int year, int men, int women) {
		this.year = year;
		this.men = men;
		this.women = women;
		total = men + women;
	}
}
