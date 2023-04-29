package ru.mirea.SidorovSD.Models;


import jakarta.persistence.*;
import lombok.Data;
import org.springframework.web.bind.annotation.GetMapping;


@Entity
@Data
@Table(name = "Vehicle_model")
public class Vehicle_model {

    @Id
    @Column(name = "ID_model")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idModel;

    @Column(name = "model_name")
    private String modelName;

}
