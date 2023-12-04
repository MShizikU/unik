package mirea.ru.carsharing.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "vehicles")
public class Vehicle {
    @Id
    @Column(name = "vin")
    private String vin;

    @Column(name = "color")
    private String color;

    @Column(name = "state")
    private String state;

    @Column(name = "place")
    private String place;

    @JoinColumn(name = "id_vehicle_work_model")
    private Integer idVehicleWorkModel;
}
