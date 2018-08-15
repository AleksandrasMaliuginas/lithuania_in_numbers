package org.LithuaniaInNumbers.data.population;

public class Age {
	
	private final int ID;
	private Year year;
	private final int age;
	
	public Age(int ID, Year period, int age) {
		this.ID = ID;
		this.year = period;
		this.age = age;
	}
	
	public int getID() {
		return ID;
	}
	
	public Year getYear() {
		return year;
	}
	
	public int getAge() {
		return age;
	}
}
