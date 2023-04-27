package ru.mirea.SidorovSD.Models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "UserLevel")
public class Level {

    @Id
    @Column(name = "ID_level")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int iLevelID;

    @Column(name = "level_name")
    private String stLevelName;

}
