package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.Vehicle;
import ru.mirea.SidorovSD.Models.Vehicle_work_model;

import java.util.List;

public interface VehicleWorkModelRepo extends JpaRepository<Vehicle_work_model, Integer> {

    Vehicle_work_model findByIdVehicleWorkModel(int idVehicleWorkModel);

    List<Vehicle_work_model> findByPricePerHour(int pricePerHour);

    List<Vehicle_work_model> findByIdVehicleName(int idVehicleName);

    List<Vehicle_work_model> findByIdGroup(int idGroup);

}
