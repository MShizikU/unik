package ru.mirea.SidorovSD.Controllers;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ru.mirea.SidorovSD.Models.User;

@Controller
public class PageController {
    @RequestMapping("/start")
    public ModelAndView getMainPage(){
        ModelAndView modelAndView = new ModelAndView("index");
        return modelAndView;
    }

    @RequestMapping("/profile")
    public ModelAndView getProfilePage(){
        ModelAndView modelAndView = new ModelAndView("profile");
        return modelAndView;
    }






}
