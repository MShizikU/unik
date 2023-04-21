package com.example.Java_spring_task24.services;

import com.example.Java_spring_task24.dto.PostDTO;
import com.example.Java_spring_task24.models.Post;
import com.example.Java_spring_task24.models.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jmx.export.annotation.ManagedResource;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.List;
import java.util.Objects;


@Service
@Slf4j
@ManagedResource(description = "Scheduler service bean")
public class SchedulerService {
    private final UserService userService;
    private final PostService postService;
    private final ModelMapper modelMapper;

    private final String DIRECTORY;

    @Autowired
    public SchedulerService(UserService userService, PostService postService,
                            ModelMapper modelMapper) {
        this.userService = userService;
        this.postService = postService;
        this.modelMapper = modelMapper;
        DIRECTORY = "src/backup";
    }

    @Scheduled(cron = "0 1 * * * *")
    public void scheduledTask() throws IOException {
        List<User> manufactures = userService.findAll();
        ObjectMapper mapper = new ObjectMapper();
        File directory = new File(DIRECTORY);

        for(User x : manufactures) {
            String name = "User " + x.getId() + ".txt";
            File file = new File(directory.getAbsolutePath() + "/" + name);
            file.createNewFile();
            FileWriter fileWriter = new FileWriter(file.getAbsoluteFile());
            fileWriter.write(mapper.writeValueAsString(x));
            fileWriter.flush();
        }

        List<Post> workers = postService.findAll();
        for(Post x : workers) {
            String name = "Post " + x.getId() + ".txt";
            File file = new File(directory.getAbsolutePath() + "/" + name);
            file.createNewFile();
            FileWriter fileWriter = new FileWriter(file.getAbsoluteFile());
            fileWriter.write(mapper.writeValueAsString(convertToPostDTO(x)));
            fileWriter.flush();
        }
    }

    private PostDTO convertToPostDTO(Post worker) {
        PostDTO workerDTO = modelMapper.map(worker, PostDTO.class);
        return workerDTO;
    }
}
