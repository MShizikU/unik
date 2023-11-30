package mirea.ru.carsharing.service;

import mirea.ru.carsharing.model.Rent;
import mirea.ru.carsharing.repos.RentRepo;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RentService {

    @Autowired
    private RentRepo rentRepository;

    public ExecutionResult<Rent> createRent(Rent rent) {
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

    public ExecutionResult<Rent> getRentBySnpassport(String snpassport) {
        Rent rent = rentRepository.findByUserSnpassport(snpassport);
        if (rent == null) {
            return ExecutionResult.error("Rent not found");
        }

        return ExecutionResult.success(rent);
    }

    public ExecutionResult<Rent> getRentByVin(String vin) {
        Rent rent = rentRepository.findByVehicleVin(vin);
        if (rent == null) {
            return ExecutionResult.error("Rent not found");
        }

        return ExecutionResult.success(rent);
    }

    public ExecutionResult<List<Rent>> getAllRents(){
        return ExecutionResult.success(rentRepository.findAll());
    }
}
