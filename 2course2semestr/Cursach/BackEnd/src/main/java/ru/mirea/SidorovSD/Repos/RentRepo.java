package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.Rent;

public interface RentRepo extends JpaRepository<Rent, Integer> {
}
