package com.example.Java_spring_task23.jmx;


import com.example.Java_spring_task23.services.SchedulerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jmx.export.annotation.ManagedOperation;
import org.springframework.jmx.export.annotation.ManagedResource;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
@ManagedResource
public class MyMbean {

    private final SchedulerService schedulerService;

    @Autowired
    public MyMbean(SchedulerService schedulerService) {
        this.schedulerService = schedulerService;
    }

    @ManagedOperation(description = "Run scheduled task")
    public void run() throws IOException {
        schedulerService.scheduledTask();
    }
}