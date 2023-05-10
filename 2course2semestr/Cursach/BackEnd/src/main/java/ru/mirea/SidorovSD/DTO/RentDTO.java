package ru.mirea.SidorovSD.DTO;

import lombok.Data;
import ru.mirea.SidorovSD.Models.User;
import ru.mirea.SidorovSD.Models.Vehicle;

@Data
public class RentDTO {

    private int idRent;

    private String snpassport;
    private String vin;

    private int duration;

    private String startingPoint, endPoint, startTime, endTime;
}
