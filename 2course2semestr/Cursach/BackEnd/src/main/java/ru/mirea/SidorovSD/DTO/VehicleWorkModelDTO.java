package ru.mirea.SidorovSD.DTO;

import lombok.Data;
import ru.mirea.SidorovSD.Models.Group;
import ru.mirea.SidorovSD.Models.Vehicle_name;

@Data
public class VehicleWorkModelDTO {

    private int idVehicleWorkModel;

    private int pricePerHour;

    private Vehicle_name vehicle_name;

    private Group group;

}
