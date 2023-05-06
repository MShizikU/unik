package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ru.mirea.SidorovSD.Models.Rent;

import java.util.List;

public interface RentRepo extends JpaRepository<Rent, Integer> {

    @Override
    List<Rent> findAll();

    @Query(value = "SELECT * FROM users WHERE snpassport = ?1 , end_time = 'none'", nativeQuery = true)
    Rent findActiveRent(String snpassport);

    Rent findByIdRent(int idRent);

    List<Rent> findBySnpassport(String snpassport);

    List<Rent> findByVin(String vin);


}
