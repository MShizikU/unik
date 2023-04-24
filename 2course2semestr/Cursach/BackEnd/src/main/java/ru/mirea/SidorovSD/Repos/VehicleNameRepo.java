package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.Vehicle_name;

public interface VehicleNameRepo extends JpaRepository<Vehicle_name, Integer> {
}
