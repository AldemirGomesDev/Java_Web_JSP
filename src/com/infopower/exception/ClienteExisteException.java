package com.infopower.exception;

public class ClienteExisteException extends Exception {
	
	public  ClienteExisteException(){
		super("LOGIN OU SENHA JÁ EXISTE!");
	}
 
}
