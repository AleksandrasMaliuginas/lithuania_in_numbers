package org.LithuaniaInNumbers.Models.People;

public class Population {
	public int year;
	public int total;
	public int men;
	public int women;
	
	public Population(int total, int men, int women, int year) {
		this.year = year;
		this.total = total;
		this.men = men;
		this.women = women;
	}
}
