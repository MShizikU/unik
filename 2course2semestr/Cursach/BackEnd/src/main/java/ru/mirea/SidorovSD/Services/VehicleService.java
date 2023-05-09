package ru.mirea.SidorovSD.Services;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.util.Pair;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Vehicle;
import ru.mirea.SidorovSD.Models.Vehicle_name;
import ru.mirea.SidorovSD.Repos.*;

import java.util.LinkedList;
import java.util.List;

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

    public List<Vehicle> getAllByGroup(int idGroup){
        return vehicleRepo.findByIdGroup(idGroup);
    }

    public List<Pair<Vehicle, String>> getAllAllowedPreparedForShow(int idGroup){
        List<Pair<Vehicle,String>> resultedList = new LinkedList<>();
        List<Vehicle> vehicleList  = vehicleRepo.findByIdGroup(idGroup);
        List<String> vehicleNames = new LinkedList<>();
        vehicleList.forEach(
                vehicle -> {
                    Vehicle_name name = vehicleNameRepo
                                    .findByIdVehicleName(
                                        vehicleWorkModelRepo
                                                .findByIdVehicleWorkModel(
                                                        vehicle
                                                                .getIdVehicleWorkModel()
                                                ).getIdVehicleName()
                                    );
                    vehicleNames.add(
                            vehicleBrandRepo
                                    .findByIdBrand(
                                            name.getIdBrand()
                                    )
                                    .getBrandName()
                            +
                            " "
                            +
                            vehicleModelRepo
                                    .findByIdModel(
                                            name.getIdModel()
                                    )
                                    .getModelName()
                    );

                }
        );
        for(int i = 0; i < vehicleList.size(); i++){
            resultedList.add(new Pair<Vehicle, String>(vehicleList.get(i), vehicleNames.get(i)));
        }
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

    public Boolean changeVehicleInfo(String vin, int idVehicleWorkModel, String color, String state, String place, int idGroup){
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

        if (idGroup != -1) {
            if (groupRepo.existsById(idGroup))
                vehicle.setIdGroup(idGroup);
            else
                return false;
        }

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
