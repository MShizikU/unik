package com.example.getcontact.service;

import com.example.getcontact.entity.Contact;
import com.example.getcontact.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class ContactService {
    private final ContactRepository contactRepository;

    @Autowired
    public ContactService(ContactRepository contactRepository) {
        this.contactRepository = contactRepository;
    }

    public List<Contact> getAllContacts() {
        return contactRepository.findAll();
    }

    public Optional<Contact> getContactById(Long id) {
        return contactRepository.findById(id);
    }

    public Contact validateContact(Contact contact) {
        if (Optional.ofNullable(contact).map(Contact::getName).isEmpty() ||
                Optional.of(contact).map(Contact::getLastname).isEmpty() ||
                Optional.of(contact).map(Contact::getPhoneNumber).isEmpty()) {
            return null;
        }

        String regex = "^(8|\\+7)-\\d{3}-\\d{3}-\\d{2}-\\d{2}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(contact.getPhoneNumber());

        if (!matcher.matches()) {
            return null;
        }
        return contact;
    }

    public Contact createContact(Contact contact) {
        return Optional.ofNullable(validateContact(contact))
                .map(contactRepository::save)
                .orElse(null);

    }


    public Contact updateContact(Contact contact) {
        return contactRepository.save(contact);
    }

    public void deleteContact(Long id) {
        contactRepository.deleteById(id);
    }
}
