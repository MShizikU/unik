package ru.mirea.SidorovSD.Models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "Vehicle_name")
public class Vehicle_name {

    @Id
    @Column(name = "ID_vehicle_name")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idVehicleName;

    @JoinColumn(name = "ID_brand", referencedColumnName = "ID_brand")
    private int idBrand;

    @JoinColumn(name = "ID_model", referencedColumnName = "ID_model")
    private int idModel;

}
