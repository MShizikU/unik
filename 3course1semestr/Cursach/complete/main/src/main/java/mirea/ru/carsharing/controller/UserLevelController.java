package mirea.ru.carsharing.controller;

import mirea.ru.carsharing.model.UserLevel;
import mirea.ru.carsharing.service.UserLevelService;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/user/levels")
public class UserLevelController {
    private final UserLevelService userLevelService;

    public UserLevelController(UserLevelService userLevelService) {
        this.userLevelService = userLevelService;
    }

    @PostMapping
    public ResponseEntity<ExecutionResult<UserLevel>> createUserLevel(@RequestBody UserLevel userLevel) {
        ExecutionResult<UserLevel> executionResult = userLevelService.createUserLevel(userLevel);
        if (executionResult.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(executionResult);
        }

        return ResponseEntity.ok(executionResult);
    }

    @PutMapping("/{id}")
    public ResponseEntity<ExecutionResult<UserLevel>> updateUserLevel(
            @PathVariable Integer id, @RequestBody UserLevel userLevel) {
        ExecutionResult<UserLevel> executionResult = userLevelService.updateUserLevel(id, userLevel);
        if (executionResult.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(executionResult);
        }

        return ResponseEntity.ok(executionResult);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ExecutionResult<UserLevel>> deleteUserLevel(@PathVariable Integer id) {
        ExecutionResult<UserLevel> executionResult = userLevelService.deleteUserLevel(id);
        if (executionResult.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(executionResult);
        }

        return ResponseEntity.ok(executionResult);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ExecutionResult<UserLevel>> getUserLevelById(@PathVariable Integer id) {
        ExecutionResult<UserLevel> executionResult = userLevelService.getUserLevelById(id);
        if (executionResult.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(executionResult);
    }

    @GetMapping
    public ResponseEntity<ExecutionResult<List<UserLevel>>> getAllUserLevels() {
        ExecutionResult<List<UserLevel>> executionResult = userLevelService.getAllUserLevels();
        return ResponseEntity.ok(executionResult);
    }
}
