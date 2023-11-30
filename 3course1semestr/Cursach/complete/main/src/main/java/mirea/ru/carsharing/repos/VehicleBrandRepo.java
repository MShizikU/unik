package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.VehicleBrand;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface VehicleBrandRepo extends JpaRepository<VehicleBrand, Integer> {
    Optional<VehicleBrand> findByBrandNameAndDivision(String brandName, String division);
}
