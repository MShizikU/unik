package com.example.getcontact;

import com.example.getcontact.controller.ContactController;


import static org.junit.jupiter.api.Assertions.*;

import com.example.getcontact.entity.Contact;
import com.example.getcontact.service.ContactService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.ResponseEntity;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.TestPropertySource;

import java.util.List;


@SpringBootTest
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)
@TestPropertySource(locations = "classpath:application.properties")
public class GetContactApplicationTests {

    @Autowired
    private ContactService contactService;

    @Autowired
    private ContactController contactController;

    @Test
    public void testGetAllContacts() {
        Contact contact1 = new Contact(1L, "John", "Taylor", "8-992-287-15-54");
        Contact contact2 = new Contact(2L, "Alice", "Taylor", "8-992-287-15-54");
        contactService.createContact(contact1);
        contactService.createContact(contact2);
        ResponseEntity<List<Contact>> response = contactController.getAllContacts();
        assertEquals(200, response.getStatusCode().value());
        List<Contact> contacts = response.getBody();
        List<Contact> expectedContacts = List.of(contact1, contact2);
        Assertions.assertIterableEquals(expectedContacts, contacts);
    }

    @Test
    public void testGetAllContactsNull() {
        ResponseEntity<List<Contact>> response = contactController.getAllContacts();
        assertEquals(200, response.getStatusCode().value());
        assertTrue(response.getBody().isEmpty());
    }

    @Test
    public void testGetContactsById() {
        Contact contact1 = new Contact(1L, "John", "Taylor", "8-992-287-15-54");
        contactService.createContact(contact1);
        ResponseEntity<Contact> response = contactController.getContactById(1L);
        assertEquals(200, response.getStatusCode().value());
        Contact contact = response.getBody();
        assertEquals(contact, contact1);
    }

    @Test
    public void testGetContactsByIdNull() {
        ResponseEntity<Contact> response = contactController.getContactById(1L);
        assertEquals(404, response.getStatusCode().value());
        Contact contact = response.getBody();
        assertNull(contact);
    }

    @Test
    public void testCreateContactNull1() {
        Contact contact = new Contact();
        ResponseEntity<?> response = contactController.createContact(contact);
        System.out.println(response.getBody());
        assertEquals(400, response.getStatusCode().value());
        assertEquals(response.getBody(), "Failed to create contact");
    }

    @Test
    public void testCreateContactNull2() {
        ResponseEntity<?> response = contactController.createContact(null);
        System.out.println(response.getBody());
        assertEquals(400, response.getStatusCode().value());
        assertEquals(response.getBody(), "Failed to create contact");
    }

    @Test
    public void testCreateContactNull3() {
        Contact contact = new Contact(1L, "John", "Taylor", "8-992-287-1554");
        ResponseEntity<?> response = contactController.createContact(contact);
        assertEquals(400, response.getStatusCode().value());
        assertEquals(response.getBody(), "Failed to create contact");
    }

    @Test
    public void testCreateContact() {
        Contact contact = new Contact(1L, "John", "Taylor", "8-992-287-15-54");
        ResponseEntity<?> response = contactController.createContact(contact);
        assertEquals(200, response.getStatusCode().value());
        assertEquals(response.getBody(), contact);
    }



    @Test
    public void testDeleteContact() {
        Contact contact = new Contact(1L, "John", "Taylor", "8-992-287-15-54");
        contactController.createContact(contact);
        ResponseEntity<?> response = contactController.deleteContact(1L);
        assertEquals(200, response.getStatusCode().value());
        assertEquals(response.getBody(), "Contact deleted successfully");
    }

    @Test
    public void testDeleteContactNull() {
        ResponseEntity<?> response = contactController.deleteContact(1L);
        assertEquals(404, response.getStatusCode().value());
        assertNull(response.getBody());
    }

    @Test
    public void testUpdateContact() {
        Contact contact = new Contact(1L, "John", "Taylor", "8-992-287-15-54");
        contactController.createContact(contact);
        Contact contact1 = new Contact(1L, "Sed", "Taylor", "8-992-287-15-54");

        ResponseEntity<?> response = contactController.updateContactById(1L, contact1);
        assertEquals(200, response.getStatusCode().value());
        assertEquals(response.getBody(), contact1);
    }

    @Test
    public void testUpdateContactNull1() {
        Contact contact = new Contact(1L, "John", "Taylor", "8-992-287-15-54");
        contactController.createContact(contact);
        ResponseEntity<?> response = contactController.updateContactById(1L, new Contact());
        assertEquals(400, response.getStatusCode().value());
        assertEquals("Failed to update contact", response.getBody());
    }

    @Test
    public void testUpdateContactNull2() {
        Contact contact = new Contact(1L, "John", "Taylor", "8-992-287-15-54");
        contactController.createContact(contact);
        ResponseEntity<?>  response = contactController.updateContactById(2L, contact);
        assertEquals(404, response.getStatusCode().value());
    }

}
