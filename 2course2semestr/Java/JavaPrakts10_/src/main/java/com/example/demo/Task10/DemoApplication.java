package com.example.demo.Task10;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		ApplicationContext context =  new AnnotationConfigApplicationContext(BeanConfig.class);

		String beanName = args[0];
		Fighter fighter = (Fighter) context.getBean(beanName);
		fighter.doFight();
	}

}
