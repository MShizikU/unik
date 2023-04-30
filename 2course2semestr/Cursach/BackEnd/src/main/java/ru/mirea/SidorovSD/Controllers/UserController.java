package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.mirea.SidorovSD.DTO.UserDTO;
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

    @GetMapping("/info")
    @ResponseBody
    public UserDTO getUserInfo(@RequestParam String snpassport){
        return convertToUserDTO(modelMapper, userService.findBySnpassport(snpassport));
    }

    @PostMapping("/updateLevel")
    @ResponseBody
    public UserDTO setUserNewLevel(@RequestParam String snpassport, @RequestParam int idLevelNew){
        return convertToUserDTO(modelMapper, userService.changeUserLevel(snpassport, idLevelNew));
    }


    public UserDTO convertToUserDTO(ModelMapper modelMapper, User user){
        return modelMapper.map(user, UserDTO.class);
    }
}
