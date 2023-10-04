package com.example.getcontact.repository;

import com.example.getcontact.entity.WashingMachine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface WashingMachineRepository extends JpaRepository<WashingMachine, Long> {
    List<WashingMachine> findByManufacturerContainingIgnoreCase(String manufacturer);
    List<WashingMachine> findBySellerId(Long sellerId);
    List<WashingMachine> findByProductTypeContainingIgnoreCase(String productType);
    List<WashingMachine> findByPriceLessThanEqual(BigDecimal price);
    List<WashingMachine> findByNameContainingIgnoreCase(String name);
}