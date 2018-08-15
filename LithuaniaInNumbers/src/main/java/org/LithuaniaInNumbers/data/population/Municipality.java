package org.LithuaniaInNumbers.data.population;

public class Municipality {
	
	private final int ID;
	private final String title;
	private final int municipalityID;
	
	
	public Municipality(int ID, String title, int municipalityID) {
		this.ID = ID;
		this.title = title;
		this.municipalityID = municipalityID;
		
	}
	
	public int getID() {
		return ID;
	}
	
	public String getTitle() {
		return title;
	}
	
	public int getMunicipalityID() {
		return municipalityID;
	}

}
