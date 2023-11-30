package mirea.ru.carsharing.controller;
import mirea.ru.carsharing.model.User;
import mirea.ru.carsharing.model.UserLevel;
import mirea.ru.carsharing.service.UserLevelService;
import mirea.ru.carsharing.service.UserService;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
public class UserController {
    private final UserService userService;
    private final UserLevelService userLevelService;

    @Autowired
    public UserController(UserService userService, UserLevelService userLevelService) {
        this.userService = userService;
        this.userLevelService = userLevelService;
    }

    @PostMapping
    public ResponseEntity<ExecutionResult<User>> createUser(@RequestBody User user) {
        ExecutionResult<User> result = userService.createUser(user);
        UserLevel userLevel = userLevelService.getUserLevelById(user.getUserLevel().getIdLevel()).getResult();
        user.setUserLevel(userLevel);
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @PutMapping("/{snpassport}")
    public ResponseEntity<ExecutionResult<User>> updateUser(@PathVariable Long snpassport, @RequestBody User updatedUser) {
        ExecutionResult<User> result = userService.updateUser(snpassport, updatedUser);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(result);
        }
        return ResponseEntity.ok(result);
    }

    @DeleteMapping("/{snpassport}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long snpassport) {
        userService.deleteUser(snpassport);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{snpassport}")
    public ResponseEntity<ExecutionResult<User>> getUserBySnpassport(@PathVariable Long snpassport) {
        ExecutionResult<User> result = userService.getUserBySnpassport(snpassport);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(result);
        }
        return ResponseEntity.ok(result);
    }

    @GetMapping("/userLevel/{userLevel}")
    public ResponseEntity<List<User>> getUsersByUserLevel(@PathVariable UserLevel userLevel) {
        List<User> users = userService.getUsersByUserLevel(userLevel);
        return ResponseEntity.ok(users);
    }

    @GetMapping("/username/{username}")
    public ResponseEntity<ExecutionResult<User>> getUserByUsername(@PathVariable String username) {
        ExecutionResult<User> result = userService.getUserByUsername(username);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(result);
        }
        return ResponseEntity.ok(result);
    }
}