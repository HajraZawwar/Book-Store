package Pack;

import java.io.Serializable;

public class Category implements Serializable {
    private String cname;

    public Category(){

    }

    public Category(String cname){
        this.cname=cname;
    }

    public void setCname(String cname){
        this.cname=cname;
    }

    public String getCname(){

        return this.cname;
    }

    

}
