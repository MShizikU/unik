package com.example.Java_spring_task14.dao;

import com.example.Java_spring_task14.models.Post;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class PostDAO {
    private ArrayList<Post> posts;

    public PostDAO() {
        posts = new ArrayList<>();
        posts.add(new Post("a", "04.03.2024"));
        posts.add(new Post("ab", "03.03.2024"));
        posts.add(new Post("ac", "02.03.2024"));
        posts.add(new Post("ad", "01.03.2024"));
        posts.add(new Post("ae", "12.03.2024"));
        posts.add(new Post("af", "13.03.2024"));
    }

    public void save(Post post) {
        posts.add(post);
    }

    public void delete(String creationDate) {
        posts.removeIf(it -> it.getCreationDate().equals(creationDate));
    }

    public List<Post> findAll() {
        return posts;
    }
}
