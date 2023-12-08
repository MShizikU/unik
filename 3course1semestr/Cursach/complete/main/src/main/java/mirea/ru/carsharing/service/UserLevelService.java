package mirea.ru.carsharing.service;

import mirea.ru.carsharing.model.UserLevel;
import mirea.ru.carsharing.repos.UserLevelRepo;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserLevelService {
    private final UserLevelRepo userLevelRepository;

    public UserLevelService(UserLevelRepo userLevelRepository) {
        this.userLevelRepository = userLevelRepository;
    }

    public ExecutionResult<UserLevel> createUserLevel(UserLevel userLevel) {
        Optional<UserLevel> existingUserLevel = userLevelRepository.findByLevelName(userLevel.getLevelName());
        if (existingUserLevel.isPresent()) {
            return ExecutionResult.error("User level with the same name already exists");
        }
        try {
            UserLevel createdUserLevel = userLevelRepository.save(userLevel);
            return ExecutionResult.success(createdUserLevel);
        }
        catch (Exception ex){
            return  ExecutionResult.error("Unable to create user level: " + ex.getMessage());
        }
    }

    public ExecutionResult<UserLevel> updateUserLevel(Integer id, UserLevel userLevel) {
        Optional<UserLevel> existingUserLevel = userLevelRepository.findById(id);
        if (existingUserLevel.isEmpty()) {
            return ExecutionResult.error("User level not found");
        }
        try{
            UserLevel updatedUserLevel = existingUserLevel.get();
            if (userLevel.getLevelName() != null) {
                updatedUserLevel.setLevelName(userLevel.getLevelName());
            }
            if (userLevel.getLevelDescription() != null) {
                updatedUserLevel.setLevelDescription(userLevel.getLevelDescription());
            }
            UserLevel savedUserLevel = userLevelRepository.save(updatedUserLevel);
            return ExecutionResult.success(savedUserLevel);
        }catch (Exception ex){
            return ExecutionResult.error("Unable to update UserLevel: " + ex.getMessage());
        }
    }

    public ExecutionResult<UserLevel> deleteUserLevel(Integer id) {
        Optional<UserLevel> existingUserLevel = userLevelRepository.findById(id);
        if (existingUserLevel.isEmpty()) {
            return ExecutionResult.error("User level not found");
        }
        userLevelRepository.deleteById(id);
        return ExecutionResult.success(null);
    }

    public ExecutionResult<UserLevel> getUserLevelById(Integer id) {
        Optional<UserLevel> userLevel = userLevelRepository.findById(id);
        if (userLevel.isEmpty()) {
            return ExecutionResult.error("User level not found");
        }

        return ExecutionResult.success(userLevel.get());
    }

    public ExecutionResult<List<UserLevel>> getAllUserLevels() {
        List<UserLevel> userLevels = userLevelRepository.findAll();
        return ExecutionResult.success(userLevels);
    }
}
