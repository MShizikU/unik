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
@Table(name = "vehicle_work_model")
public class VehicleWorkModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_vehicle_work_model")
    private Integer idVehicleWorkModel;

    @Column(name = "price_per_hour")
    private Float pricePerHour;

    @JoinColumn(name = "id_vehicle_name")
    private Integer idVehicleName;

    @Column(name = "model_photo_name")
    private String modelPhotoName;

    @Column(name = "id_group")
    @JoinColumn(name = "id_group")
    private Integer idVehicleGroup;
}
