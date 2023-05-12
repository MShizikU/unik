package ru.mirea.SidorovSD.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import ru.mirea.SidorovSD.Models.User;
import ru.mirea.SidorovSD.Services.UserService;

@Controller
public class RegistrationController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public ModelAndView login() {
        ModelAndView model = new ModelAndView("login");
        return model;
    }

    @GetMapping("/register")
    public ModelAndView register() {
        ModelAndView model = new ModelAndView("register");
        model.addObject("user", new User());
        return model;
    }

    @PostMapping("/register")
    public String saveUser(@ModelAttribute("user") User user) {
        userService.saveUser(user);
        return "redirect:/login";
    }
}
