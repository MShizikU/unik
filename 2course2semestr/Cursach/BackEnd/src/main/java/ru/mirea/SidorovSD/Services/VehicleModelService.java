package ru.mirea.SidorovSD.Services;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Repos.VehicleBrandRepo;

@Service
@Slf4j
public class VehicleModelService {

    private final VehicleBrandRepo vehicleBrandRepo;


    public VehicleModelService(VehicleBrandRepo vehicleBrandRepo) {
        this.vehicleBrandRepo = vehicleBrandRepo;
    }
}
