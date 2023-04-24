package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Repos.VehicleBrandRepo;

@Service
@Slf4j
public class VehicleNameService {

    private final VehicleBrandRepo vehicleBrandRepo;

    public VehicleNameService(VehicleBrandRepo vehicleBrandRepo) {
        this.vehicleBrandRepo = vehicleBrandRepo;
    }
}
