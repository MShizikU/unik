package ru.mirea.Prakt15.tables;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Entity
@Table(name = "groupss")
@Setter
@Getter
@NoArgsConstructor
public class Post {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "text")
    private String text;

    @Column(name = "creation_date")
    private String creationDate;

    @Override
    public String toString() {
        return "Post{" +
                "text='" + text + '\'' +
                "creationDate='" + creationDate + '\'' +
                '}';
    }
}
