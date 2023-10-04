package com.example.getcontact.repository;

import com.example.getcontact.entity.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long> {
    Client findByEmail(String email);
    Client findByLogin(String login);
    List<Client> findByNameContainingIgnoreCase(String name);
}
