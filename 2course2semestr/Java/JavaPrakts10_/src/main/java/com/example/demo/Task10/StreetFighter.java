package com.example.demo.Task10;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component("streetfighter")
public class StreetFighter implements Fighter{

    @Override
    public void doFight() {
        System.out.println("I'm a street fighter");
    }
}
