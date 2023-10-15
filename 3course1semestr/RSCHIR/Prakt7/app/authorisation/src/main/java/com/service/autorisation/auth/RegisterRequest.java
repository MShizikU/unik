package com.service.autorisation.auth;

public record RegisterRequest(String firstname, String lastname, String email, String password) {}
