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

    @RequestMapping("/login")
    public ModelAndView getLogin(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout, Model model){
        model.addAttribute("error", error != null);
        model.addAttribute("logout", logout != null);
        ModelAndView modelAndView = new ModelAndView("login");
        // add model data if needed
        return modelAndView;
    }



}
