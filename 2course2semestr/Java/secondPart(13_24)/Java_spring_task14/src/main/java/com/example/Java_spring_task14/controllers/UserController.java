package com.example.Java_spring_task14.controllers;

import com.example.Java_spring_task14.dao.UserDAO;
import com.example.Java_spring_task14.dao.UserDAO;
import com.example.Java_spring_task14.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {
    private final UserDAO manufactureDAO;

    @Autowired
    public UserController(UserDAO manufactureDAO) {
        this.manufactureDAO = manufactureDAO;
    }

    @GetMapping
    public List<User> getAll() {
        return manufactureDAO.findAll();
    }

    @DeleteMapping("/{birthDate}")
    public HttpStatus deleteByBirthDate(@PathVariable("birthDate") String birthDate ) {
        manufactureDAO.delete(birthDate);
        return HttpStatus.OK;
    }

    @PostMapping
    public HttpStatus add(@RequestBody User user) {
        manufactureDAO.save(user);
        return HttpStatus.OK;
    }
}
