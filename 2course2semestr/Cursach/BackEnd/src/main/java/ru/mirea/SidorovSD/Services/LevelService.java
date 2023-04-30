package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Level;
import ru.mirea.SidorovSD.Repos.LevelRepo;

import java.util.List;

@Service
@Slf4j
public class LevelService {

    private final LevelRepo levelRepo;

    public LevelService(LevelRepo levelRepo) {
        this.levelRepo = levelRepo;
    }

    public List<Level> findAll() { return levelRepo.findAll(); }

    public Boolean isLevelExist(String levelName){
        return levelRepo.findByLevelName(levelName) != null;
    }

    public Boolean saveLevel(String levelName){
        if (isLevelExist(levelName)){
            return Boolean.FALSE;
        }
        Level level = new Level();
        level.setLevelName(levelName);
        levelRepo.save(level);
        return Boolean.TRUE;
    }
}
