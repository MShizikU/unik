package mirea.ru.prakt6.controller;

import mirea.ru.prakt6.model.Product;
import mirea.ru.prakt6.model.Product;
import mirea.ru.prakt6.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @PreAuthorize("hasAnyRole('ADMIN', 'SELLER')")
    @GetMapping
    public ResponseEntity<List<Product>> getProductById() {
        return ResponseEntity.ofNullable(productService.getProductAll());
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'SELLER')")
    @GetMapping("/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable Long id) {
        Product product = productService.getProductById(id);
        return ResponseEntity.ok(product);
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'SELLER')")
    @PostMapping
    public ResponseEntity<Product> createProduct(@RequestBody Product product) {
        Product createdProduct = productService.createProduct(product);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdProduct);
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'SELLER')")
    @PutMapping("/{id}")
    public ResponseEntity<Product> updateProduct(@PathVariable Long id, @RequestBody Product product) {
        Product updatedProduct = productService.updateProduct(id, product);
        return ResponseEntity.ok(updatedProduct);
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'SELLER')")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return ResponseEntity.noContent().build();
    }
}
