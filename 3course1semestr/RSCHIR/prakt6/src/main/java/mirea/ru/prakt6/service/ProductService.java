package mirea.ru.prakt6.service;

import mirea.ru.prakt6.model.Product;
import mirea.ru.prakt6.repos.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public List<Product> getProductAll(){
        return productRepository.findAll();
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    public Product createProduct(Product product) {
        return productRepository.save(product);
    }

    public Product reduceAmount(Long id, Integer amount){
        Product exProduct = getProductById(id);
        if (exProduct.getAmount() < amount){
            return null;
        }

        exProduct.setAmount(exProduct.getAmount() - amount);
        productRepository.save(exProduct);
        return exProduct;
    }

    public Product updateProduct(Long id, Product product) {
        Product existingProduct = getProductById(id);
        existingProduct.setName(product.getName());
        existingProduct.setType(product.getType());
        existingProduct.setPrice(product.getPrice());
        return (Product) productRepository.save(existingProduct);
    }

    public void deleteProduct(Long id) {
        Product existingProduct = getProductById(id);
        productRepository.delete(existingProduct);
    }
}
