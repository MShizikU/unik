package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.Level;

public interface LevelRepo extends JpaRepository<Level, Integer> {
}
