package Pack;

import java.util.*;

public class Cart {
    private String cartid, useremail, items, price, quantity;

    public Cart() {
    }

    public Cart(String id, String email, String items, String p, String q) {
        this.cartid = id;
        this.useremail = email;
        this.items = items;
        this.price = p;
        this.quantity = q;
    }

    public void setCartid(String cartid) {
        this.cartid = cartid;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    public void setItems(String items) {
        this.items = items;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    // _______________________________ GETTERS __________________>

    public String getCartid() {
        return this.cartid;
    }

    public String getUseremail() {
        return this.useremail;
    }

    public String getItems() {
        return this.items;
    }

    public String getPrice() {
        return this.price;
    }

    public String getQuantity() {
        return this.quantity;
    }
}
