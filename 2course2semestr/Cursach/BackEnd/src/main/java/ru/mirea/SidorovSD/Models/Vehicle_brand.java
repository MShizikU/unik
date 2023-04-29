package ru.mirea.SidorovSD.Models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "Vehicle_brand")
public class Vehicle_brand {

    @Id
    @Column(name = "ID_brand")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idBrand;

    @Column(name = "brand_name")
    private String brandName;

}
