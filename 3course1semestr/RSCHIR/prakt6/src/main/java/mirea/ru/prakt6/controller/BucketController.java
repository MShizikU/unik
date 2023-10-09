package mirea.ru.prakt6.controller;

import mirea.ru.prakt6.model.Bucket;
import mirea.ru.prakt6.service.BucketService;
import mirea.ru.prakt6.service.ContactService;
import mirea.ru.prakt6.service.ProductService;
import mirea.ru.prakt6.DTO.AdminBucketDTO;
import mirea.ru.prakt6.view.BucketViewer;
import mirea.ru.prakt6.DTO.UserBucketDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/bucket")
public class BucketController {

    @Autowired
    private BucketService bucketService;
    @Autowired
    private ContactService contactService;
    @Autowired
    private ProductService productService;

    @GetMapping
    public ResponseEntity<ArrayList<AdminBucketDTO>> getBucketAll(){
        return ResponseEntity.ofNullable(BucketViewer.adminBucketViewer( contactService.getContactAll(), bucketService.getBucketAll(), productService.getProductAll()));
    }

    @GetMapping("/adm/{id}")
    public ResponseEntity<Bucket> getBucketById(@PathVariable Long id) {
        Bucket bucket = bucketService.getBucketById(id);
        return ResponseEntity.ofNullable(bucket);
    }

    @GetMapping("/user/{contact_id}")
    public ResponseEntity<ArrayList<UserBucketDTO>> getBucketByContactId(@PathVariable Long contact_id){
        return ResponseEntity.ofNullable(BucketViewer.userBucketViewer(contactService.getContactAll(), bucketService.getBucketByContactId(contact_id), productService.getProductAll()));
    }

    @PostMapping
    public ResponseEntity<Bucket> createBucket(@RequestBody Bucket bucket) {
        Bucket createdBucket = bucketService.createBucketRow(bucket);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdBucket);
    }

    @PutMapping
    public ResponseEntity<Bucket> updateBucket(@RequestBody Bucket bucket) {
        Bucket updateBucketRow = bucketService.updateBucketRow(bucket);
        return ResponseEntity.ofNullable(updateBucketRow);
    }

    @PutMapping("/change_amount")
    public ResponseEntity<Bucket> addProductAmount(@RequestBody Bucket bucket){
        Bucket updatedBucketRow = bucketService.addAmount(bucket.getAmount(), bucket.getContactId(), bucket.getProductId());
        return ResponseEntity.ofNullable(updatedBucketRow);
    }

    @DeleteMapping("/adm/delete/{id}")
    public ResponseEntity<ArrayList<AdminBucketDTO>> deleteBucket(@PathVariable Long id){
        bucketService.deleteBucket(id);
        return ResponseEntity.ofNullable(BucketViewer.adminBucketViewer( contactService.getContactAll(), bucketService.getBucketAll(), productService.getProductAll()));
    }

    @DeleteMapping("/user/delete/{contact_id}")
    public ResponseEntity<ArrayList<AdminBucketDTO>> deleteBucketByContactId(@PathVariable Long contact_id){
        bucketService.deleteUserBucket(contact_id);
        return ResponseEntity.ofNullable(BucketViewer.adminBucketViewer( contactService.getContactAll(), bucketService.getBucketAll(), productService.getProductAll()));
    }
}