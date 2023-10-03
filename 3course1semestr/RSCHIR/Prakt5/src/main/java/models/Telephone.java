package models;

import jakarta.persistence.Entity;
import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;

@Entity
@Data
public class Telephone {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "manufacturer")
    private String manufacturer;

    @Column(name = "battery_capacity")
    private Integer batteryCapacity;

    @Column(name = "seller_id")
    private Long sellerId;

    @Column(name = "product_type")
    private String productType;

    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "name")
    private String name;

    // getters and setters
}
