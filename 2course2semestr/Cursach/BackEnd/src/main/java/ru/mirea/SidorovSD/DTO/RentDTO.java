package ru.mirea.SidorovSD.DTO;

import lombok.Data;
import ru.mirea.SidorovSD.Models.User;
import ru.mirea.SidorovSD.Models.Vehicle;

@Data
public class RentDTO {

    private int iRentID;

    private User user;
    private Vehicle vehicle;

    private int iDuration;

    private String stStartPoint, stEndPoint, stStartTime, stEndTime;
}
