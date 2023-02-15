import java.io.*;

public class Helpers {

    private static String base_path="C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/Book Store Project/Frontend Modules/Html files";
    private static String jdbc_path="jdbc:mysql://localhost:3307/bookstore";

    public static String get_basePath(){

        return base_path;
    }
    
    public static String get_jdbcpath(){
        return jdbc_path;
    }
    
    public String fetch_file(String path) throws IOException{
        FileInputStream fs = new FileInputStream(path);
        String res="";

        int data;

        while((data=fs.read())!=-1)res+=(char)data;

        fs.close();
        return res;
    }

}
