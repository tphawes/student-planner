package com.taskManager.web.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import java.util.Vector;

public class MyFileTool {
	
	public static String readFile(String inFile) {
		StringBuffer stBuff = new StringBuffer();
		try {
			File myObj = new File(inFile);
			Scanner myReader = new Scanner(myObj);
			while (myReader.hasNextLine()) {
				String data = myReader.nextLine();
				stBuff.append(data);
				//System.out.println("Data:" + data);
			}
			myReader.close();
		} catch (FileNotFoundException e) {
			System.out.println("An error occurred.");
			e.printStackTrace();
		}
		return stBuff.toString();
	}
	public static Vector<String> readFile2(String inFile) {
		Vector<String> stBuff = new Vector<String>();
		try {
			File myObj = new File(inFile);
			Scanner myReader = new Scanner(myObj);
			while (myReader.hasNextLine()) {
				String data = myReader.nextLine();
				stBuff.add(data.trim());
				//System.out.println("Data:" + data);
			}
			myReader.close();
		} catch (FileNotFoundException e) {
			System.out.println("An error occurred.");
			e.printStackTrace();
		}
		return stBuff;
	}
	public static void writeToFile(String fileName, String data) {
	    try {
	        FileWriter myWriter = new FileWriter(fileName);
	        myWriter.write(data);
	        myWriter.close();
	        System.out.println("Successfully wrote to the file.");
	      } catch (IOException e) {
	        System.out.println("An error occurred.");
	        e.printStackTrace();
	      }
	}


}
