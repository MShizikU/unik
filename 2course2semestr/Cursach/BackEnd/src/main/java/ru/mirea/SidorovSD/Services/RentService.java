package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Repos.RentRepo;

@Service
@Slf4j
public class RentService {

    private final RentRepo rentRepo;

    public RentService(RentRepo rentRepo) {
        this.rentRepo = rentRepo;
    }
}
