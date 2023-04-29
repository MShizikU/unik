package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.Group;

import java.util.List;

public interface GroupRepo extends JpaRepository<Group, Integer> {

    @Override
    List<Group> findAll();

}
