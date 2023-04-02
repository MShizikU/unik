package com.example.demo.Task10;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BeanConfig {

    @Bean(name = "streetfighter")
    public Fighter streetfighter() {
        return new StreetFighter();
    }

    @Bean(name = "boxer")
    public Fighter boxer(){
        return new Boxer();
    }

    @Bean(name = "judoka")
    public Fighter judoka(){
        return new Judoka();
    }
}
