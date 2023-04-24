package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Repos.VehicleWorkModelRepo;

@Service
@Slf4j
public class VehicleWorkModelService {

    private final VehicleWorkModelRepo vehicleWorkModelRepo;

    public VehicleWorkModelService(VehicleWorkModelRepo vehicleWorkModelRepo) {
        this.vehicleWorkModelRepo = vehicleWorkModelRepo;
    }
}
