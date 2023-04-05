package com.example.Java_spring_task16.controllers;

import com.example.Java_spring_task16.dao.UserDAO;
import com.example.Java_spring_task16.dto.UserDTO;
import com.example.Java_spring_task16.models.User;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/users")
public class UsersController {
    private final UserDAO userDAO;
    private final ModelMapper modelMapper;

    @Autowired
    public UsersController(UserDAO userDAO, ModelMapper modelMapper) {
        this.userDAO = userDAO;
        this.modelMapper = modelMapper;
    }

    @GetMapping
    public List<UserDTO> getAll() {
        return userDAO.findAll().stream().map(this::convertToManufactureDTO).collect(Collectors.toList());
    }

    @DeleteMapping("/{id}")
    public HttpStatus deleById(@PathVariable("id")int id) {
        userDAO.delete(id);
        return HttpStatus.OK;
    }

    @PostMapping
    public HttpStatus add(@RequestBody UserDTO userDTO) {
        userDAO.save(convertToManufacture(userDTO));
        return HttpStatus.OK;
    }

    private UserDTO convertToManufactureDTO(User user) {
        return modelMapper.map(user, UserDTO.class);
    }

    private User convertToManufacture(UserDTO userDTO) {
//        User manufacture =
        return modelMapper.map(userDTO, User.class);
    }
}
