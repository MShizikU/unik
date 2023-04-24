package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mirea.SidorovSD.Services.VehicleService;

@RestController
@RequestMapping("/vehicle_model")
public class VehicleModelController {
    private final ModelMapper modelMapper;
    private final VehicleService vehicleService;

    public VehicleModelController(ModelMapper modelMapper, VehicleService vehicleService) {
        this.modelMapper = modelMapper;
        this.vehicleService = vehicleService;
    }
}
