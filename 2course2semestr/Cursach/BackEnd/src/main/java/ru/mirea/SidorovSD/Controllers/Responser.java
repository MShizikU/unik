package ru.mirea.SidorovSD.Controllers;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

public class Responser {
    public ResponseEntity<String> createResponse(String responseBody){
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.TEXT_PLAIN);
        if (responseBody.equals("OK")) {
            return new ResponseEntity<>(responseBody, headers, HttpStatus.OK);
        }
        else {
            return new ResponseEntity<>(responseBody, headers, HttpStatus.BAD_REQUEST);
        }
    }
}
