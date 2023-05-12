package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.springframework.http.ResponseEntity;
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
    private final Responser responser = new Responser();
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
    public ResponseEntity<String> addNewRent(@RequestBody RentDTO rent){
        return responser.createResponse(rentService.addNewRent(convertToRent(rent)));
    }

    @PostMapping("/start")
    public ResponseEntity<String> startRent(@RequestParam String snpassport, @RequestParam String VIN, @RequestParam String startingPoint){
        return responser.createResponse(rentService.startNewRent(snpassport, VIN, startingPoint));
    }

    @PostMapping("/end")
    public ResponseEntity<String> endRent(@RequestParam String snpassport, @RequestParam String endPoint){
        return responser.createResponse(rentService.endRent(snpassport, endPoint));
    }

    @PostMapping("/change")
    public ResponseEntity<String> changeRent(@RequestParam int iRentID, @RequestParam String snpassport, @RequestParam String vin, @RequestParam String startingPoint, @RequestParam String endPoint, @RequestParam String startTime, @RequestParam String endTime){
        return responser.createResponse(rentService.changeRent(iRentID, snpassport, vin, startingPoint, endPoint, startTime, endTime));
    }

    @DeleteMapping()
    public ResponseEntity<String> deleteRent(@RequestParam int iRentID){
        return responser.createResponse(rentService.deleteRent(iRentID));
    }

    public RentDTO convertToRentDTO(Rent rent){
        return modelMapper.map(rent, RentDTO.class);
    }

    public Rent convertToRent(RentDTO rentDTO){
        return modelMapper.map(rentDTO, Rent.class);
    }

}
