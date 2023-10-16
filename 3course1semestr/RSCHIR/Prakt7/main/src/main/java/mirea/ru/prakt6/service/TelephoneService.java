package mirea.ru.prakt6.service;

import mirea.ru.prakt6.model.Telephone;
import mirea.ru.prakt6.repos.TelephonesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TelephoneService {

    @Autowired
    private TelephonesRepository telephoneRepository;

    public List<Telephone> getTelephoneAll(){
        return telephoneRepository.findAll();
    }

    public Telephone getTelephoneById(Long id) {
        return telephoneRepository.findById(id).orElse(null);
    }

    public Telephone createTelephone(Telephone telephone) {
        return telephoneRepository.save(telephone);
    }

    public Telephone updateTelephone(Long id, Telephone telephone) {
        Telephone existingTelephone = getTelephoneById(id);
        existingTelephone.setManufacturer(telephone.getManufacturer());
        existingTelephone.setBatteryCapacity(telephone.getBatteryCapacity());
        existingTelephone.setSellerId(telephone.getSellerId());
        existingTelephone.setProductId(telephone.getProductId());
        return (Telephone) telephoneRepository.save(existingTelephone);
    }

    public void deleteTelephone(Long id) {
        Telephone existingTelephone = getTelephoneById(id);
        telephoneRepository.delete(existingTelephone);
    }
}
