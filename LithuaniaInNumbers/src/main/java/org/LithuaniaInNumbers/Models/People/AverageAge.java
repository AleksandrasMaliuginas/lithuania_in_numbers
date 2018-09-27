package org.LithuaniaInNumbers.Models.People;

public class AverageAge {
//	public int age;
	public int year;
	public float total;
	public float men;
	public float women;
	
	public AverageAge(float total, float men, float women, int year) {
//		this.age = age;
		this.year = year;
		this.total = total;
		this.men = men;
		this.women = women;
	}
}
