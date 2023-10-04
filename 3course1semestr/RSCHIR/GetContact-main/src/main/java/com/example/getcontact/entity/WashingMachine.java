package com.example.getcontact.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
public class WashingMachine {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "manufacturer")
    private String manufacturer;

    @Column(name = "tank_capacity")
    private Integer tankCapacity;

    @Column(name = "seller_id")
    private Long sellerId;

    @Column(name = "product_type")
    private String productType;

    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "name")
    private String name;
}
