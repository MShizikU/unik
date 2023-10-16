package mirea.ru.prakt6.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Telephone {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "manufacturer")
    private String manufacturer;

    @Column(name = "battery_capacity")
    private Integer batteryCapacity;

    @Column(name = "seller_id")
    private Long sellerId;

    @Column(name = "product_id")
    private Long productId;
}
