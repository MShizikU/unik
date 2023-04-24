package ru.mirea.SidorovSD.DTO;

import lombok.Data;
import ru.mirea.SidorovSD.Models.Group;
import ru.mirea.SidorovSD.Models.Vehicle_work_model;

@Data
public class VehicleDTO {

    private String stVIN;

    private Vehicle_work_model vwmWorkModel;

    private String stColor, stState, stPlace;

    private Group group;

}

