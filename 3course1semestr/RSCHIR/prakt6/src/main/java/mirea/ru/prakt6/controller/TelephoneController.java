package mirea.ru.prakt6.controller;

import mirea.ru.prakt6.model.Telephone;
import mirea.ru.prakt6.service.TelephoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/telephones")
public class TelephoneController {

    @Autowired
    private TelephoneService telephoneService;

    @GetMapping
    public ResponseEntity<List<Telephone>> getTelephoneById() {
        return ResponseEntity.ofNullable(telephoneService.getTelephoneAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Telephone> getTelephoneById(@PathVariable Long id) {
        Telephone telephone = telephoneService.getTelephoneById(id);
        return ResponseEntity.ok(telephone);
    }

    @PostMapping
    public ResponseEntity<Telephone> createTelephone(@RequestBody Telephone telephone) {
        Telephone createdTelephone = telephoneService.createTelephone(telephone);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdTelephone);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Telephone> updateTelephone(@PathVariable Long id, @RequestBody Telephone telephone) {
        Telephone updatedTelephone = telephoneService.updateTelephone(id, telephone);
        return ResponseEntity.ok(updatedTelephone);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTelephone(@PathVariable Long id) {
        telephoneService.deleteTelephone(id);
        return ResponseEntity.noContent().build();
    }
}
