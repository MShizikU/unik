package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.*;
import ru.mirea.SidorovSD.DTO.RentDTO;
import ru.mirea.SidorovSD.Models.Rent;
import ru.mirea.SidorovSD.Services.RentService;

import java.util.List;

@RestController
@RequestMapping("/api/rent")
public class RentController {

    private final ModelMapper modelMapper;
    private final RentService rentService;

    public RentController(ModelMapper modelMapper, RentService rentService) {
        this.modelMapper = modelMapper;
        this.rentService = rentService;
    }

    @GetMapping()
    public List<RentDTO> getAll(){
        return rentService.getAll().stream().map(this::convertToRentDTO).toList();
    }

    @GetMapping("/user")
    public List<RentDTO> getAllForUser(@RequestParam String snpassport){
        return rentService.getAllByPass(snpassport).stream().map(this::convertToRentDTO).toList();
    }

    @GetMapping("/vehicle")
    public List<RentDTO> getAllForVehicle(@RequestParam String vin){
        return rentService.getAllByVIN(vin).stream().map(this::convertToRentDTO).toList();
    }

    @PostMapping("/add")
    public Boolean addNewRent(@RequestBody RentDTO rent){
        return rentService.addNewRent(convertToRent(rent));
    }

    @PostMapping("/start")
    public Boolean startRent(@RequestParam String snpassport, @RequestParam String VIN, @RequestParam String startingPoint){
        return rentService.startNewRent(snpassport, VIN, startingPoint);
    }

    @PostMapping("/end")
    public Boolean endRent(@RequestParam String snpassport, @RequestParam String endPoint){
        return rentService.endRent(snpassport, endPoint);
    }

    @PostMapping("/change")
    public Boolean changeRent(@RequestParam int iRentID, @RequestParam String snpassport, @RequestParam String vin, @RequestParam String startingPoint, @RequestParam String endPoint, @RequestParam String startTime, @RequestParam String endTime){
        return rentService.changeRent(iRentID, snpassport, vin, startingPoint, endPoint, startTime, endTime);
    }

    @DeleteMapping()
    public Boolean deleteRent(@RequestParam int iRentID){
        return rentService.deleteRent(iRentID);
    }

    public RentDTO convertToRentDTO(Rent rent){
        return modelMapper.map(rent, RentDTO.class);
    }

    public Rent convertToRent(RentDTO rentDTO){
        return modelMapper.map(rentDTO, Rent.class);
    }

}
