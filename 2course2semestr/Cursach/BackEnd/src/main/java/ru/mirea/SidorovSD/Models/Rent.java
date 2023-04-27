package ru.mirea.SidorovSD.Models;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Generated;

@Entity
@Data
@Table(name = "Rent")
public class Rent {
    @Id
    @Column(name = "ID_rent")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int iRentID;

    @JoinColumn(name = "SNPassport", referencedColumnName = "SNPassport")
    private String stSNPassport;

    @JoinColumn(name = "VIN", referencedColumnName = "VIN")
    private String stVIN;

    @Column(name = "duration")
    private int iDuration;

    @Column(name = "starting_point")
    private String stStartingPoint;

    @Column(name = "end_point")
    private String stEndPoint;

    @Column(name = "start_time")
    private String stStartTime;

    @Column(name = "end_time")
    private String stEndTime;

    @Override
    public String toString() {
        return "Rent{" +
                "iRentID=" + iRentID +
                ", stSNPassport='" + stSNPassport + '\'' +
                ", stVIN='" + stVIN + '\'' +
                ", iDuration=" + iDuration +
                ", stStartingPoint='" + stStartingPoint + '\'' +
                ", stEndPoint='" + stEndPoint + '\'' +
                ", stStartTime='" + stStartTime + '\'' +
                ", stEndTime='" + stEndTime + '\'' +
                '}';
    }
}
