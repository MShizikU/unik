package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.Rent;

import java.util.List;

public interface RentRepo extends JpaRepository<Rent, Integer> {

    @Override
    List<Rent> findAll();

    Rent findByIdRent(int idRent);

    List<Rent> findBySnpassport(String snpassport);

    List<Rent> findByVin(String vin);
}
