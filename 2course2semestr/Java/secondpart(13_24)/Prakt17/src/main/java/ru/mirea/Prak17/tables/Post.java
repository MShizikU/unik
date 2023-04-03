package ru.mirea.Prak16.tables;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;


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

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "Users")
    private List<User> users;


    @Override
    public String toString() {
        return "Post{" +
                "text='" + text + '\'' +
                "creationDate='" + creationDate + '\'' +
                '}';
    }
}
