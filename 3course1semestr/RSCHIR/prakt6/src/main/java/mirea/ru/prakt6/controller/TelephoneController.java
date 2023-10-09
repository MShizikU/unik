package mirea.ru.prakt6.controller;

import mirea.ru.prakt6.DTO.TelephoneDTO;
import mirea.ru.prakt6.model.Telephone;
import mirea.ru.prakt6.service.ContactService;
import mirea.ru.prakt6.service.ProductService;
import mirea.ru.prakt6.service.TelephoneService;
import mirea.ru.prakt6.view.TelephoneViewer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/telephones")
public class TelephoneController {

    @Autowired
    private TelephoneService telephoneService;
    @Autowired
    private ContactService contactService;
    @Autowired
    private ProductService productService;

    @GetMapping
    public ResponseEntity<ArrayList<TelephoneDTO>> getTelephoneById() {
        return ResponseEntity.ofNullable(TelephoneViewer.createTelephonesView(telephoneService.getTelephoneAll(), contactService.getContactAll(), productService.getProductAll()));
    }

    @GetMapping("/{id}")
    public ResponseEntity<TelephoneDTO> getTelephoneById(@PathVariable Long id) {
        Telephone telephone = telephoneService.getTelephoneById(id);
        return ResponseEntity.ok(TelephoneViewer.createTelephoneView(telephone, contactService.getContactAll(), productService.getProductAll()));
    }

    @PostMapping
    public ResponseEntity<TelephoneDTO> createTelephone(@RequestBody Telephone telephone) {
        Telephone createdTelephone = telephoneService.createTelephone(telephone);
        return ResponseEntity.status(HttpStatus.CREATED).body(TelephoneViewer.createTelephoneView(createdTelephone, contactService.getContactAll(), productService.getProductAll()));
    }

    @PutMapping("/{id}")
    public ResponseEntity<TelephoneDTO> updateTelephone(@PathVariable Long id, @RequestBody Telephone telephone) {
        Telephone updatedTelephone = telephoneService.updateTelephone(id, telephone);
        return ResponseEntity.ok(TelephoneViewer.createTelephoneView(updatedTelephone, contactService.getContactAll(), productService.getProductAll()));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTelephone(@PathVariable Long id) {
        telephoneService.deleteTelephone(id);
        return ResponseEntity.noContent().build();
    }
}
