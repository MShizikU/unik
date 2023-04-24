package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mirea.SidorovSD.Services.VehicleBrandService;

@RestController
@RequestMapping("/vehicle_brand")
public class VehicleBrandController {

    private final ModelMapper modelMapper;
    private final VehicleBrandService vehicleBrandService;

    public VehicleBrandController(ModelMapper modelMapper, VehicleBrandService vehicleBrandService) {
        this.modelMapper = modelMapper;
        this.vehicleBrandService = vehicleBrandService;
    }
}
