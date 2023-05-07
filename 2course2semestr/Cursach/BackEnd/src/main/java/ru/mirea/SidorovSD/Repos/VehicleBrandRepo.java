package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.Vehicle_brand;

public interface VehicleBrandRepo extends JpaRepository<Vehicle_brand, Integer> {

    Vehicle_brand findByIdBrand(int idBrand);

    Vehicle_brand findByBrandName(String brandName);


}
