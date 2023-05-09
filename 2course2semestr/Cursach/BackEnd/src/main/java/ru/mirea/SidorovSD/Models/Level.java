package ru.mirea.SidorovSD.Models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "userlevel")
public class Level {

    @Id
    @Column(name = "ID_level")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idLevel;

    @Column(name = "level_name")
    private String levelName;

}
