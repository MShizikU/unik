package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.mirea.SidorovSD.Models.User;

import java.util.Optional;

@Repository
public interface UserRepo extends JpaRepository<User, Integer> {
    User findBySnpassport(String username);



}
