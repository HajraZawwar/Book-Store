package Pack;

import java.io.Serializable;

public class Book implements Serializable {
    private String bookid, bookname, author, price, description, category;

    public Book() {

    }

    public Book(String bki,String bkn,String a,String p,String d,String c){
        this.bookid=bki;
        this.bookname=bkn;
        this.author=a;
        this.price=p;
        this.description=d;
        this.category=c;
    }

    public void setBookid(String bookid) {
        this.bookid = bookid;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getBookid() {
        return this.bookid;
    }

    public String getBookname() {
        return this.bookname;
    }

    public String getAuthor() {
        return this.author;
    }

    public String getPrice() {
        return this.price;
    }

    public String getDescription() {
        return this.description;
    }

    public String getCategory() {
        return this.category;
    }

}
