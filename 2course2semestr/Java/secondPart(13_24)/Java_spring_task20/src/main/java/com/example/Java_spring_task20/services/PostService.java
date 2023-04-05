package com.example.Java_spring_task20.services;

import com.example.Java_spring_task20.models.Post;
import com.example.Java_spring_task20.repositories.PostRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
public class PostService {
    private final PostRepository postRepository;

    @Autowired
    public PostService(PostRepository postRepository) {

        this.postRepository = postRepository;
    }

    @Transactional(readOnly = true)
    public List<Post> findAll() {
        log.info("Post find all" );
        return postRepository.findAll();
    }

    @Transactional
    public void save(Post post) {
        log.info("Post save" );
        postRepository.save(post);
    }

    @Transactional
    public void delete(int id) {
        log.info("Post delete" );
        postRepository.deleteById(id);
    }
}
