package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.Vehicle_brand;
import ru.mirea.SidorovSD.Models.Vehicle_model;

public interface VehicleModelRepo extends JpaRepository<Vehicle_model, Integer> {

    Vehicle_model findByIdModel(int idModel);
}
