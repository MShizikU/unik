package ru.mirea.prakt14;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
public class UserController {
    private ArrayList<User> list = new ArrayList<>();

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String getTestPage() {
        return "home.html";
    }

    @PostMapping(value = "/add-user")
    @ResponseBody
    public String createStudent(@RequestParam("name") String name,@RequestParam("surname") String surname, @RequestParam("midlename")String midlename, @RequestParam("birthDate")String birthDate) {
        System.out.println(name +" " + surname+" "+midlename);
        User user = new User(name, surname, midlename, birthDate);
        System.out.println(user.getFirstName());
        list.add(user);
        System.out.println(user);
        return user.toString();
    }

    @GetMapping(value = "/show-user")
    @ResponseBody
    public Object[] showStudents() {
        return list.stream()
                .filter(Objects::nonNull).toArray();
    }

    @GetMapping(value = "/delete-user")
    @ResponseBody
    public boolean deleteStudent(@RequestParam("name") String name,@RequestParam("surname") String surname, @RequestParam("midlename")String midlename, @RequestParam("birthDate")String birthDate) {
        List<User> rList = new ArrayList<>();
        list.stream()
                .filter(Objects::nonNull)
                .map(User.class::cast)
                .filter(user -> user.getFirstName().equals(name) &&
                        user.getLastName().equals(surname) &&
                        user.getMiddleName().equals(midlename) &&
                        user.getBirthDate().equals(birthDate))
                .forEach(rList::add);
        list.removeAll(rList);
        return rList.size() != 0;
    }
}

