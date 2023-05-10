package ru.mirea.SidorovSD.Services;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Vehicle;
import ru.mirea.SidorovSD.Models.Vehicle_name;
import ru.mirea.SidorovSD.Models.Vehicle_work_model;
import ru.mirea.SidorovSD.Repos.*;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class VehicleService {
    @Autowired
    private final VehicleRepo vehicleRepo;

    @Autowired
    private final VehicleNameRepo vehicleNameRepo;

    @Autowired
    private final VehicleBrandRepo vehicleBrandRepo;

    @Autowired
    private final VehicleModelRepo vehicleModelRepo;

    @Autowired
    private final VehicleWorkModelRepo vehicleWorkModelRepo;

    @Autowired
    private final GroupRepo groupRepo;

    public VehicleService(VehicleRepo vehicleRepo, VehicleNameRepo vehicleNameRepo, VehicleBrandRepo vehicleBrandRepo, VehicleModelRepo vehicleModelRepo, VehicleWorkModelRepo vehicleWorkModelRepo, GroupRepo groupRepo) {
        this.vehicleRepo = vehicleRepo;
        this.vehicleNameRepo = vehicleNameRepo;
        this.vehicleBrandRepo = vehicleBrandRepo;
        this.vehicleModelRepo = vehicleModelRepo;
        this.vehicleWorkModelRepo = vehicleWorkModelRepo;
        this.groupRepo = groupRepo;
    }

    public List<Vehicle> getAll(){
        return vehicleRepo.findAll();
    }

    public Vehicle getVehicle(String vin){
        return vehicleRepo.findByVin(vin);
    }

    public List<Vehicle> getVehicleByWorkModel(int idWorkModel){
        return vehicleRepo.findByIdVehicleWorkModel(idWorkModel);
    }

    public Boolean addVehicle(Vehicle vehicle){
        if (vehicleRepo.findByVin(vehicle.getVin()) != null)
            return false;
        if (vehicleWorkModelRepo.findByIdVehicleWorkModel(vehicle.getIdVehicleWorkModel()) == null)
            return false;
        vehicleRepo.save(vehicle);
        return Boolean.TRUE;
    }

    public Boolean changeVehicleInfo(String vin, int idVehicleWorkModel, String color, String state, String place){
        Vehicle vehicle = getVehicle(vin);
        if (vehicle == null)
            return false;

        if (idVehicleWorkModel != -1) {
            if (vehicleWorkModelRepo.existsById(idVehicleWorkModel))
                vehicle.setIdVehicleWorkModel(idVehicleWorkModel);
            else
                return false;
        }
        if (!color.equals("-"))
            vehicle.setColor(color);
        if (!state.equals("-"))
            vehicle.setState(state);
        if (!place.equals("-"))
            vehicle.setPlace(place);

        return Boolean.TRUE;
    }

    public Boolean deleteVehicle(String vin){
        Vehicle vehicle = getVehicle(vin);
        if (vehicle == null)
            return false;
        vehicleRepo.delete(vehicle);
        return true;
    }
}
