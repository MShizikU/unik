package com.example.Java_spring_task23.services;

import com.example.Java_spring_task23.models.User;
import com.example.Java_spring_task23.repositories.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
@Transactional(readOnly = true)
public class UserService {
    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> findAll() {
        log.info("Find all users");
        return userRepository.findAll();
    }

    @Transactional
    public void save(User user) {
        log.info("Save user {}", user);
        userRepository.save(user);
    }

    @Transactional
    public void delete(int id) {
        log.info("Delete user with id = {}", id);
        userRepository.deleteById(id);
    }
}
