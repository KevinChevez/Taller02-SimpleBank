package com.bank;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Transaction {
	
	Calendar cal = Calendar.getInstance();
    
    
	pointcut success() : call(* money*(..) );
    after() : success() {
    	BufferedWriter br = null;
    	try {
    		br = new BufferedWriter(new FileWriter("src/com/bank/log.txt"));
    		br.write("Fecha: "+cal.toString());
    		br.newLine();
    	}catch(FileNotFoundException e) {
    		System.out.println("Error al abrir el archivo "+e.getMessage());
    	} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
    		if(br !=null) {
    			try {
    				br.close();
    			}catch(IOException ex){
    				System.out.println("Error "+ ex.getMessage());
    			}
    		} 	    
    	   
    	}
    	System.out.println("*****COMPLETADO********");
    }
}
