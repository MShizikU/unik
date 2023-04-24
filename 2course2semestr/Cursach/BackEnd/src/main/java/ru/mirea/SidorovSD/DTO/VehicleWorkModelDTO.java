package ru.mirea.SidorovSD.DTO;

import lombok.Data;
import ru.mirea.SidorovSD.Models.Vehicle_name;

@Data
public class VehicleWorkModelDTO {

    private int iVehicleWorkModelID;

    private int iPricePerHour;

    private Vehicle_name vehicle_name;

}
