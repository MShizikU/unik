package ru.mirea.SidorovSD.DTO;

import lombok.Data;
import ru.mirea.SidorovSD.Models.Vehicle_brand;
import ru.mirea.SidorovSD.Models.Vehicle_model;

@Data
public class VehicleNameDTO {

    private int idVehicleName;

    private Vehicle_model vehicle_model;
    private Vehicle_brand vehicle_brand;

}
