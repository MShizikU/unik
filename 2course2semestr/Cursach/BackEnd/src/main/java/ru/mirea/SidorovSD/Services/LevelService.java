package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Level;
import ru.mirea.SidorovSD.Repos.LevelRepo;
import ru.mirea.SidorovSD.Repos.PermissionRepo;
import ru.mirea.SidorovSD.Repos.UserRepo;

import java.util.List;

@Service
@Slf4j
public class LevelService {

    @Autowired
    private final LevelRepo levelRepo;

    @Autowired
    private final UserRepo userRepo;

    @Autowired
    private final PermissionRepo permissionRepo;

    public LevelService(LevelRepo levelRepo, UserRepo userRepo, PermissionRepo permissionRepo) {
        this.levelRepo = levelRepo;
        this.userRepo = userRepo;
        this.permissionRepo = permissionRepo;
    }

    public List<Level> findAll() { return levelRepo.findAll(); }

    public Level findById(int idLevel){
        return levelRepo.findByIdLevel(idLevel);
    }

    public String updateLevel(int idLevel, String levelName){
        Level level = levelRepo.findByIdLevel(idLevel);
        if (level == null)
            return "Level doesn't exist";
        level.setLevelName(levelName);
        levelRepo.save(level);
        return "OK";
    }

    public String deleteLevel(String levelName){
        Level level = levelRepo.findByLevelName(levelName);
        if (level == null)
            return "Level doesn't exist";
        if (!userRepo.findByIdLevel(level.getIdLevel()).isEmpty() || !permissionRepo.findByIdLevel(level.getIdLevel()).isEmpty())
            return "Level in use";
        levelRepo.delete(level);
        return "OK";
    }

    public String saveLevel(String levelName){
        if (isLevelExist(levelName)){
            return "Level already exist";
        }
        Level level = new Level();
        level.setLevelName(levelName);
        levelRepo.save(level);
        return "OK";
    }

    public Boolean isLevelExist(String levelName){
        return levelRepo.findByLevelName(levelName) != null;
    }


}
