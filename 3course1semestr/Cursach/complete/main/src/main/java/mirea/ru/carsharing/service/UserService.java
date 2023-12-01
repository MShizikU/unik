package mirea.ru.carsharing.service;

import mirea.ru.carsharing.model.User;
import mirea.ru.carsharing.model.UserLevel;
import mirea.ru.carsharing.repos.UserRepo;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    private final UserRepo userRepository;

    @Autowired
    public UserService(UserRepo userRepository) {
        this.userRepository = userRepository;
    }

    public ExecutionResult<User> createUser(User user) {
        try{
            User createdUser = userRepository.save(user);
            return ExecutionResult.success(createdUser);
        }
        catch (Exception ex){
            return ExecutionResult.error("User not created: " + ex.getMessage());
        }
    }

    public ExecutionResult<User> updateUser(Long snpassport, User updatedUser) {
        User existingUser = userRepository.findById(snpassport).orElse(null);
        try{
            if (existingUser != null) {
                if (updatedUser.getFullName() != null) {
                    existingUser.setFullName(updatedUser.getFullName());
                }
                if (updatedUser.getUsername() != null) {
                    existingUser.setUsername(updatedUser.getUsername());
                }
                if (updatedUser.getDateOfBirth() != null) {
                    existingUser.setDateOfBirth(updatedUser.getDateOfBirth());
                }
                if (updatedUser.getUserLevel() != null) {
                    existingUser.setUserLevel(updatedUser.getUserLevel());
                }

                User updatedUserResult = userRepository.save(existingUser);
                return ExecutionResult.success(updatedUserResult);
            } else {
                return ExecutionResult.error("User not found.");
            }
        }
        catch(Exception exception){
            return ExecutionResult.error("Failed to update user");
        }
    }

    public void deleteUser(Long snpassport) {
        userRepository.deleteById(snpassport);
    }

    public ExecutionResult<User> getUserBySnpassport(Long snpassport) {
        User user = userRepository.findById(snpassport).orElse(null);
        if (user != null) {
            return ExecutionResult.success(user);
        } else {
            return ExecutionResult.error("User not found.");
        }
    }

    public List<User> getUsersByUserLevel(UserLevel userLevel) {
        return userRepository.findByUserLevel(userLevel);
    }

    public ExecutionResult<User> getUserByUsername(String username) {
        User user = userRepository.findByUsername(username).orElse(null);
        if (user != null) {
            return ExecutionResult.success(user);
        } else {
            return ExecutionResult.error("User not found.");
        }
    }
}
