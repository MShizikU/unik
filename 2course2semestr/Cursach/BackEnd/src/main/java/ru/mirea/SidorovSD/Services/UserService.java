package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.User;
import ru.mirea.SidorovSD.Repos.UserRepo;

@Service
@Slf4j
public class UserService {

    @Autowired
    private final UserRepo userRepo;


    public UserService(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    public void saveUser(User user){

        if (isUserExist(user.getSnpassport()))
            throw new RuntimeException("This user already exist");

        String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
        user.setPassword(encodedPassword);
        user.setRole("USER");
        user.setIdLevel(1);

        userRepo.save(user);
    }

    public User changeUserLevel(String snpassport, int idLevelNew){
        User user = userRepo.findBySnpassport(snpassport);
        user.setIdLevel(idLevelNew);
        userRepo.save(user);
        return user;
    }


    public Boolean isUserExist(String snpassport) {
        return userRepo.findBySnpassport(snpassport) != null;
    }
    public User findBySnpassport(String snpassport) { return userRepo.findBySnpassport(snpassport);}


}
