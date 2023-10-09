package mirea.ru.prakt6.service;

import mirea.ru.prakt6.model.Book;
import mirea.ru.prakt6.repos.BooksRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {

    @Autowired
    private BooksRepository bookRepository;

    public List<Book> getBookAll(){
        return bookRepository.findAll();
    }

    public Book getBookById(Long id) {
        return bookRepository.findById(id).orElse(null);
    }

    public Book createBook(Book book) {
        return bookRepository.save(book);
    }

    public Book updateBook(Long id, Book book) {
        Book existingBook = getBookById(id);
        existingBook.setAuthor(book.getAuthor());
        existingBook.setSellerId(book.getSellerId());
        existingBook.setProductId(book.getProductId());
        return (Book) bookRepository.save(existingBook);
    }

    public void deleteBook(Long id) {
        Book existingBook = getBookById(id);
        bookRepository.delete(existingBook);
    }
}
