package com.example.Java_spring_task16.controllers;

import com.example.Java_spring_task16.dao.PostDAO;
import com.example.Java_spring_task16.dto.PostDTO;
import com.example.Java_spring_task16.models.Post;
import com.example.Java_spring_task16.utils.PostNotFoundException;
import com.example.Java_spring_task16.utils.PostValidator;
import com.example.Java_spring_task16.utils.WrongPostDataException;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/posts")
public class PostsController {
    private final PostDAO postsService;
    private final PostValidator postValidator;
    private final ModelMapper modelMapper;

    @Autowired
    public PostsController(PostDAO postsService, PostValidator postValidator, ModelMapper modelMapper) {
        this.postsService = postsService;
        this.postValidator = postValidator;
        this.modelMapper = modelMapper;
    }

    @GetMapping
    public List<PostDTO> getAll() {
        return postsService.findAll().stream().map(this::convertToWorkerDTO).collect(Collectors.toList());
    }

    @PostMapping
    public HttpStatus add(@RequestBody PostDTO postDTO) throws WrongPostDataException {
        postsService.save(convertToWorker(postDTO));
        return HttpStatus.OK;
    }

    @DeleteMapping("/{id}")
    public HttpStatus delete(@PathVariable("id") int id) throws PostNotFoundException {
        postsService.delete(id);
        return HttpStatus.OK;
    }

    private PostDTO convertToWorkerDTO(Post post) {
        PostDTO postDTO = modelMapper.map(post, PostDTO.class);
        return postDTO;
    }

    private Post convertToWorker(PostDTO postDTO) {
        return modelMapper.map(postDTO, Post.class);
    }
}
