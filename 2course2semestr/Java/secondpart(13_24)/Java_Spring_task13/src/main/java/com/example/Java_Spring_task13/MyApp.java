package com.example.Java_Spring_task13;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
public class MyApp {

    @Value("${student.name}")
    private String studentName;

    @Value("${student.last_name}")
    private String studentLastName;

    @Value("${student.group}")
    private String studentGroup;

    @Autowired
    private Environment env;

    public void setEnvironment(Environment env) {
        this.env = env;
    }


    @PostConstruct
    public void printProperties(){
        System.out.println("student.name: " + studentName);
        System.out.println("student.last_name: " + studentLastName);
        System.out.println("student.group: " + studentGroup);
        System.out.println("student.name: " + env.getProperty("student.name"));
        System.out.println("student.last_name: " + env.getProperty("student.last_name"));
        System.out.println("student.group: " + env.getProperty("student.group"));
    }
}
