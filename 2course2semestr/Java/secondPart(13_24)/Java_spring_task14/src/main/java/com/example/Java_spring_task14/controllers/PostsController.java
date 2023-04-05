package com.example.Java_spring_task14.controllers;

import com.example.Java_spring_task14.dao.PostDAO;
import com.example.Java_spring_task14.models.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/posts")
public class PostsController {
    private final PostDAO postDAO;

    @Autowired
    public PostsController(PostDAO postDAO) {
        this.postDAO = postDAO;
    }

    @GetMapping
    public List<Post> getAll() {
        return postDAO.findAll();
    }

    @PostMapping
    public HttpStatus add(@RequestBody Post post){
        postDAO.save(post);
        return HttpStatus.OK;
    }

    @DeleteMapping("/{creationDate}")
    public HttpStatus delete(@PathVariable("creationDate") String creationDate) {
        postDAO.delete(creationDate);
        return HttpStatus.OK;
    }
}
