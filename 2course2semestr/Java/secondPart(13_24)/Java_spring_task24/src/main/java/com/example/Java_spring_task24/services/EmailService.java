package com.example.Java_spring_task24.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;


@Service
@DependsOn("javaMailSender")
public class EmailService {
    private final MailSender mailSender;
    private final String FROM;

    @Autowired
    public EmailService(MailSender mailSender) {
        this.mailSender = mailSender;
        FROM = "test@mail.ru";
    }

    @Async
    public void sendEmail(String text) {
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setFrom(FROM);
        simpleMailMessage.setTo("test@mail.ru");
        simpleMailMessage.setSubject("Test mail");
        simpleMailMessage.setText(text);
        mailSender.send(simpleMailMessage);
    }
}
