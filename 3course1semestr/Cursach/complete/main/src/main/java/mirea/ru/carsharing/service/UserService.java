package mirea.ru.carsharing.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import mirea.ru.carsharing.DTO.LoginDTO;
import mirea.ru.carsharing.DTO.LoginResultDTO;
import mirea.ru.carsharing.DTO.RegistrationDTO;
import mirea.ru.carsharing.DTO.RegistrationRedirectDTO;
import mirea.ru.carsharing.model.User;
import mirea.ru.carsharing.model.UserLevel;
import mirea.ru.carsharing.repos.UserLevelRepo;
import mirea.ru.carsharing.repos.UserRepo;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Value("${AUTH_SERVICE_PORT}")
    private String authServicePort;

    @Autowired
    private UserRepo userRepository;

    @Autowired
    private UserLevelRepo userLevelRepo;


    public ExecutionResult<LoginResultDTO> performLogin(LoginDTO loginDTO){

        String sourceUrl = "http://authservice:" + authServicePort + "/login";

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<?> requestEntity = new HttpEntity<>(loginDTO, headers);

        ResponseEntity<String> responseEntity = restTemplate.exchange(
                sourceUrl,
                HttpMethod.POST,
                requestEntity,
                String.class
        );

        String response = responseEntity.getBody();
        if (responseEntity.getStatusCode() != HttpStatus.OK)
            return ExecutionResult.error(response);


        ObjectMapper objectMapper = new ObjectMapper();
        try {
            LoginResultDTO result = objectMapper.readValue(response, LoginResultDTO.class);
            return ExecutionResult.success(result);
        } catch (JsonProcessingException e) {
            return ExecutionResult.error("Unable to read data from login: " + e.getMessage());
        }
    }

    public ExecutionResult<String> performRegistration(RegistrationDTO registrationDTO){
        Optional<User> existedUser = userRepository.findById(registrationDTO.getSnpassport());
        if (existedUser.isEmpty())
            existedUser = userRepository.findByUsername(registrationDTO.getUsername());

        if (existedUser.isPresent())
            return ExecutionResult.error("User already exist");

        User userForCreation = new User(
                registrationDTO.getSnpassport(),
                registrationDTO.getFullName(),
                registrationDTO.getUsername(),
                registrationDTO.getDateOfBirth(),
                1
        );

        /*
        Optional<UserLevel> userLevel = userLevelRepo.findById(userForCreation.getIdLevel());
        if (userLevel.isEmpty())
            return ExecutionResult.error("Unable to find user level");
        */
        try {
            userRepository.save(userForCreation);
        }
        catch (Exception ex){
            return ExecutionResult.error("Unable to create user: " + ex.getMessage());
        }

        RegistrationRedirectDTO redirectDTO = new RegistrationRedirectDTO(
                registrationDTO.getUsername(),
                registrationDTO.getPassword(),
                "USER"
        );

        String sourceUrl = "http://authservice:" + authServicePort + "/createuser";

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<?> requestEntity = new HttpEntity<>(redirectDTO, headers);

        ResponseEntity<String> responseEntity = restTemplate.exchange(
                sourceUrl,
                HttpMethod.POST,
                requestEntity,
                String.class
        );

        String response = responseEntity.getBody();
        if (responseEntity.getStatusCode() != HttpStatus.OK){
            userRepository.delete(userForCreation);
            return ExecutionResult.error(response);
        }

        return ExecutionResult.success(response);
    }

    public ExecutionResult<User> createUser(User user) {
        Optional<User> existedUser = userRepository.findById(user.getSnpassport());
        if (existedUser.isEmpty())
            existedUser = userRepository.findByUsername(user.getUsername());

        if (existedUser.isPresent())
            return ExecutionResult.error("User already exist");

        Optional<UserLevel> userLevel = userLevelRepo.findById(user.getIdLevel());
        if (userLevel.isEmpty())
            return ExecutionResult.error("Unable to find user level");

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
                if (updatedUser.getIdLevel() != null) {

                    Optional<UserLevel> userLevel = userLevelRepo.findById(updatedUser.getIdLevel());
                    if (userLevel.isEmpty())
                        return ExecutionResult.error("Unable to find user level");

                    existingUser.setIdLevel(updatedUser.getIdLevel());
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

    public ExecutionResult<List<User>> getUsersByUserLevel(Integer idLevel) {
        return ExecutionResult.success(userRepository.findByIdLevel(idLevel));
    }
    public ExecutionResult<List<User>> getAllUsers(){
        return ExecutionResult.success(userRepository.findAll());
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
