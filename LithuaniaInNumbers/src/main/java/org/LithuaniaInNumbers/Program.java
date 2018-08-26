package org.LithuaniaInNumbers;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.LithuaniaInNumbers.Database;

@SpringBootApplication
public class Program {
	public static void main(String[] args) {
		
        SpringApplication.run(Program.class, args);
        
        new Database().connect();
    }
}