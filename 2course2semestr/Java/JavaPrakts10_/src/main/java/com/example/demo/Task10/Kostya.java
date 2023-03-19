package com.example.demo.Task10;

import org.springframework.stereotype.Component;

@Component
public class Kostya {
    private final Fighter fighter;

    public Kostya(Fighter fighter) {
        this.fighter = fighter;
    }

    public void doFight(){
        System.out.println("I'n fighter");
    }
}
