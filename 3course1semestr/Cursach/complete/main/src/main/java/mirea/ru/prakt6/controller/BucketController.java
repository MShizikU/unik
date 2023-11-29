package mirea.ru.prakt6.controller;

import mirea.ru.prakt6.model.Bucket;
import mirea.ru.prakt6.service.BucketService;
import mirea.ru.prakt6.service.ContactService;
import mirea.ru.prakt6.service.ProductService;
import mirea.ru.prakt6.DTO.AdminBucketDTO;
import mirea.ru.prakt6.view.BucketViewer;
import mirea.ru.prakt6.DTO.UserBucketDTO;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/bucket")
public class BucketController {

    @Autowired
    private BucketService bucketService;
    @Autowired
    private ContactService contactService;
    @Autowired
    private ProductService productService;

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping
    public ResponseEntity<ArrayList<AdminBucketDTO>> getBucketAll(){
        return ResponseEntity.ofNullable(BucketViewer.adminBucketViewer( contactService.getContactAll(), bucketService.getBucketAll(), productService.getProductAll()));
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/adm/{id}")
    public ResponseEntity<AdminBucketDTO> getBucketById(@PathVariable Long id) {
        Bucket bucket = bucketService.getBucketById(id);
        return ResponseEntity.ofNullable(BucketViewer.singleAdminBucketViewer( bucket, contactService.getContactAll(), productService.getProductAll()));
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'SELLER', 'USER')")
    @GetMapping("/user/{contact_id}")
    public ResponseEntity<UserBucketDTO> getBucketByContactId(@PathVariable Long contact_id){
        return ResponseEntity.ofNullable(BucketViewer.singleUserBucketViewer(contactService.getContactById(contact_id), bucketService.getBucketByContactId(contact_id), productService.getProductAll()));
    }

    @PreAuthorize("hasRole('USER')")
    @PostMapping
    public ResponseEntity<AdminBucketDTO> createBucket(@RequestBody Bucket bucket) {
        Bucket createdBucket = bucketService.createBucketRow(bucket);
        if (createdBucket == null){
            return ResponseEntity.ofNullable(null);
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(BucketViewer.singleAdminBucketViewer( createdBucket, contactService.getContactAll(), productService.getProductAll()));
    }

    @PreAuthorize("hasRole('USER')")
    @PostMapping("/create_request/{contact_id}")
    public ResponseEntity<UserBucketDTO> createRequest(@PathVariable Long contact_id){
        List<Bucket> userBucket = bucketService.createRequest(contact_id);
        return ResponseEntity.ofNullable(BucketViewer.singleUserBucketViewer(contactService.getContactById(contact_id), bucketService.getBucketByContactId(contact_id), productService.getProductAll()));
    }

    @PreAuthorize("hasRole('USER')")
    @PutMapping
    public ResponseEntity<AdminBucketDTO> updateBucket(@RequestBody Bucket bucket) {
        Bucket updateBucketRow = bucketService.updateBucketRow(bucket);
        return ResponseEntity.ofNullable(BucketViewer.singleAdminBucketViewer( updateBucketRow, contactService.getContactAll(), productService.getProductAll()));
    }

    @PreAuthorize("hasRole('USER')")
    @PutMapping("/change_amount")
    public ResponseEntity<AdminBucketDTO> addProductAmount(@RequestBody Bucket bucket){
        Bucket updatedBucketRow = bucketService.addAmount(bucket.getAmount(), bucket.getContactId(), bucket.getProductId());
        return ResponseEntity.ofNullable(BucketViewer.singleAdminBucketViewer( updatedBucketRow, contactService.getContactAll(), productService.getProductAll()));
    }

    @PreAuthorize("hasRole('ADMIN')")
    @DeleteMapping("/adm/delete/{id}")
    public ResponseEntity<ArrayList<AdminBucketDTO>> deleteBucket(@PathVariable Long id){
        bucketService.deleteBucket(id);
        return ResponseEntity.ofNullable(BucketViewer.adminBucketViewer( contactService.getContactAll(), bucketService.getBucketAll(), productService.getProductAll()));
    }

    @PreAuthorize("hasRole('USER')")
    @DeleteMapping("/user/delete/{contact_id}")
    public ResponseEntity<ArrayList<AdminBucketDTO>> deleteBucketByContactId(@PathVariable Long contact_id){
        bucketService.deleteUserBucket(contact_id);
        return ResponseEntity.ofNullable(BucketViewer.adminBucketViewer( contactService.getContactAll(), bucketService.getBucketAll(), productService.getProductAll()));
    }
}