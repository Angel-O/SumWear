package com.Angelo.beans;

import java.util.Date;
import java.util.TimeZone;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

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
	
	public static void logCount(String path) throws IOException {
		
		DateFormat formatter = new SimpleDateFormat();
		formatter.setTimeZone(TimeZone.getTimeZone("Europe/London"));
		Counter.incrementCounter();
		int toBeLogged = Counter.getCounter();
		String fileName = "counter.log";
		PrintWriter out = new PrintWriter(new FileOutputStream (new File(path+fileName), true));
		Date date = new Date();
		String dateString = formatter.format(date);
		if(toBeLogged == 1){
			out.println("Application restarted...");
		}
		out.println("hit: "+toBeLogged+", date: "+dateString);	
		out.close();
	}
}
