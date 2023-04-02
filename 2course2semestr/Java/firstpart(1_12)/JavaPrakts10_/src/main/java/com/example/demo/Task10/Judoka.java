package com.example.demo.Task10;

import org.springframework.stereotype.Component;

@Component("judoka")
public class Judoka implements Fighter{
    @Override
    public void doFight() {
        System.out.println("I'm judoka");
    }
}
