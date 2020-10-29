package com.bank;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Transaction {
	Calendar cal = Calendar.getInstance();
 
	pointcut success() : call (* money*(..));
    after() : success(){
    	String accion = null;
    	BufferedWriter br = null;
    	if(thisJoinPoint.toShortString().contains("moneyMakeTransaction()")) {    		
			System.out.println(accion = "Realizó una transacción de dinero"); System.out.println("");
		}else {
			System.out.println(accion = "Realizó un retiro de dinero"); System.out.println("");	
		}
    	try {
    		br = new BufferedWriter(new FileWriter("src/com/bank/log.txt",true));
    		br.write("Tipo de acción: "+accion+" --- Tiempo ejecutado: "+cal.getTime().toString());    	
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
    	System.out.println("******** ACCIÓN - COMPLETADA ********"+"\n");
    }
}
