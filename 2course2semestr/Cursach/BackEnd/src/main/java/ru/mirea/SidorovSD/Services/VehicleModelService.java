package ru.mirea.SidorovSD.Services;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Repos.VehicleBrandRepo;

@Service
@Slf4j
public class VehicleModelService {

    @Autowired
    private final VehicleBrandRepo vehicleBrandRepo;


    public VehicleModelService(VehicleBrandRepo vehicleBrandRepo) {
        this.vehicleBrandRepo = vehicleBrandRepo;
    }
}
