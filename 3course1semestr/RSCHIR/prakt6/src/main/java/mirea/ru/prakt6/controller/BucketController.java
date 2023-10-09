package mirea.ru.prakt6.controller;

import mirea.ru.prakt6.model.Book;
import mirea.ru.prakt6.model.Bucket;
import mirea.ru.prakt6.service.BookService;
import mirea.ru.prakt6.service.BucketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/bucket")
public class BucketController {

    @Autowired
    private BucketService bucketService;

    @GetMapping("/")
    public ResponseEntity<List<Bucket>> getBookAll(){
        return ResponseEntity.ofNullable(bucketService.getBucketAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Bucket> getBucketById(@PathVariable Long id) {
        Bucket bucket = bucketService.getBucketById(id);
        return ResponseEntity.ofNullable(bucket);
    }

    @GetMapping("/{contact_id}")
    public ResponseEntity<List<Bucket>> getBucketByContactId(@PathVariable Long contact_id){
        List<Bucket> bucket = bucketService.getBucketByContactId(contact_id);
        return ResponseEntity.ofNullable(bucket);
    }

    @PostMapping
    public ResponseEntity<Bucket> createBucket(@RequestBody Bucket bucket) {
        Bucket createdBucket = bucketService.createBucketRow(bucket);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdBucket);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Bucket> updateBucket(@RequestBody Bucket bucket) {
        Bucket updateBucketRow = bucketService.updateBucketRow(bucket);
        return ResponseEntity.ofNullable(updateBucketRow);
    }

    @PutMapping("/change_amount")
    public ResponseEntity<Bucket> addProductAmount(@RequestBody Integer amount, @RequestBody Long contact_id, @RequestBody Long product_id){
        Bucket updatedBucketRow = bucketService.addAmount(amount, contact_id, product_id);
        return ResponseEntity.ofNullable(updatedBucketRow);
    }
}