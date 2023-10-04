package com.example.getcontact.repository;

import com.example.getcontact.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
    List<Book> findByAuthorContainingIgnoreCase(String author);
    List<Book> findBySellerId(Long sellerId);
    List<Book> findByProductTypeContainingIgnoreCase(String productType);
    List<Book> findByPriceLessThanEqual(BigDecimal price);
    List<Book> findByNameContainingIgnoreCase(String name);
}
