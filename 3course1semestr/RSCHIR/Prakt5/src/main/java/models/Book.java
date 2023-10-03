package models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import lombok.Data;
import org.springframework.data.annotation.Id;

import java.math.BigDecimal;

@Entity
@Data
public class Book {
    @jakarta.persistence.Id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "author")
    private String author;

    @Column(name = "seller_id")
    private Long sellerId;

    @Column(name = "product_type")
    private String productType;

    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "name")
    private String name;

}
