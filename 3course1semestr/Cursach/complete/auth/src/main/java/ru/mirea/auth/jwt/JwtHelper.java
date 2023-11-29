package ru.mirea.auth.jwt;

import com.auth0.jwt.JWTCreator;
import com.nimbusds.jwt.SignedJWT;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwt;
import io.jsonwebtoken.Jwts;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import java.util.Date;

@Component
public class JwtHelper {
    @Value("{app.security.jwt.secret}")
    private String jwtSecret;

    public String createJwtForClaims(String subject, Map<String, String> claims){
        JWTCreator.Builder jwtBuilder = JWT.create().withSubject(subject);
        claims.forEach(jwtBuilder::withClaim);
        return jwtBuilder
                .withNotBefore(new Date())
                .withExpiresAt(DateUtils.addDays(new Date(), 1))
                .sign(Algorithm.HMAC256(jwtSecret));
    }

    public Map<String, Object> extractClaimsFromJwt(String token) {

        try {
            return SignedJWT.parse(token).getJWTClaimsSet().getClaims();
        } catch (ParseException e) {
            return new HashMap<String, Object>();
        }
    }
}
