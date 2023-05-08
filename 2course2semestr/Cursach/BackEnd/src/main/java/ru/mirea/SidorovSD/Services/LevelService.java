package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Level;
import ru.mirea.SidorovSD.Repos.LevelRepo;

import java.util.List;

@Service
@Slf4j
public class LevelService {

    @Autowired
    private final LevelRepo levelRepo;

    public LevelService(LevelRepo levelRepo) {
        this.levelRepo = levelRepo;
    }

    public List<Level> findAll() { return levelRepo.findAll(); }

    public Boolean updateLevel(int idLevel, String levelName){
        Level level = levelRepo.findByIdLevel(idLevel);
        if (level == null)
            return false;
        level.setLevelName(levelName);
        levelRepo.save(level);
        return true;
    }

    public Boolean deleteLevel(int idLevel){
        Level level = levelRepo.findByIdLevel(idLevel);
        if (level == null)
            return false;
        levelRepo.delete(level);
        return true;
    }

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
