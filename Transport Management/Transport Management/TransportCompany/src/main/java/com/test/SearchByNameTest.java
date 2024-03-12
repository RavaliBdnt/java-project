package com.test;

import java.util.ArrayList;
import java.util.List;

import com.dao.TruckDao;
import com.entities.Truck;

public class SearchByNameTest {

	public static void main(String[] args) {
		TruckDao dao = new TruckDao();
		List<Truck> trucks = new ArrayList<Truck>();
		trucks= dao.searchByTruckName("AL4020");
		
		for(Truck e : trucks) {
			System.out.println(e+"\n");
		}
		System.out.println("hi");
	}

}
