package com.example.Java_Spring_task13;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource("classpath:application.yml")
public class Test implements CommandLineRunner {
    @Value("${student.name}")
    private String name;
    @Value("${student.last_name}")
    private String lastName;
    @Value("${student.group}")
    private String group;

    @Override
    public void run(String... args) throws Exception {
        System.out.println(name);
        System.out.println(lastName);
        System.out.println(group);
    }
}
