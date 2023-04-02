package com.example.demo.Task10;

import org.springframework.stereotype.Component;

@Component("boxer")
public class Boxer implements Fighter{
    @Override
    public void doFight() {
        System.out.println("I'm boxer");
    }
}
