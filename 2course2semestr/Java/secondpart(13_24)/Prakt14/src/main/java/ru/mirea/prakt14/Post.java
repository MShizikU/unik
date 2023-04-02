package ru.mirea.prakt14;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//используем Lombok
@Getter
@Setter
@AllArgsConstructor
public class Post {
    private  String  text, creationDate;

    @Override
    public String toString() {
        return "Post{" +
                "text='" + text + '\'' +
                "creationDate='" + creationDate + '\'' +
                '}';
    }
}
