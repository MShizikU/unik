package mirea.ru.prakt6.service;

import mirea.ru.prakt6.model.Book;
import mirea.ru.prakt6.model.Bucket;
import mirea.ru.prakt6.model.Product;
import mirea.ru.prakt6.repos.BucketRepository;
import mirea.ru.prakt6.repos.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BucketService {

    @Autowired
    private BucketRepository bucketRepository;
    @Autowired
    private ProductService productService;

    public List<Bucket> getBucketAll(){
        return bucketRepository.findAll();
    }

    public List<Bucket> getBucketByContactId(Long contact_id){
        return bucketRepository.findByContactId(contact_id);
    }

    public Bucket getBucketByData(Long contact_id, Long product_id){
        return (Bucket) bucketRepository.findByContactIdAndProductId(contact_id, product_id);
    }

    public Bucket getBucketById(Long id){
        return bucketRepository.findById(id).orElse(null);
    }

    public Bucket createBucketRow(Bucket bucket){
        Product exProduct = productService.getProductById(bucket.getProductId());
        if (exProduct != null){
            if (exProduct.getAmount() >= bucket.getAmount()){
                return bucketRepository.save(bucket);
            }
        }
        return null;
    }

    public List<Bucket> createRequest(Long contact_id){
        List<Bucket> userBucket = getBucketByContactId(contact_id);
        for (Bucket bucket : userBucket){
            if (productService.reduceAmount(bucket.getProductId(), bucket.getAmount()) == null){
                userBucket.remove(bucket);
            }
            else{
                bucketRepository.delete(bucket);
            }
        }
        return userBucket;
    }

    public Bucket updateBucketRow(Bucket bucket){
        Bucket exBucket = getBucketById(bucket.getId());
        exBucket.setContactId(bucket.getContactId());
        exBucket.setProductId(bucket.getProductId());
        exBucket.setAmount(bucket.getAmount());
        return (Bucket) bucketRepository.save(exBucket);
    }

    public void deleteBucket(Long id){
        Bucket exBucket = getBucketById(id);
        bucketRepository.delete(exBucket);
    }

    public void deleteUserBucket(Long contact_id){
        List<Bucket> exBuckets = getBucketByContactId(contact_id);
        for (Bucket bucket : exBuckets) bucketRepository.delete(bucket);
    }

    public Bucket addAmount(Integer amount, Long contact_id, Long product_id){
        Bucket exBucket = getBucketByData(contact_id, product_id);
        exBucket.setAmount(exBucket.getAmount() + amount);
        if (amount == 0){
            bucketRepository.delete(exBucket);
            return (Bucket) exBucket;
        }
        return (Bucket) bucketRepository.save(exBucket);
    }
}
