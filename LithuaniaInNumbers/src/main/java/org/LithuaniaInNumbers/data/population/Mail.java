package org.LithuaniaInNumbers.data.population;

import org.LithuaniaInNumbers.data.main.Main;

public final class Mail { // responds to server-side requests.
	
	public static int[][] getMunicipalityPopulation(int municipalityID) { // all years.
		int menData[] = new int[Main.years.size()];
		int womenData[] = new int[Main.years.size()];
		int totalData[] = new int[Main.years.size()];
		for(int i = 0; i < Main.population.size(); i++) {
			Population pop = Main.population.get(i);
			if(pop.getMunicipality().getMunicipalityID() == municipalityID) {
				//System.out.println(" p " + (pop.getAge().getYear().getID() - 1) + " " + pop.getMenCount());
				menData[pop.getAge().getYear().getID() - 1] += pop.getMenCount();
				womenData[pop.getAge().getYear().getID() - 1] += pop.getWomenCount();
				totalData[pop.getAge().getYear().getID() - 1] += (pop.getMenCount() + pop.getWomenCount());
			}
		}
		int data[][] = new int[][] {menData, womenData, totalData};
		return data;
		
	}
	
	public static int[][] getAverageAge(int municipalityID) { // - 1 if cannot be devided.
		int menData[] = new int[Main.years.size()];
		int womenData[] = new int[Main.years.size()];
		int totalData[] = new int[Main.years.size()];
		//int age[][] = new int[Main.years.size()][Main.ages.size() / Main.years.size()]; // [years][only ages from 0 to...]
		// this int's first index is chosen year, second is age.
		int menAgeSum[] = new int[Main.years.size()];
		int menTotal[] = new int[Main.years.size()];
		int womenAgeSum[] = new int[Main.years.size()];
		int womenTotal[] = new int[Main.years.size()];
		for(int i = 0; i < Main.population.size(); i++) {
			Population pop = Main.population.get(i);
			if(pop.getMunicipality().getMunicipalityID() == municipalityID) {
				//age[pop.getAge().getYear().getID() - 1][pop.getAge().age()] = pop.getMenCount();
				menAgeSum[pop.getAge().getYear().getID() - 1] += (pop.getMenCount() * pop.getAge().getAge());
				menTotal[pop.getAge().getYear().getID() - 1] += pop.getMenCount();
				womenAgeSum[pop.getAge().getYear().getID() - 1] += (pop.getMenCount() * pop.getAge().getAge());
				womenTotal[pop.getAge().getYear().getID() - 1] += pop.getWomenCount();
			}
		}
		for(int i = 0; i < Main.years.size(); i++) {
			if(menTotal[i] != 0)menData[i] = menAgeSum[i] / menTotal[i];
			else menData[i] = -1;
			if(womenData[i] != 0) womenData[i] = womenAgeSum[i] / womenTotal[i];
			else womenData[i] = -1;
			if(menTotal[i] + womenTotal[i] != 0) totalData[i] = (menAgeSum[i] + womenAgeSum[i]) / (menTotal[i] + womenTotal[i]);
			else menTotal[i] = -1;
		}
		int data[][] = new int[][] {menData, womenData, totalData};
		return data;
	}

}
