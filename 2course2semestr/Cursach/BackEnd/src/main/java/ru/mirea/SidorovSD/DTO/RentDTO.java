package ru.mirea.SidorovSD.DTO;

import lombok.Data;
import ru.mirea.SidorovSD.Models.User;
import ru.mirea.SidorovSD.Models.Vehicle;

@Data
public class RentDTO {

    private int idRent;

    private User user;
    private Vehicle vehicle;

    private int duration;

    private String startPoint, endPoint, startTime, endTime;
}
