package ru.mirea.SidorovSD.DTO;

import lombok.Data;
import ru.mirea.SidorovSD.Models.Group;
import ru.mirea.SidorovSD.Models.Vehicle_work_model;

@Data
public class VehicleDTO {

    private String vin;

    private Vehicle_work_model workModel;

    private String color, state, place;



}

