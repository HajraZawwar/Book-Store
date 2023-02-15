# Book-Store
Dynamic web for a book store having both customer and admin modules. I made this project for my web engineering course using java MVC pattern.
It uses java in backend and jsp for view. Mysql is used as database but you can change it by adding connectors of your database.

Steps to Run this Project:

1. Install java compiler in your PC and also tomcat for deployment ( you can use any other server like jetty etc.)
2. Also install Sql server ( i used version 5.1 ) or xamp. They are available open source.
3. Download the relevant connector for your database server.
4. Set the CATALIANA_HOME, JAVA_HOME, CLASSPATH environment varaibles.
5. Clone this repo and copy the folder to deployment folder. ( Tomcat/webapps in case using tomcat)
7. also the change the jdbc path in WEB-INF/classes/Helpers.java   and  WEB-INF/classes/Pack/DataBaseHandler.java
6. Start the server and visit the Url ( localhost:8080/Book Store Project if you are using tomcat ).
