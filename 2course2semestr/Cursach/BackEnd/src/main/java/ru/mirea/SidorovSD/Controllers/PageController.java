package ru.mirea.SidorovSD.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {
    @RequestMapping("/")
    public ModelAndView getMainPage(){
        ModelAndView modelAndView = new ModelAndView("index");
        // add model data if needed
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
