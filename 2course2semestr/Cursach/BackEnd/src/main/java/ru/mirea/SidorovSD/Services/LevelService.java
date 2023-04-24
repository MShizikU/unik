package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Repos.LevelRepo;

@Service
@Slf4j
public class LevelService {

    private final LevelRepo levelRepo;

    public LevelService(LevelRepo levelRepo) {
        this.levelRepo = levelRepo;
    }
}
