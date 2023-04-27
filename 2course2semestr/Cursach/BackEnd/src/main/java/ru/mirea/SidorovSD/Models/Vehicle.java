package ru.mirea.SidorovSD.Models;


import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "Vehicle")
public class Vehicle {

    @Id
    @Column(name = "VIN")
    private String VIN;

    @JoinColumn(name = "ID_vehicle_work_model", referencedColumnName = "ID_vehicle_work_model")
    private int iVehicleWorkModelID;

    @Column(name = "color")
    private String stColor;

    @Column(name = "state")
    private String stState;

    @Column(name = "place")
    private String stPlace;

    @JoinColumn(name = "ID_group", referencedColumnName = "ID_group")
    private int iGroupID;

    @Override
    public String toString() {
        return "Vehicle{" +
                "VIN='" + VIN + '\'' +
                ", iVehicleWorkModelID=" + iVehicleWorkModelID +
                ", stColor='" + stColor + '\'' +
                ", stState='" + stState + '\'' +
                ", stPlace='" + stPlace + '\'' +
                ", iGroupID=" + iGroupID +
                '}';
    }
}
