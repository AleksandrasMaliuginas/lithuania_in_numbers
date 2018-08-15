package org.LithuaniaInNumbers.data.population;

public class Population {
	
	private final int ID;
	private Age age;
	private Municipality munic;
	private final int menCount;
	private final int womenCount;
	
	public Population(int ID, Age age, Municipality munic, int menCount, int womenCount) {
		this.ID = ID;
		this.age = age;
		this.menCount = menCount;
		this.womenCount = womenCount;
		this.munic = munic;
	}
	
	public Age getAge() {
		return age;
	}
	
	public int getMenCount() {
		return menCount;
	}
	
	public int getWomenCount() {
		return womenCount;
	}
	
	public Municipality getMunicipality() {
		return munic;
	}
	
	public int getID() {
		return ID;
	}

}
