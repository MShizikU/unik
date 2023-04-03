package ru.mirea.Prakt15.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.mirea.Prakt15.Services.TableService;
import ru.mirea.Prakt15.tables.User;

import java.util.List;

@RestController
public class UserController {
    private final TableService<User> serviceTableService;

    @Autowired
    public UserController(TableService<User> serviceTableService) {
        this.serviceTableService = serviceTableService;
    }

    @PostMapping(value = "/user",consumes = {"application/json"})
    public ResponseEntity<?> createStudent(@RequestBody User user) {
        serviceTableService.createEntity(user);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @GetMapping(value="/user")
    public ResponseEntity<List<User>> read() {
        final List<User> users = serviceTableService.readAllEntity();
        return users != null && !users.isEmpty()
                ? new ResponseEntity<>(users, HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @GetMapping(value="/user/{id}")
    public ResponseEntity<User> read(@PathVariable(name="id") long id) {
        System.out.println("\nqwe");
        final User user = serviceTableService.readOneEntity(id);
        return user != null
                ? new ResponseEntity<>(user, HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @PutMapping(value="/user/{id}")
    public ResponseEntity<?> update(@PathVariable(name="id") long id, @RequestBody User user) {
        final boolean isUpdated = serviceTableService.updateEntity(user, id);
        return isUpdated
                ? new ResponseEntity<>(HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.NOT_MODIFIED);
    }

    @DeleteMapping(value="/user/{id}")
    public ResponseEntity<?> delete(@PathVariable(name="id") long id) {
        final boolean isDeleted = serviceTableService.deleteEntity(id);
        return isDeleted
                ? new ResponseEntity<>(HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.NOT_MODIFIED);
    }

}
