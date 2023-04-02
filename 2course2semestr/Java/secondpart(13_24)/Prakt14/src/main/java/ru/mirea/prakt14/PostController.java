package ru.mirea.prakt14;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Controller
public class PostController {
    private ArrayList<Post> list2 = new ArrayList<>();


    @PostMapping(value = "/add-post")
    @ResponseBody
    public String createGroup(@RequestParam("postText") String text, @RequestParam("creationDate") String creationDate) {
        System.out.println(text);
        System.out.println(creationDate);
        Post post = new Post(text, creationDate);
        list2.add(post);
        return post.toString();
    }

    @GetMapping(value = "/show-posts")
    @ResponseBody
    public Object[] showGroups() {
        return list2.stream()
                .filter(Objects::nonNull).toArray();
    }

    @GetMapping(value = "/delete-post")
    @ResponseBody
    public boolean deleteGroup(@RequestParam("creationDate") String creationDate) {
        int temp = list2.size();
        list2.removeIf(i -> i.getCreationDate().equals(creationDate));
        return temp != list2.size();
    }
}

