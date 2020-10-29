package com.bank;

public aspect Transaction {
	
	pointcut success() : call(* money*(..) );
    after() : success() {
    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
    	System.out.println("**** Transaction succesful ****");
    }
}
