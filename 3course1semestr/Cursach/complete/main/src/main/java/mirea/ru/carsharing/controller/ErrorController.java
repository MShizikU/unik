package mirea.ru.carsharing.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mirea.ru.carsharing.exceptions.CustomUnathorizedException;
import mirea.ru.carsharing.security.AuthenticationFilter;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.handler.AbstractHandlerExceptionResolver;

import java.util.logging.Logger;

@Component
public class ErrorController extends AbstractHandlerExceptionResolver {

    private static final Logger logger = Logger.getLogger(ErrorController.class.getName());

    @Override
    protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        logger.info("Try resolve exception..." + ex.getMessage());
        if (ex instanceof CustomUnathorizedException) {
            return new ModelAndView("redirect:http://localhost:8081/login");
        } else {
            return new ModelAndView("redirect:http://localhost:8081/login");
        }
    }

}