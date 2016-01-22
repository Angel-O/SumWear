package com.Angelo.beans;

import java.io.PrintWriter;
import java.util.Date;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
public class Counter {
	
	private static int counter = 0;

	public static int getCounter() {
		return counter;
	}

	public static void setCounter(int counter) {
		Counter.counter = counter;
	}
	
	public static void incrementCounter() {
		Counter.counter++;
		setCounter(Counter.counter);
	}
	
	public static void logCount(String fileName, int count) throws IOException {
		
		File file;
		try {
			file = new File(fileName);
			file.createNewFile();
			FileWriter writer = new FileWriter(file.getPath());
			String date = new Date().toString();
			writer.write(count+" "+date);
			//System.out.println(file.getPath());
			writer.close();
		}
		catch (FileNotFoundException e){
			System.out.println("file not found");
		}
	}
	
	
}
