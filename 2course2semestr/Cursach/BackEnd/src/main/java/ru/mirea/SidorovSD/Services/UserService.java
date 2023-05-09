package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.User;
import ru.mirea.SidorovSD.Repos.LevelRepo;
import ru.mirea.SidorovSD.Repos.UserRepo;

import java.util.List;

@Service
@Slf4j
public class UserService {

    @Autowired
    private final UserRepo userRepo;

    @Autowired
    private final LevelRepo levelRepo;


    public UserService(UserRepo userRepo, LevelRepo levelRepo) {
        this.userRepo = userRepo;
        this.levelRepo = levelRepo;
    }

    public List<User> getAll(){
        return userRepo.findAll();
    }

    public List<User> getAllByLevel(int idLevel){
        return userRepo.findByIdLevel(idLevel);
    }

    public List<User> getAllByRole(String role){
        return userRepo.findByRole(role);
    }

    public User findBySnpassport(String snpassport) { return userRepo.findBySnpassport(snpassport);}

    public void saveUser(User user){

        if (isUserExist(user.getSnpassport()))
            return;

        String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
        user.setPassword(encodedPassword);
        user.setRole("USER");
        user.setIdLevel(1);

        userRepo.save(user);
    }


    public Boolean changeUserInfo(String snpassport, String fullname, String dateOfBirth, String password, String username, String role, int idLevel){
        User user = userRepo.findBySnpassport(snpassport);
        if (user == null) return Boolean.FALSE;

        if (!fullname.equals("-")) user.setFullname(fullname);
        if (!dateOfBirth.equals("-")) user.setDate_of_birth(dateOfBirth);
        if (!password.equals("-")) user.setPassword(password);
        if (!username.equals("-")) user.setUsername(username);
        if (!role.equals("-")) user.setRole(role);

        if (idLevel != -1){
            if (levelRepo.findByIdLevel(idLevel) != null){
                user.setIdLevel(idLevel);
            }
            else return Boolean.FALSE;
        }

        return Boolean.TRUE;
    }

    public Boolean deleteUser(String snpassport){
        User user = userRepo.findBySnpassport(snpassport);
        if (user == null) return Boolean.FALSE;
        userRepo.delete(user);
        return Boolean.TRUE;
    }


    public Boolean isUserExist(String snpassport) {
        return userRepo.findBySnpassport(snpassport) != null;
    }



}
