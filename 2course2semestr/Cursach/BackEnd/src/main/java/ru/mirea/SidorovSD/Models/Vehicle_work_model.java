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
    private int idVehicleWorkModel;

    @Column(name = "model_photo_name")
    private String modelPhotoName;

    @Column(name = "price_per_hour")
    private int pricePerHour;

    @JoinColumn(name = "ID_vehicle_name", referencedColumnName = "ID_vehicle_name")
    private int idVehicleName;


    @JoinColumn(name = "ID_group", referencedColumnName = "ID_group")
    private int idGroup;

    @Override
    public String toString() {
        return "Vehicle_work_model{" +
                "iVehicleWorkModelID=" + idVehicleWorkModel +
                ", iPricePerHour=" + pricePerHour +
                ", iVehicleNameID=" + idVehicleName +
                '}';
    }
}
