package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ru.mirea.SidorovSD.Models.Rent;

import java.util.List;

public interface RentRepo extends JpaRepository<Rent, Integer> {

    @Override
    List<Rent> findAll();
    @Query(value = "SELECT * FROM rent WHERE snpassport = ?1 AND end_time = 'none'", nativeQuery = true)
    Rent findActiveRent(String snpassport);
    @Query(value = "SELECT * FROM rent WHERE id_rent = ?1", nativeQuery = true)
    Rent findById_rent(int idRent);

    List<Rent> findBySnpassport(String snpassport);

    List<Rent> findByVin(String vin);

}
