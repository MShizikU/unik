package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.Vehicle;

public interface VehicleRepo extends JpaRepository<Vehicle, Integer> {
}
