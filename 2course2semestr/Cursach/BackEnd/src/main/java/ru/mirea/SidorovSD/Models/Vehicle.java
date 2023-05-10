package ru.mirea.SidorovSD.Models;


import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "Vehicle")
public class Vehicle {

    @Id
    @Column(name = "VIN")
    private String vin;

    @JoinColumn(name = "ID_vehicle_work_model", referencedColumnName = "ID_vehicle_work_model")
    private int idVehicleWorkModel;

    @Column(name = "color")
    private String color;

    @Column(name = "state")
    private String state;

    @Column(name = "place")
    private String place;


    @Override
    public String toString() {
        return "Vehicle{" +
                "VIN='" + vin + '\'' +
                ", iVehicleWorkModelID=" + idVehicleWorkModel +
                ", stColor='" + color + '\'' +
                ", stState='" + state + '\'' +
                ", stPlace='" + place + '\'' +
                '}';
    }
}
