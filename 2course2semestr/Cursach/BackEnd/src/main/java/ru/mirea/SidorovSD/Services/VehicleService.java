package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Repos.VehicleRepo;

@Service
@Slf4j
public class VehicleService {
    @Autowired
    private final VehicleRepo vehicleRepo;

    public VehicleService(VehicleRepo vehicleRepo) {
        this.vehicleRepo = vehicleRepo;
    }
}
