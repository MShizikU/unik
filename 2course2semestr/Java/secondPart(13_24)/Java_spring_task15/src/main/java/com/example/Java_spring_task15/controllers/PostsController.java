package com.example.Java_spring_task15.controllers;

import com.example.Java_spring_task15.dao.PostDAO;
import com.example.Java_spring_task15.models.Post;
import com.example.Java_spring_task15.utils.PostNotFoundException;
import com.example.Java_spring_task15.utils.PostResponse;
import com.example.Java_spring_task15.utils.PostValidator;
import com.example.Java_spring_task15.utils.WrongPostDataException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/posts")
public class PostsController {
    private final PostDAO postDAO;
    private final PostValidator workerValidator;

    @Autowired
    public PostsController(PostDAO postDAO, PostValidator workerValidator) {
        this.postDAO = postDAO;
        this.workerValidator = workerValidator;
    }

    @GetMapping
    public List<Post> getAll() {
        return postDAO.findAll();
    }

    @PostMapping
    public HttpStatus add(@RequestBody Post post) throws WrongPostDataException {
        if(!workerValidator.validate(post))
            throw new WrongPostDataException("Wrong values in fields");
        postDAO.save(post);
        return HttpStatus.OK;
    }

    @DeleteMapping("/{id}")
    public HttpStatus delete(@PathVariable("id") int id) throws PostNotFoundException {
        postDAO.delete(id);
        return HttpStatus.OK;
    }

    @ExceptionHandler
    public ResponseEntity<PostResponse> notFound(PostNotFoundException e) {
        PostResponse response = new PostResponse(e.getMessage());
        return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler
    public ResponseEntity<PostResponse> wrongWorkerFields(WrongPostDataException e) {
        PostResponse response = new PostResponse(e.getMessage());
        return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
    }
}
