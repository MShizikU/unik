package ru.mirea.SidorovSD.Services;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Vehicle;
import ru.mirea.SidorovSD.Repos.*;

import java.util.List;

@Service
@Slf4j
public class VehicleService {
    @Autowired
    private final VehicleRepo vehicleRepo;
    @Autowired
    private final VehicleWorkModelRepo vehicleWorkModelRepo;
    @Autowired
    private final RentRepo rentRepo;
    public VehicleService(VehicleRepo vehicleRepo, VehicleNameRepo vehicleNameRepo, VehicleBrandRepo vehicleBrandRepo, VehicleModelRepo vehicleModelRepo, VehicleWorkModelRepo vehicleWorkModelRepo, GroupRepo groupRepo, RentRepo rentRepo) {
        this.vehicleRepo = vehicleRepo;
        this.vehicleWorkModelRepo = vehicleWorkModelRepo;
        this.rentRepo = rentRepo;
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

    public String addVehicle(Vehicle vehicle){
        if (vehicleRepo.findByVin(vehicle.getVin()) != null)
            return "Vehicle already exist";
        if (vehicleWorkModelRepo.findByIdVehicleWorkModel(vehicle.getIdVehicleWorkModel()) == null)
            return "WorkModel doesn't exist";
        vehicleRepo.save(vehicle);
        return "OK";
    }

    public String changeVehicleInfo(String vin, int idVehicleWorkModel, String color, String state, String place){
        Vehicle vehicle = getVehicle(vin);
        if (vehicle == null)
            return "Vehicle doesn't exist";

        if (idVehicleWorkModel != -1) {
            if (vehicleWorkModelRepo.existsById(idVehicleWorkModel))
                vehicle.setIdVehicleWorkModel(idVehicleWorkModel);
            else
                return "WorkModel doesn't exist";
        }
        if (!color.equals("-"))
            vehicle.setColor(color);
        if (!state.equals("-"))
            vehicle.setState(state);
        if (!place.equals("-"))
            vehicle.setPlace(place);
        vehicleRepo.save(vehicle);
        return "OK";
    }

    public String deleteVehicle(String vin){
        Vehicle vehicle = getVehicle(vin);
        if (vehicle == null)
            return "Vehicle doesn't exist";
        if (!rentRepo.findByVin(vin).isEmpty())
            return "Vehicle in use";
        vehicleRepo.delete(vehicle);
        return "OK";
    }
}
