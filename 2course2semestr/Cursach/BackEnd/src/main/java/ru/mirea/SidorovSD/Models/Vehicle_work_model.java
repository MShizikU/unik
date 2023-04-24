package ru.mirea.SidorovSD.Models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "Vehicle_work_model")
public class Vehicle_work_model {
    @Id
    @Column(name = "ID_vehicle_work_model")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int iVehicleWorkModelID;

    @Column(name = "price_per_hour")
    private int iPricePerHour;

    @JoinColumn(name = "ID_vehicle_name", referencedColumnName = "ID_vehicle_name")
    private int iVehicleNameID;

    @Override
    public String toString() {
        return "Vehicle_work_model{" +
                "iVehicleWorkModelID=" + iVehicleWorkModelID +
                ", iPricePerHour=" + iPricePerHour +
                ", iVehicleNameID=" + iVehicleNameID +
                '}';
    }
}
