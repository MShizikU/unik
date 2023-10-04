package com.example.getcontact.repository;

import com.example.getcontact.entity.Telephone;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface TelephoneRepository extends JpaRepository<Telephone, Long> {
    List<Telephone> findByManufacturerContainingIgnoreCase(String manufacturer);
    List<Telephone> findBySellerId(Long sellerId);
    List<Telephone> findByProductTypeContainingIgnoreCase(String productType);
    List<Telephone> findByPriceLessThanEqual(BigDecimal price);
    List<Telephone> findByNameContainingIgnoreCase(String name);
}
