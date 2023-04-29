package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mirea.SidorovSD.Models.User;
import ru.mirea.SidorovSD.Services.UserService;

@RestController
@RequestMapping("/api/user")
public class UserController {

    private final ModelMapper modelMapper;

    private final UserService userService;

    public UserController(ModelMapper modelMapper, UserService userService) {
        this.modelMapper = modelMapper;
        this.userService = userService;
    }

    @GetMapping("/{snpassport}")
}
