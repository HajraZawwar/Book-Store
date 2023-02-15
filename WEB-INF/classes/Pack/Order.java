package Pack;
import java.util.*;
public class Order {
    private String orderid;
    private String useremail, totalprice, status;
    public int quantity;

    HashMap<Book,Integer>mp=new HashMap<>();
    public Order() {
        
    }

    public Order(String id, String email, String totalprice, String status,int quantity) {
        this.orderid = id;
        this.useremail = email;
        this.totalprice = totalprice;
        this.status = status;
        this.quantity=quantity;
        mp=new HashMap<>();
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    public void setTotalprice(String totalprice) {
        this.totalprice = totalprice;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setQuantity(int quantity){
        this.quantity=quantity;
    }

    // GETTERS------------------------------>
    public String getOrderid() {
        return this.orderid;
    }

    public String getUseremail() {
        return this.useremail;
    }


    public String getTotalprice() {
        return this.totalprice;
    }

    public String getStatus() {
        return this.status;
    }

    public int getQuantity(){
        return this.quantity;
    }

}
