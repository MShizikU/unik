package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mirea.SidorovSD.Services.VehicleWorkModelService;

@RestController
@RequestMapping("/vehicle_work_model")
public class VehicleWorkModelController {
    private final ModelMapper modelMapper;
    private final VehicleWorkModelService vehicleWorkModelService;

    public VehicleWorkModelController(ModelMapper modelMapper, VehicleWorkModelService vehicleWorkModelService) {
        this.modelMapper = modelMapper;
        this.vehicleWorkModelService = vehicleWorkModelService;
    }
}
