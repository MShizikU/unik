package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.Level;

import java.util.List;

public interface LevelRepo extends JpaRepository<Level, Integer> {

    @Override
    List<Level> findAll();

    Level findByIdLevel(int idLevel);

    Level findByLevelName(String levelName);

}
