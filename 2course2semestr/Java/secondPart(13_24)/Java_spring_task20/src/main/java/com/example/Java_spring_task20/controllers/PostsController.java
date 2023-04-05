package com.example.Java_spring_task20.controllers;

import com.example.Java_spring_task20.dto.PostDTO;
import com.example.Java_spring_task20.models.Post;
import com.example.Java_spring_task20.services.PostService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/posts")
public class PostsController {
    private final ModelMapper modelMapper;
    private final PostService postService;

    @Autowired
    public PostsController(ModelMapper modelMapper, PostService postService) {
        this.modelMapper = modelMapper;
        this.postService = postService;
    }


    @GetMapping
    public List<PostDTO> getAll() {
        return postService.findAll().stream().map(this::convertToPostDTO).collect(Collectors.toList());
    }

    @PostMapping
    public HttpStatus add(@RequestBody PostDTO postDTO) {
        postService.save(convertToWorker(postDTO));
        return HttpStatus.OK;
    }

    @DeleteMapping("/{id}")
    public HttpStatus delete(@PathVariable("id") int id) {
        postService.delete(id);
        return HttpStatus.OK;
    }

    private PostDTO convertToPostDTO(Post post) {
        PostDTO postDTO = modelMapper.map(post, PostDTO.class);
        return postDTO;
    }

    private Post convertToWorker(PostDTO postDTO) {
        return modelMapper.map(postDTO, Post.class);
    }
}
