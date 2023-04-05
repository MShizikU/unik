package com.example.Java_spring_task17.controllers;


import com.example.Java_spring_task17.dao.PostDAO;
import com.example.Java_spring_task17.dto.PostDTO;
import com.example.Java_spring_task17.models.Post;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/posts")
public class PostsController {
    private final PostDAO postDAO;
    private final ModelMapper modelMapper;

    @Autowired
    public PostsController(PostDAO workersDao, ModelMapper modelMapper) {
        this.postDAO = workersDao;
        this.modelMapper = modelMapper;
    }

    @GetMapping
    public List<PostDTO> getAll() {
        return postDAO.findAll().stream().map(this::convertToWorkerDTO).collect(Collectors.toList());
    }

    @PostMapping
    public HttpStatus add(@RequestBody PostDTO postDTO) {
        postDAO.save(convertToWorker(postDTO));
        return HttpStatus.OK;
    }

    @DeleteMapping("/{id}")
    public HttpStatus delete(@PathVariable("id") int id) {
        postDAO.delete(id);
        return HttpStatus.OK;
    }

    @GetMapping("/without")
    public List<PostDTO> getWithout() {
        List<Post> posts = postDAO.getWorkersWithouManifacture();
        return posts.stream().map(this::convertToWorkerDTO).collect(Collectors.toList());
    }

    @GetMapping("/text")
    public PostDTO findByName(@RequestParam("text")String text) {
        Post post = postDAO.findByText(text);
        return convertToWorkerDTO(post);
    }

    @GetMapping("/with")
    public List<PostDTO> getWith() {
        List<Post> posts = postDAO.getWithUser();
        return posts.stream().map(this::convertToWorkerDTO).collect(Collectors.toList());
    }

    @GetMapping("/gt")
    public List<PostDTO> greaterThan(@RequestParam("id")int id) {
        List<Post> posts = postDAO.greaterThanById(id);
        return posts.stream().map(this::convertToWorkerDTO).collect(Collectors.toList());
    }

    private PostDTO convertToWorkerDTO(Post post) {
        PostDTO postDTO = modelMapper.map(post, PostDTO.class);
        return postDTO;
    }

    private Post convertToWorker(PostDTO postDTO) {
        return modelMapper.map(postDTO, Post.class);
    }
}
