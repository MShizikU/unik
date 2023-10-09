package mirea.ru.prakt6.service;

import mirea.ru.prakt6.model.Contact;
import mirea.ru.prakt6.repos.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ContactService {

    @Autowired
    private ContactRepository contactRepository;

    public List<Contact> getContactAll(){
        return contactRepository.findAll();
    }

    public Contact getContactById(Long id) {
        return contactRepository.findById(id).orElse(null);
    }

    public Contact createContact(Contact contact) {
        return  contactRepository.save(contact);
    }

    public Contact updateContact(Long id, Contact contact) {
        Contact existingContact = getContactById(id);
        existingContact.setName(contact.getName());
        existingContact.setLastname(contact.getLastname());
        existingContact.setPhoneNumber(contact.getPhoneNumber());
        return (Contact) contactRepository.save(existingContact);
    }

    public void deleteContact(Long id) {
        Contact existingContact = getContactById(id);
        contactRepository.delete(existingContact);
    }
}
