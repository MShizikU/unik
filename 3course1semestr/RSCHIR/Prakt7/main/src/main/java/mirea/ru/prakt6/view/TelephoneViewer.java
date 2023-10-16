package mirea.ru.prakt6.view;

import mirea.ru.prakt6.DTO.TelephoneDTO;
import mirea.ru.prakt6.model.Telephone;
import mirea.ru.prakt6.model.Contact;
import mirea.ru.prakt6.model.Product;

import java.util.ArrayList;
import java.util.List;

public class TelephoneViewer {
    public static TelephoneDTO createTelephoneView(Telephone telephone, List<Contact> contactList, List<Product> productList){
        TelephoneDTO result = new TelephoneDTO();
        result.manufacturer = telephone.getManufacturer();
        result.batteryCapacity = telephone.getBatteryCapacity();
        result.phoneId = telephone.getId();
        result.productId = telephone.getProductId();
        result.sellerId = telephone.getSellerId();

        for (Contact contact : contactList){
            if (contact.getId().equals(telephone.getSellerId()))
                result.sellerName = contact.getName() + " " + contact.getLastname();
        }

        for (Product product : productList){
            if (product.getId().equals(telephone.getProductId())){
                result.name = product.getName();
                result.price = product.getPrice();
                result.type = product.getType();
            }
        }
        return result;
    }

    public static ArrayList<TelephoneDTO> createTelephonesView(List<Telephone> telephoneList, List<Contact> contactList, List<Product> productList){
        ArrayList<TelephoneDTO> result = new ArrayList<>();
        for (Telephone book : telephoneList){
            TelephoneDTO subResult = createTelephoneView(book, contactList, productList);
            result.add(subResult);
        }

        return result;
    }
}
