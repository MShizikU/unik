package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.mirea.SidorovSD.DTO.UserDTO;
import ru.mirea.SidorovSD.Models.User;
import ru.mirea.SidorovSD.Services.UserService;

import java.util.List;

@RestController
@RequestMapping("/api/user")
public class UserController {

    private final ModelMapper modelMapper;
    private final UserService userService;
    private final Responser responser = new Responser();
    public UserController(ModelMapper modelMapper, UserService userService) {
        this.modelMapper = modelMapper;
        this.userService = userService;
    }
    @GetMapping("/all")
    public List<UserDTO> getAll(){
        return userService.getAll().stream().map(this::convertToUserDTO).toList();
    }

    @GetMapping("/level")
    public List<UserDTO> getAllByLevel(@RequestParam int idLevel){
        return userService.getAllByLevel(idLevel).stream().map(this::convertToUserDTO).toList();
    }

    @GetMapping("/role")
    public List<UserDTO> getAllByRole(@RequestParam String role){
        return userService.getAllByRole(role).stream().map(this::convertToUserDTO).toList();
    }

    @GetMapping("/info")
    public UserDTO getUserInfo(@RequestParam String snpassport){
        return convertToUserDTO(userService.findBySnpassport(snpassport));
    }

    @PostMapping("/change")
    public ResponseEntity<String> changeUserInfo(@RequestParam String snpassport, @RequestParam String fullname, @RequestParam String dateOfBirth, @RequestParam String password, @RequestParam String username, @RequestParam String role, @RequestParam int idLevel){
        return responser.createResponse(userService.changeUserInfo(snpassport, fullname, dateOfBirth, password, username, role, idLevel));
    }

    @DeleteMapping()
    public ResponseEntity<String> deleteUser(@RequestParam String snpassport){
        return responser.createResponse(userService.deleteUser(snpassport));
    }

    public UserDTO convertToUserDTO( User user){
        return modelMapper.map(user, UserDTO.class);
    }

    public User convertToUser( UserDTO userDTO) { return modelMapper.map(userDTO, User.class); }
}
