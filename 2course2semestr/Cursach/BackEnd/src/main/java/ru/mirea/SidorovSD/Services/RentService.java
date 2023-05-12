package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Rent;
import ru.mirea.SidorovSD.Models.Vehicle;
import ru.mirea.SidorovSD.Repos.RentRepo;
import ru.mirea.SidorovSD.Repos.UserRepo;
import ru.mirea.SidorovSD.Repos.VehicleRepo;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
@Slf4j
public class RentService {

    @Autowired
    private final RentRepo rentRepo;

    @Autowired
    private final UserRepo userRepo;

    @Autowired
    private final VehicleRepo vehicleRepo;

    public RentService(RentRepo rentRepo , UserRepo userRepo, VehicleRepo vehicleRepo) {
        this.rentRepo = rentRepo;
        this.userRepo = userRepo;
        this.vehicleRepo = vehicleRepo;
    }

    public List<Rent> getAll() {
        return rentRepo.findAll();
    }

    public List<Rent> getAllByPass(String snpasspot){
        return rentRepo.findBySnpassport(snpasspot);
    }

    public List<Rent> getAllByVIN(String vin){
        return rentRepo.findByVin(vin);
    }

    public String addNewRent(Rent rent){
        if(vehicleRepo.findByVin(rent.getVin()) == null){
            return "VIN doesn't exist";
        }
        if(userRepo.findBySnpassport((rent.getSnpassport())) == null)
            return "User doesn't exist";
        if (checkDates(rent.getStartTime(), rent.getEndTime()) ){
            rent.setDuration(calculateDuration(rent.getStartTime(), rent.getEndTime()));
            log.info(rent.toString());
            rentRepo.save(rent);
            return "OK";
        }
        else
            return "Something wrong with dates";
    }

    public String startNewRent(String snpassport, String vin, String startingPoint){
        if (!isUserExist(snpassport) && checkUserInRentAlready(snpassport) && !isVehicleExist(snpassport)){
            return "Something went wrong";
        }
        Vehicle vehicle = vehicleRepo.findByVin(vin);
        vehicle.setState("In use");
        vehicleRepo.save(vehicle);
        Rent startedRent = new Rent();
        startedRent.setSnpassport(snpassport);
        startedRent.setVin(vin);
        startedRent.setDuration(0);
        startedRent.setStartingPoint(startingPoint);
        startedRent.setEndPoint("none");
        startedRent.setStartTime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm:ss")).toString());
        startedRent.setEndTime("none");
        rentRepo.save(startedRent);
        return "OK";
    }

    public String endRent(String snpassport,  String endPoint){
        Rent rent = getCurrentRent(snpassport);
        if (rent == null){
            return "Rent doesn't exist";
        }

        Vehicle vehicle = vehicleRepo.findByVin(rent.getVin());
        vehicle.setState("Free");
        vehicle.setPlace(endPoint);
        vehicleRepo.save(vehicle);


        rent.setEndPoint(endPoint);
        String endTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm:ss")).toString();
        String startTime = rent.getStartTime();
        rent.setEndTime(endTime);
        rent.setDuration(calculateDuration(startTime, endTime));
        rentRepo.save(rent);
        return "OK";
    }

    public String changeRent(int iRentID, String snpassport, String vin, String startingPoint, String endPoint, String startTime, String endTime){
        Rent rent = rentRepo.findById_rent(iRentID);
        if (rent == null){
            return "Rent doesn't exist";
        }

        if (!snpassport.equals("-")){
            if (!isUserExist(snpassport)) return "User doesn't exist";
            rent.setSnpassport(snpassport);
        }

        if (!vin.equals("-")){
            if (!isVehicleExist(vin)) return "Vehicle doesn't exist";
            rent.setVin(vin);
        }

        if (!startingPoint.equals("-"))
            rent.setStartingPoint(startingPoint);

        if (!endPoint.equals("-"))
            rent.setEndPoint(endPoint);

        if (!startTime.equals("-") || !endTime.equals("-")){
            String startTimePosition = (!startTime.equals("-")) ? startTime : rent.getStartTime() ;
            String endTimePosition = (!endTime.equals("-")) ? endTime : rent.getEndTime();

            if (checkDates(startTimePosition, endTimePosition)){
                rent.setStartTime(startTimePosition);
                rent.setEndTime(endTimePosition);
                rent.setDuration(calculateDuration(startTimePosition, endTimePosition));
            }
            else return "Wrong dates";
        }

        rentRepo.save(rent);
        return "OK";

    }

    public String deleteRent(int iRentID){
        Rent rent = rentRepo.findById_rent(iRentID);
        if (rent == null) return "Rent doesn't exist";
        rentRepo.delete(rent);
        return "OK";
    }

    public Rent getCurrentRent(String snpassport){
        return rentRepo.findActiveRent(snpassport);
    }

    public Boolean checkUserInRentAlready(String snpassport){
        return rentRepo.findActiveRent(snpassport) != null;
    }

    public Boolean isUserExist(String snpassport){
        return userRepo.findBySnpassport(snpassport) != null;
    }

    public Boolean isVehicleExist(String vin){
        return vehicleRepo.findByVin(vin) != null;
    }

    public int calculateDuration(String startTime, String endTime){
        return (int) Duration
                        .between(
                                LocalDateTime
                                        .parse(
                                                startTime,
                                                DateTimeFormatter
                                                        .ofPattern("dd.MM.yyyy HH:mm:ss")
                                        ),
                                LocalDateTime
                                        .parse(
                                                endTime,
                                                DateTimeFormatter
                                                        .ofPattern("dd.MM.yyyy HH:mm:ss")
                                        )
                        )
                        .getSeconds();
    }

    public Boolean checkDates(String startTime , String endTime){
        return LocalDateTime
                .parse(
                        startTime,
                        DateTimeFormatter
                                .ofPattern("dd.MM.yyyy HH:mm:ss")
                )
                .isBefore(
                        LocalDateTime
                                .parse(
                                        endTime,
                                        DateTimeFormatter
                                                .ofPattern("dd.MM.yyyy HH:mm:ss")
                        )
                );
    }
}
