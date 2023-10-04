package rschir5.Prakt5;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class Prakt5Application {

	public static void main(String[] args) {
		SpringApplication.run(Prakt5Application.class, args);
	}

}
