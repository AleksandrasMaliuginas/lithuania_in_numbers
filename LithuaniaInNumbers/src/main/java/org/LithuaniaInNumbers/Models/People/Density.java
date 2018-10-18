package org.LithuaniaInNumbers.Models.People;

public class Density {
	public float density;
	
	public int year;
	
	public Density(float density) {
		this.density = density;
	}
	
	public Density setYear(int year) {
		this.year = year;
		return this;
	}
}
