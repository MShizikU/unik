package mirea.ru.prakt6.view;

import mirea.ru.prakt6.DTO.AdminBucketDTO;
import mirea.ru.prakt6.DTO.UserBucketDTO;
import mirea.ru.prakt6.model.Bucket;
import mirea.ru.prakt6.model.Contact;
import mirea.ru.prakt6.model.Product;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class BucketViewer {

    public static ArrayList<UserBucketDTO> userBucketViewer(List<Contact> contactList, List<Bucket> bucketList, List<Product> productList){
        ArrayList<UserBucketDTO> result = new ArrayList<>();
        for (Contact contact : contactList){
            UserBucketDTO subResult = new UserBucketDTO();
            subResult.fullName = contact.getName() + " " + contact.getLastname();
            subResult.phoneNumber = contact.getPhoneNumber();

            subResult.productList = new ArrayList<>();

            for(Bucket bucket : bucketList){
                if (bucket.getContactId().equals(contact.getId())){
                    for (Product product : productList){
                        if (product.getId().equals(bucket.getProductId())){
                            subResult.productList.add(product);
                        }
                    }
                }
            }
            result.add(subResult);
        }

        return result;
    }

    public static ArrayList<AdminBucketDTO> adminBucketViewer(List<Contact> contactList, List<Bucket> bucketList, List<Product> productList){
        ArrayList<AdminBucketDTO> result = new ArrayList<>();
        for (Bucket bucket : bucketList){
            AdminBucketDTO subResult = new AdminBucketDTO();
            subResult.bucketId = bucket.getId();
            subResult.contactId = bucket.getContactId();
            subResult.productId = bucket.getProductId();
            subResult.productAmount = bucket.getAmount();

            for (Contact contact : contactList){
                if (contact.getId().equals(bucket.getContactId())){
                    subResult.fullName = contact.getName() + " " + contact.getLastname();
                    subResult.phoneNumber = contact.getPhoneNumber();
                }
            }

            for (Product product : productList){
                if (product.getId().equals(bucket.getProductId())){
                    subResult.productPrice = product.getPrice();
                    subResult.productName = product.getName();
                    subResult.productType = product.getType();
                    subResult.totalPrice = BigDecimal.valueOf(bucket.getAmount()).multiply(product.getPrice());
                }
            }
            result.add(subResult);
        }
        return result;
    }
}
