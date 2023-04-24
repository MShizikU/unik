package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.User;

public interface UserRepo extends JpaRepository<User, Integer> {
}
