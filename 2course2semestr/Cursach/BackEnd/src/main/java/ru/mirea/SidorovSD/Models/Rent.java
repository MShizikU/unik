package ru.mirea.SidorovSD.Models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "Rent")
public class Rent {
    @Id
    @Column(name = "ID_rent")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int iRentID;

    @JoinColumn(name = "SNPassport", referencedColumnName = "SNPassport")
    private String snpassport;

    @JoinColumn(name = "VIN", referencedColumnName = "VIN")
    private String vin;

    @Column(name = "duration")
    private int duration;

    @Column(name = "starting_point")
    private String startingPoint;

    @Column(name = "end_point")
    private String endPoint;

    @Column(name = "start_time")
    private String startTime;

    @Column(name = "end_time")
    private String endTime;

    @Override
    public String toString() {
        return "Rent{" +
                "iRentID=" + iRentID +
                ", stSNPassport='" + snpassport + '\'' +
                ", stVIN='" + vin + '\'' +
                ", iDuration=" + duration +
                ", stStartingPoint='" + startingPoint + '\'' +
                ", stEndPoint='" + endPoint + '\'' +
                ", stStartTime='" + startTime + '\'' +
                ", stEndTime='" + endTime + '\'' +
                '}';
    }
}
