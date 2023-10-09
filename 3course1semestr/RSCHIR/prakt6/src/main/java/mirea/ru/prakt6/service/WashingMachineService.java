package mirea.ru.prakt6.service;

import mirea.ru.prakt6.model.WashingMachine;
import mirea.ru.prakt6.repos.WashingMachinesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WashingMachineService {

    @Autowired
    private WashingMachinesRepository washingMachineRepository;

    public List<WashingMachine> getWashingMachineAll(){
        return washingMachineRepository.findAll();
    }

    public WashingMachine getWashingMachineById(Long id) {
        return (WashingMachine) washingMachineRepository.findById(id).get();
    }

    public WashingMachine createWashingMachine(WashingMachine washingMachine) {
        return (WashingMachine) washingMachineRepository.save(washingMachine);
    }

    public WashingMachine updateWashingMachine(Long id, WashingMachine washingMachine) {
        WashingMachine existingWashingMachine = getWashingMachineById(id);
        existingWashingMachine.setManufacturer(washingMachine.getManufacturer());
        existingWashingMachine.setTankerCapacity(washingMachine.getTankerCapacity());
        existingWashingMachine.setSellerId(washingMachine.getSellerId());
        existingWashingMachine.setProductId(washingMachine.getProductId());
        return (WashingMachine) washingMachineRepository.save(existingWashingMachine);
    }

    public void deleteWashingMachine(Long id) {
        WashingMachine existingWashingMachine = getWashingMachineById(id);
        washingMachineRepository.delete(existingWashingMachine);
    }
}
