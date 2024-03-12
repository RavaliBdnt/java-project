package com.test;

import java.util.ArrayList;

import antlr.collections.List;

public class App {

	public static void main(String[] args) {
		java.util.List<Id> id = new ArrayList<Id>();
		Id id1 = new Id(14,"Abdul Azeem");
		Id id2 = new Id(11,"Vineeth");
		Id id3 = new Id(17,"Santosh");
		Id id4 = new Id(21,"Vijay");
		Id id5 = new Id(74,"Ajay");
		id.add(id1);id.add(id2);id.add(id3);id.add(id4);id.add(id5);
		int j = 0;
		for(int i=0;i<id.size();i++) {
			Id ids = id.get(i);
			System.out.println(ids);
		}
		

	}

}
