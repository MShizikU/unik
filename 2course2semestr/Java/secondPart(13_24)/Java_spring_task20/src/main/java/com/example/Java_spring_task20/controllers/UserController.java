package com.example.Java_spring_task20.controllers;

import com.example.Java_spring_task20.dto.UserDTO;
import com.example.Java_spring_task20.models.User;
import com.example.Java_spring_task20.services.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/user")
public class UserController {
    private final ModelMapper modelMapper;
    private final UserService userService;

    @Autowired
    public UserController(ModelMapper modelMapper, UserService userService) {
        this.modelMapper = modelMapper;
        this.userService = userService;
    }

    @GetMapping
    public List<UserDTO> getAll() {
        return userService.findAll().stream().map(this::convertToUserDTO).collect(Collectors.toList());
    }

    @DeleteMapping("/{id}")
    public HttpStatus deleById(@PathVariable("id")int id) {
        userService.delete(id);
        return HttpStatus.OK;
    }

    @PostMapping
    public HttpStatus add(@RequestBody UserDTO userDTO) {
        userService.save(convertToManufacture(userDTO));
        return HttpStatus.OK;
    }

    private UserDTO convertToUserDTO(User user) {
        return modelMapper.map(user, UserDTO.class);
    }

    private User convertToManufacture(UserDTO userDTO) {
        return modelMapper.map(userDTO, User.class);
    }
}
