package mirea.ru.carsharing.service;

import mirea.ru.carsharing.model.Rent;
import mirea.ru.carsharing.model.User;
import mirea.ru.carsharing.model.Vehicle;
import mirea.ru.carsharing.repos.RentRepo;
import mirea.ru.carsharing.repos.UserRepo;
import mirea.ru.carsharing.repos.VehicleRepo;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.List;
import java.util.Optional;

@Service
public class RentService {

    @Autowired
    private RentRepo rentRepository;

    @Autowired
    private VehicleRepo vehicleRepo;

    @Autowired
    private UserRepo userRepo;

    public ExecutionResult<Rent> closeRent(Integer id, Rent rent){
        Optional<Rent> closedRent = rentRepository.findById(id);
        if (closedRent.isEmpty())
            return ExecutionResult.error("Rent wasn't found");

        Rent resRent = closedRent.get();

        Optional<Vehicle> relatedVehicleReq = vehicleRepo.findByVin(closedRent.get().getVin());
        if (relatedVehicleReq.isEmpty())
            return ExecutionResult.error("Vehicle wasn't found");

        Vehicle relatedVehicle = relatedVehicleReq.get();

        if (rent.getEndingPoint().equals(resRent.getStartingPoint()))
            return ExecutionResult.error("Rent can't be stopped in the same place");

        if (resRent.getStartTime().equals(rent.getEndTime()))
            return ExecutionResult.error("Rent can't be last less then a second");

        resRent.setEndTime(rent.getEndTime());
        resRent.setEndingPoint(rent.getEndingPoint());
        resRent.setDuration((int)Duration.between(resRent.getStartTime(), rent.getEndTime()).getSeconds());

        relatedVehicle.setPlace(rent.getEndingPoint());
        relatedVehicle.setState("available");

        try{
            rentRepository.save(resRent);
            vehicleRepo.save(relatedVehicle);
            return ExecutionResult.success(resRent);
        }
        catch (Exception ex){
            return ExecutionResult.error("Unable to close rent: " + ex.getMessage());
        }
    }

    public ExecutionResult<Rent> startRent(Rent rent){
        Rent startedRent = new Rent();

        Optional<Vehicle> relatedVehicle = vehicleRepo.findByVin(rent.getVin());
        if (relatedVehicle.isEmpty())
            return ExecutionResult.error("Vehicle not found");

        Optional<User> relatedUser = userRepo.findBySnpassport(rent.getSnpassport());
        if (relatedUser.isEmpty())
            return ExecutionResult.error("User not found");

        Optional<Rent> activeRent = rentRepository.findActiveRent(rent.getSnpassport());
        if (activeRent.isPresent())
            return ExecutionResult.error("One rent is already active");

        User user = relatedUser.get();
        Vehicle vehicle = relatedVehicle.get();

        if (vehicle.getState().equals("unavailable"))
            return ExecutionResult.error("Vehicle unavaileable");

        if (!vehicle.getPlace().equals(rent.getStartingPoint()))
            return ExecutionResult.error("Vehicle place and requested started point differ");

        startedRent.setStartTime(rent.getStartTime());
        startedRent.setStartingPoint(rent.getStartingPoint());
        startedRent.setVin(vehicle.getVin());
        startedRent.setSnpassport(user.getSnpassport());

        vehicle.setState("available");


        try{
            rentRepository.save(startedRent);
            vehicleRepo.save(vehicle);
            return ExecutionResult.success(startedRent);
        }
        catch (Exception ex){
            return ExecutionResult.error("Unable to start rent: " + ex.getMessage());
        }
    }

    public ExecutionResult<Rent> createRent(Rent rent) {

        Optional<Vehicle> relatedVehicle = vehicleRepo.findByVin(rent.getVin());
        if (relatedVehicle.isEmpty())
            return ExecutionResult.error("Vehicle not found");

        Optional<User> relatedUser = userRepo.findBySnpassport(rent.getSnpassport());
        if (relatedUser.isEmpty())
            return ExecutionResult.error("User not found");

        rent.setDuration((int)Duration.between(rent.getStartTime(), rent.getEndTime()).getSeconds());

        try {
            Rent createdRent = rentRepository.save(rent);
            return ExecutionResult.success(createdRent);
        } catch (Exception e) {
            return ExecutionResult.error("Failed to create rent: " + e.getMessage());
        }
    }

    public ExecutionResult<Rent> updateRent(Integer rentId, Rent rent) {
        try {
            Optional<Rent> optionalRent = rentRepository.findById(rentId);
            if (optionalRent.isPresent()) {
                Rent existingRent = optionalRent.get();
                if (rent.getDuration() != null) {
                    existingRent.setDuration(rent.getDuration());
                }
                if (rent.getStartingPoint() != null) {
                    existingRent.setStartingPoint(rent.getStartingPoint());
                }
                if (rent.getStartTime() != null) {
                    existingRent.setStartTime(rent.getStartTime());
                }
                if (rent.getEndTime() != null) {
                    existingRent.setEndTime(rent.getEndTime());
                }
                if (rent.getEndingPoint() != null) {
                    existingRent.setEndingPoint(rent.getEndingPoint());
                }
                if (rent.getSnpassport() != null){
                    Optional<User> relatedUser = userRepo.findBySnpassport(rent.getSnpassport());
                    if (relatedUser.isEmpty())
                        return ExecutionResult.error("User not found");
                    existingRent.setSnpassport(rent.getSnpassport());
                }

                existingRent.setDuration((int)Duration.between(existingRent.getStartTime(), existingRent.getEndTime()).getSeconds());

                if (rent.getVin() != null){
                    Optional<Vehicle> relatedVehicle = vehicleRepo.findByVin(rent.getVin());
                    if (relatedVehicle.isEmpty())
                        return ExecutionResult.error("Vehicle not found");
                    existingRent.setVin(rent.getVin());
                }

                Rent updatedRent = rentRepository.save(existingRent);
                return ExecutionResult.success(updatedRent);
            } else {
                return ExecutionResult.error("Rent not found with ID: " + rentId);
            }
        } catch (Exception e) {
            return ExecutionResult.error("Failed to update rent: " + e.getMessage());
        }
    }

    public ExecutionResult<Rent> deleteRent(Integer rentId) {
        Optional<Rent> optionalRent = rentRepository.findById(rentId);
        if (optionalRent.isEmpty()) {
            return ExecutionResult.error("Rent not found");
        }

        Rent rent = optionalRent.get();
        rentRepository.delete(rent);
        return ExecutionResult.success(null);
    }

    public ExecutionResult<Rent> getRentById(Integer rentId) {
        Optional<Rent> optionalRent = rentRepository.findById(rentId);
        if (optionalRent.isEmpty()) {
            return ExecutionResult.error("Rent not found");
        }

        Rent rent = optionalRent.get();
        return ExecutionResult.success(rent);
    }

    public ExecutionResult<List<Rent>> getRentBySnpassport(Long snpassport) {
        Optional<List<Rent>> rent = rentRepository.findBySnpassport(snpassport);
        return rent.map(ExecutionResult::success).orElseGet(() -> ExecutionResult.error("Rent not found"));

    }

    public ExecutionResult<List<Rent>> getRentByVin(String vin) {
        Optional<List<Rent>> rent = rentRepository.findByVin(vin);
        if (rent.isEmpty()) {
            return ExecutionResult.error("Rent not found");
        }

        return rent.map(ExecutionResult::success).orElseGet(() -> ExecutionResult.error("Rent not found"));
    }

    public ExecutionResult<List<Rent>> getAllRents(){
        return ExecutionResult.success(rentRepository.findAll());
    }

    public ExecutionResult<Rent> getActiveRent(Long snpassport){
        Optional<Rent> activeRent = rentRepository.findActiveRent(snpassport);
        if (activeRent.isEmpty())
            return ExecutionResult.error("Rent not found");
        return ExecutionResult.success(rentRepository.findActiveRent(snpassport).get());}
}
