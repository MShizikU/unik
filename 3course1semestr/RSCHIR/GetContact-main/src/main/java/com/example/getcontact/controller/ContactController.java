package com.example.getcontact.controller;


import com.example.getcontact.entity.Contact;
import com.example.getcontact.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/api/v1/contacts")
public class ContactController {
    private final ContactService contactService;

    @Autowired
    public ContactController(ContactService contactService) {
        this.contactService = contactService;
    }

    @GetMapping("")
    public ResponseEntity<List<Contact>> getAllContacts() {
        return ResponseEntity.ofNullable(contactService.getAllContacts());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Contact> getContactById(@PathVariable Long id) {
        return ResponseEntity.ofNullable(contactService.getContactById(id).orElse(null));
    }

    @PostMapping("")
    public ResponseEntity<?> createContact(@RequestBody Contact contact) {
        Contact createdContact = contactService.createContact(contact);
        return (createdContact != null)
                ? ResponseEntity.ok(createdContact)
                : ResponseEntity.badRequest().body("Failed to create contact");
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateContactById(@PathVariable Long id, @RequestBody Contact updatedContact) {
        if (contactService.validateContact(updatedContact) == null) {
            return ResponseEntity.badRequest().body("Failed to update contact");
        }
        if (contactService.getContactById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        updatedContact.setId(id);
        return ResponseEntity.ok(contactService.updateContact(updatedContact));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteContact(@PathVariable Long id) {
        Optional<Contact> existingContact = contactService.getContactById(id);
        if (existingContact.isPresent()) {
            contactService.deleteContact(id);
            return ResponseEntity.ok("Contact deleted successfully");
        } else {
            return ResponseEntity.notFound().build();
        }
    }

}
