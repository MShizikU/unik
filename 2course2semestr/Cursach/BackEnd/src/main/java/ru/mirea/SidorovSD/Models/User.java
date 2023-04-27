package ru.mirea.SidorovSD.Models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "Users")
public class User {

    @Id
    @Column(name = "SNPassport")
    private String stSNPassport;

    @Column(name = "full_name")
    private String stFullName;

    @Column(name = "date_of_birth")
    private String stDateOfBirth;

    @Column(name = "password")
    private String password;

    @Column(name = "username")
    private String username;

    @Column(name = "role")
    private String role;

    @JoinColumn(name = "id_level", referencedColumnName = "id_level")
    private int id_level;

    @Override
    public String toString() {
        return "User{" +
                "stSNPassport='" + stSNPassport + '\'' +
                ", stFullName='" + stFullName + '\'' +
                ", stDateOfBirth='" + stDateOfBirth + '\'' +
                ", iLevelID=" + id_level +
                '}';
    }
}
