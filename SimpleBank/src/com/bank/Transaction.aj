package com.bank;

public aspect Transaction {
	
	pointcut success() : call(* money*(..) );
    after() : success() {
    //Aspecto ejemplo: solo muestra este mensaje despu�s de haber creado un usuario 
    	System.out.println("**** Transaction succesful ****");
    }
}
