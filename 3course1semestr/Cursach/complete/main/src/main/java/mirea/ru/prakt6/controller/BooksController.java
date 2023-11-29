package mirea.ru.prakt6.controller;

import mirea.ru.prakt6.DTO.BookDTO;
import mirea.ru.prakt6.model.Book;
import mirea.ru.prakt6.service.BookService;
import mirea.ru.prakt6.service.ContactService;
import mirea.ru.prakt6.service.ProductService;
import mirea.ru.prakt6.view.BookViewer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/books")
public class BooksController {

    @Autowired
    private BookService bookService;
    @Autowired
    private ContactService contactService;
    @Autowired
    private ProductService productService;

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping
    public ResponseEntity<ArrayList<BookDTO>> getBookAll() {
        return ResponseEntity.ofNullable(BookViewer.createBooksView(bookService.getBookAll(), contactService.getContactAll(), productService.getProductAll()));
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/{id}")
    public ResponseEntity<BookDTO> getBookById(@PathVariable Long id) {
        Book book = bookService.getBookById(id);
        return ResponseEntity.ofNullable(BookViewer.createBookView(book, contactService.getContactAll(), productService.getProductAll()));
    }

    @PreAuthorize("hasRole('SELLER')")
    @PostMapping
    public ResponseEntity<BookDTO> createBook(@RequestBody Book book) {
        Book createdBook = bookService.createBook(book);
        return ResponseEntity.status(HttpStatus.CREATED).body(BookViewer.createBookView(createdBook, contactService.getContactAll(), productService.getProductAll()));
    }

    @PreAuthorize("hasRole('SELLER')")
    @PutMapping("/{id}")
    public ResponseEntity<BookDTO> updateBook(@PathVariable Long id, @RequestBody Book book) {
        Book updatedBook = bookService.updateBook(id, book);
        return ResponseEntity.ofNullable(BookViewer.createBookView(updatedBook, contactService.getContactAll(), productService.getProductAll()));
    }

    @PreAuthorize("hasRole('SELLER')")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBook(@PathVariable Long id) {
        bookService.deleteBook(id);
        return ResponseEntity.noContent().build();
    }
}