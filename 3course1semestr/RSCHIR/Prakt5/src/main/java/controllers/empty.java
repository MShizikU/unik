package controllers;

import models.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import repos.BookRepository;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/")
public class empty {

    @GetMapping("/")
    public String getAllBooks() {
        return "empty";
    }
}
