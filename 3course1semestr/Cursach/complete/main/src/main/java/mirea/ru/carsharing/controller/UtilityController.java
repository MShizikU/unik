package mirea.ru.carsharing.controller;


import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class UtilityController {
    @GetMapping("/api/css/{filename:.+}")
    public ResponseEntity<Resource> getCssFile(@PathVariable String filename) {
        Resource resource = new ClassPathResource("static/css/" + filename);

        return ResponseEntity.ok()
                .body(resource);
    }
}
