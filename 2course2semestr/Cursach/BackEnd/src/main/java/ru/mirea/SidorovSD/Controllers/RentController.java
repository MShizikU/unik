package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mirea.SidorovSD.Services.RentService;

@RestController
@RequestMapping("/rent")
public class RentController {

    private final ModelMapper modelMapper;
    private final RentService rentService;

    public RentController(ModelMapper modelMapper, RentService rentService) {
        this.modelMapper = modelMapper;
        this.rentService = rentService;
    }
}
