package com.test;

public class SplitImageTest {

	public static void main(String[] args) {
		// Custom input string
		String str = "myimage.jpeg";
		String[] arrOfStr = str.split("\\.");

		System.out.println(arrOfStr[1]);

	}

}
