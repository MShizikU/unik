package mirea.ru.prakt6.repos;

import mirea.ru.prakt6.model.Bucket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BucketRepository extends JpaRepository<Bucket, Long> {
    public List<Bucket> findByContactId(Long contact_id);
    public Bucket findByContactIdAndProductId(Long contact_id, Long product_id);
}
