package com.example.Java_spring_task24;

import com.example.Java_spring_task24.models.Post;
import com.example.Java_spring_task24.repositories.PostRepository;
import com.example.Java_spring_task24.services.PostService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

@ExtendWith(MockitoExtension.class)
public class PostServiceTest {
    @Mock
    private PostRepository postRepository;
    @Captor
    private ArgumentCaptor<Post> captor;

    @Test
    void getPosts() {
        Post post = new Post();
        post.setCreationDate("day1");
        Post post1 = new Post();
        post.setCreationDate("day2");
        Post post2 = new Post();
        post.setCreationDate("day3");

        Mockito.when(postRepository.findAll()).thenReturn(List.of(post, post1, post2));
        PostService postService = new PostService(postRepository);

        Assertions.assertEquals(3, postService.findAll().size());
        Assertions.assertEquals(post.getCreationDate(), postService.findAll().get(0).getCreationDate());
    }

    @Test
    void save() {
        Post post = new Post();
        post.setCreationDate("dayTest");

        PostService service = new PostService(postRepository);
        service.save(post);
        Mockito.verify(postRepository).save(captor.capture());
        Post post1 = captor.getValue();

        Assertions.assertEquals("dayTest", post1.getCreationDate());
    }

}
