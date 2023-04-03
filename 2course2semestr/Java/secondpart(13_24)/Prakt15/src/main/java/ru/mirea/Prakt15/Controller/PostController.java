package ru.mirea.Prakt15.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.mirea.Prakt15.Services.TableService;
import ru.mirea.Prakt15.tables.Post;

import java.util.List;

@RestController
public class PostController {
    private final TableService<Post> serviceTableService;

    @Autowired
    public PostController(TableService<Post> serviceTableService) {
        this.serviceTableService = serviceTableService;
    }

    @PostMapping(value = "/groups",consumes = {"application/json"})
    public ResponseEntity<?> createStudent(@RequestBody Post post) {
        serviceTableService.createEntity(post);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @GetMapping(value="/post")
    public ResponseEntity<List<Post>> read() {
        final List<Post> posts = serviceTableService.readAllEntity();
        return posts != null && !posts.isEmpty()
                ? new ResponseEntity<>(posts, HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @GetMapping(value="/post/{id}")
    public ResponseEntity<Post> read(@PathVariable(name="id") long id) {
        System.out.println("\nqwe");
        final Post post = serviceTableService.readOneEntity(id);
        return post != null
                ? new ResponseEntity<>(post, HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @PutMapping(value="/post/{id}")
    public ResponseEntity<?> update(@PathVariable(name="id") long id, @RequestBody Post post) {
        final boolean isUpdated = serviceTableService.updateEntity(post, id);
        return isUpdated
                ? new ResponseEntity<>(HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.NOT_MODIFIED);
    }

    @DeleteMapping(value="/post/{id}")
    public ResponseEntity<?> delete(@PathVariable(name="id") long id) {
        final boolean isDeleted = serviceTableService.deleteEntity(id);
        return isDeleted
                ? new ResponseEntity<>(HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.NOT_MODIFIED);
    }

}
