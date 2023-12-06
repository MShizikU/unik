package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.Rent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface RentRepo extends JpaRepository<Rent, Integer> {

    Optional<List<Rent>> findBySnpassport(Long snpassport);

    @Query(value = "SELECT * FROM rents WHERE snpassport = ?1 AND end_time IS NULL", nativeQuery = true)
    Optional<Rent> findActiveRent(Long snpassport);

    Optional<List<Rent>> findByVin(String vin);
}
