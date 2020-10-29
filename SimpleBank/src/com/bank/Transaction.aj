package com.bank;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.Calendar;

public aspect Transaction {
	
	Calendar cal = Calendar.getInstance();
    FileWriter file = new FileWriter("log.txt");
    
	pointcut success() : call(* money*(..) );
    after() : success() {
    	
    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
    		
    		//BufferedWriter br = new BufferedWriter(file);
    	    PrintWriter pr= new PrintWriter(file);
    	    
    	    pr.printf(cal.getCalendarType());
    	    
    	    pr.close();
    	    
    	   
    }
    	   
    	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    	  
    	    
    	
    	
    	System.out.println("**** Transaction succesful ****");
    }

