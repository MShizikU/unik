package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mirea.SidorovSD.Services.VehicleNameService;

@RestController
@RequestMapping("/vehicle_name")
public class VehicleNameController {
    private final ModelMapper modelMapper;
    private final VehicleNameService vehicleNameService;

    public VehicleNameController(ModelMapper modelMapper, VehicleNameService vehicleNameService) {
        this.modelMapper = modelMapper;
        this.vehicleNameService = vehicleNameService;
    }
}
