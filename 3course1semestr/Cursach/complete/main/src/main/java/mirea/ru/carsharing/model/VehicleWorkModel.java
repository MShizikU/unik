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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_vehicle_name")
    private VehicleName vehicleName;

    @Column(name = "model_photo_name")
    private String modelPhotoName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_group")
    private VehicleGroup vehicleGroup;
}