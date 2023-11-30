package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.Rent;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RentRepo extends JpaRepository<Rent, Integer> {

    Rent findByUserSnpassport(String snpassport);

    Rent findByVehicleVin(String vin);
}
